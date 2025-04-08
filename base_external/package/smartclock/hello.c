#include <stdio.h>
#include <time.h>
#include <unistd.h>

int clock_is_ready(void) {
    time_t now = time(NULL);
    return now > 1000000000; // sanity check on time since epoch

}

int main(void)
{
    puts("Smartclock: Hello, world!");
    
    puts("Smartclock: Waiting for system clock to be set...");
    
    while (!clock_is_ready()) {
        sleep(1);
    }
    
    puts("Smartclock: current time:");
    while (1) {
        time_t now = time(NULL);
        struct tm tm;
        localtime_r(&now, &tm);

        char buf[64];
        strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", &tm);
        printf("%s\n", buf);

        sleep(1);
    }    
    
    return 0;
}

