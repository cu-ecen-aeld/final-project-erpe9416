#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define CITY "Boulder"
#define UNITS "imperial"
#define API_KEY "05dc7b23e76e5d6b103c03b98b5e1003"

/*

Used packages:
	dhcpcd                              for configuring network interfaces using DHCP
	wpa_supplicant                      for handling WPA wifi authentication
	brcmfmac-sdio-firmware-rpi-wifi     for loading wifi firmware for rpi
	ntpd                                for syncing internal clock with network
	curl                                for fetching weather data from OpenWeather
	
*/

// Test url: https://api.openweathermap.org/data/2.5/weather?q=Boulder&units=imperial&appid=05dc7b23e76e5d6b103c03b98b5e1003

int clock_is_ready(void) {
    time_t now = time(NULL);
    return now > 1000000000; // sanity check on time since epoch

}

// Search the returned json for "temp:" and "description:" to get strings like 65.8°F, clear sky
void get_weather(void) {
    puts("Smartclock: getting weather");

    char base_command[512];
    snprintf(base_command, sizeof(base_command), "curl -s \"http://api.openweathermap.org/data/2.5/weather?q=%s&units=%s&appid=%s\"", CITY, UNITS, API_KEY);
    //printf("Smartclock: Base command:\n%s\n", base_command);
    
    FILE *fp_raw = popen(base_command, "r");
    if (!fp_raw) {
        puts("Smartclock: failed to run curl");
        return;
    }
    /*
    char line[512];
    puts("Smartclock: Raw JSON response:");
    while (fgets(line, sizeof(line), fp_raw)) {
        printf("%s", line);
    }
    */  
    pclose(fp_raw);

    // Extract temp and description using grep
    char command_temp[1024];
    snprintf(command_temp, sizeof(command_temp),
        "%s | grep -o '\"temp\":[0-9.]*' | head -n1", base_command);
    //printf("\nSmartclock: Running command: %s\n", command_temp);

    char command_desc[1024];
    snprintf(command_desc, sizeof(command_desc),
        "%s | grep -o '\"description\":\"[^\"]*\"' | head -n1", base_command);
    //printf("Smartclock: Running command: %s\n", command_desc);


    char temp[256] = "";
    char desc[256] = "";

    int success = 0;
    
    // Try to access the OpenWeather API up to 3 times
    for (int try = 0; try < 3; try++) {
        FILE *fp_temp = popen(command_temp, "r");
        FILE *fp_desc = popen(command_desc, "r");

        if (!fp_temp || !fp_desc) {
            puts("Smartclock: curl grep failed");
            if (fp_temp) pclose(fp_temp);
            if (fp_desc) pclose(fp_desc);
            continue;
        }

        if (fgets(temp, sizeof(temp), fp_temp) != NULL &&
            fgets(desc, sizeof(desc), fp_desc) != NULL) {
            temp[strcspn(temp, "\n")] = '\0';
            desc[strcspn(desc, "\n")] = '\0';

            printf("Smartclock: %s, %s\n", temp, desc);
            success = 1;

            pclose(fp_temp);
            pclose(fp_desc);
            break;
        }

        pclose(fp_temp);
        pclose(fp_desc);

        if (try < 3) {
            printf("Smartclock: weather get #%d failed, retrying...\n", try + 1);
            usleep(2000000);  // small delay before next try
        }
    }

    if (!success) {
        puts("Smartclock: No weather data received after 3 trys.");
    }
}

int main(void)
{
    puts("Smartclock: Hello, world!");
    
    puts("Smartclock: Waiting for system clock to be set...");
    
    while (!clock_is_ready()) {
        sleep(1);
    }
    
    time_t last_weather_print = 0;
    
    while (1) {
        time_t now = time(NULL);
        struct tm tm;
        localtime_r(&now, &tm);

        // Print time every second
        char buf[64];
        strftime(buf, sizeof(buf), "Smartclock: %Y-%m-%d %H:%M:%S", &tm);
        printf("%s\n", buf);

        // Get the weather every minute
        if (now - last_weather_print >= 60) {
            get_weather();
            last_weather_print = now;
        }

        sleep(1);
    }    
    
    return 0;
}

