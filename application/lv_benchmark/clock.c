#include "lvgl.h"
#include <time.h>
#include <stdio.h>
#include "clock.h"
#include "img/WeatherIcons.h"
#include <stdlib.h>
#include <string.h>


// For running on simulator
#ifdef _WIN32
    #define popen _popen
    #define pclose _pclose
#endif


// ================= Local GUI variables =================
static lv_obj_t* clock_label;
static lv_obj_t* month_label;
static lv_obj_t* year_label;
static lv_obj_t* temp_label;
static lv_obj_t* alarm_label;

#define NUM_FORECAST_DAYS 6

static lv_obj_t* day_labels[NUM_FORECAST_DAYS];
static lv_obj_t* date_labels[NUM_FORECAST_DAYS];
static lv_obj_t* forecast_boxes[NUM_FORECAST_DAYS];

static lv_obj_t* current_weather_icon = NULL;

static lv_obj_t* forecast_icons[NUM_FORECAST_DAYS];

// ========================================================


// ================= For OpenWeather API =================
#define CITY "Boulder"
#define UNITS "imperial"
#define API_KEY "05dc7b23e76e5d6b103c03b98b5e1003"
// ========================================================

// ---------------- SETUP SCREEN ----------------
static void setup_screen(void)
{
    lv_obj_t* scr = lv_scr_act();

    // Background
    lv_obj_set_style_bg_color(scr, lv_color_black(), 0);
    lv_obj_set_style_bg_grad_color(scr, lv_color_hex(0x222222), 0);
    lv_obj_set_style_bg_grad_dir(scr, LV_GRAD_DIR_VER, 0);

    // Yellow bar
    lv_obj_t* yellow_bar = lv_obj_create(scr);
    lv_obj_set_size(yellow_bar, 120, LV_PCT(100));
    lv_obj_set_style_bg_color(yellow_bar, lv_color_hex(0xFFFF00), 0);
    lv_obj_set_style_bg_grad_color(yellow_bar, lv_color_hex(0xFFA500), 0);
    lv_obj_set_style_bg_grad_dir(yellow_bar, LV_GRAD_DIR_VER, 0);
    lv_obj_set_style_border_width(yellow_bar, 0, 0);
    lv_obj_set_style_radius(yellow_bar, 0, 0);
    lv_obj_set_align(yellow_bar, LV_ALIGN_LEFT_MID);
    lv_obj_set_x(yellow_bar, 150);

    // Month + Year
    month_label = lv_label_create(yellow_bar);
    lv_label_set_text(month_label, "4");
    lv_obj_set_style_text_color(month_label, lv_color_black(), 0);
    lv_obj_set_style_text_font(month_label, &optima_48, 0);
    lv_obj_align(month_label, LV_ALIGN_BOTTOM_MID, 0, -60);

    year_label = lv_label_create(yellow_bar);
    lv_label_set_text(year_label, "2011");
    lv_obj_set_style_text_color(year_label, lv_color_black(), 0);
    lv_obj_set_style_text_font(year_label, &optima_24, 0);
    lv_obj_align(year_label, LV_ALIGN_BOTTOM_MID, 0, -30);

    // Temperature Label
    temp_label = lv_label_create(yellow_bar);
    lv_label_set_text(temp_label, "72.0°F");
    lv_obj_set_style_text_color(temp_label, lv_color_black(), 0);
    lv_obj_set_style_text_font(temp_label, &optima_24, 0);
    lv_obj_align(temp_label, LV_ALIGN_TOP_MID, 0, 200);

    // Forecast Boxes Setup
    lv_coord_t screen_width = lv_obj_get_width(scr);
    lv_coord_t box_width = 80;
    lv_coord_t total_width = NUM_FORECAST_DAYS * box_width;
    lv_coord_t spacing = (screen_width - total_width) / (NUM_FORECAST_DAYS + 1);
    lv_coord_t y_pos = 115;

    for (int i = 0; i < NUM_FORECAST_DAYS; i++) {
        // Create forecast box
        forecast_boxes[i] = lv_obj_create(scr);
        lv_obj_set_size(forecast_boxes[i], box_width, box_width);
        lv_obj_set_style_bg_color(forecast_boxes[i],
            (i == 1) ? lv_color_hex(0x444444) : lv_color_hex(0x222222), 0);
        lv_obj_set_style_border_width(forecast_boxes[i], 0, 0);
        lv_obj_set_style_radius(forecast_boxes[i], 8, 0);

        lv_coord_t x_pos = spacing + i * (box_width + spacing);
        lv_obj_set_pos(forecast_boxes[i], x_pos, y_pos);

        lv_obj_clear_flag(forecast_boxes[i], LV_OBJ_FLAG_SCROLLABLE);

        // Add weather icon inside forecast box
        forecast_icons[i] = lv_image_create(forecast_boxes[i]);   
        lv_image_set_src(forecast_icons[i], &PartlyCloudy);        // default starting icon
        lv_obj_center(forecast_icons[i]);

        // Add day label above the box
        day_labels[i] = lv_label_create(scr);
        lv_label_set_text(day_labels[i], "DAY");
        lv_obj_set_style_text_color(day_labels[i],
            (i == 1) ? lv_color_black() : lv_color_hex(0x222222), 0);
        lv_obj_set_style_text_font(day_labels[i], &optima_24, 0);
        lv_obj_align(day_labels[i], LV_ALIGN_TOP_LEFT, x_pos + 15, y_pos - 90);

        // Add date label below day label
        date_labels[i] = lv_label_create(scr);
        lv_label_set_text(date_labels[i], "00");
        lv_obj_set_style_text_color(date_labels[i],
            (i == 1) ? lv_color_black() : lv_color_hex(0x222222), 0);
        lv_obj_set_style_text_font(date_labels[i], &optima_48, 0);
        lv_obj_align_to(date_labels[i], day_labels[i], LV_ALIGN_OUT_BOTTOM_MID, 0, 0);
    }


    // Clock label
    clock_label = lv_label_create(scr);
    lv_label_set_text(clock_label, "00:00:00");
    lv_obj_set_width(clock_label, 300);
    lv_obj_align(clock_label, LV_ALIGN_BOTTOM_RIGHT, -120, -120);
    lv_obj_set_style_text_font(clock_label, &optima_72, 0);
    lv_obj_set_style_text_color(clock_label, lv_color_hex(0xCCCCCC), 0);
    lv_obj_set_style_text_align(clock_label, LV_TEXT_ALIGN_CENTER, 0);

    // Alarm label
    alarm_label = lv_label_create(scr);
    lv_label_set_text(alarm_label, "--:--");
    lv_obj_set_width(alarm_label, 250);
    lv_obj_align_to(alarm_label, clock_label, LV_ALIGN_OUT_BOTTOM_MID, 0, 10);
    lv_obj_set_style_text_font(alarm_label, &optima_24, 0);
    lv_obj_set_style_text_color(alarm_label, lv_color_hex(0x888888), 0);
    lv_obj_set_style_text_align(alarm_label, LV_TEXT_ALIGN_CENTER, 0);
}
// ---------------- END SETUP SCREEN ----------------


// ---------------- SET WEATHER ICON ----------------
void set_weather_icon(int weather_id)
{
    const lv_image_dsc_t* icon_src = &Sunny;  // Default

    if (weather_id >= 200 && weather_id < 300) {
        icon_src = &Thunderstorm;
    }
    else if (weather_id >= 300 && weather_id < 400) {
        icon_src = &Rain; // drizzle
    }
    else if (weather_id >= 500 && weather_id < 600) {
        icon_src = &Rain; // rain
    }
    else if (weather_id >= 600 && weather_id < 700) {
        icon_src = &Snow; // snow
    }
    else if (weather_id >= 700 && weather_id < 800) {
        icon_src = &Fog; // atmosphere (mist, smoke, etc)
    }
    else if (weather_id == 800) {
        icon_src = &Sunny; // clear
    }
    else if (weather_id == 801) {
        icon_src = &PartlyCloudy; // Special case: partly cloudy
    }
    else if (weather_id > 801 && weather_id < 900) {
        icon_src = &Cloudy; // overcast clouds, etc.
    }
    else {
        icon_src = &Sunny; // fallback
    }

    // Set the second forecast box
    lv_image_set_src(forecast_icons[1], icon_src);

    // Set random weather for other forecast days as you need a premium OpenWeather subscription to get forecasts
    const lv_image_dsc_t* random_icons[] = {
        &Cloudy,
        &Cloudy,
        &PartlyCloudy,
        &Thunderstorm,
        &Sunny,
        &Rain
    };

    for (int i = 0; i < NUM_FORECAST_DAYS; i++) {
        if (i == 1) continue; // skip the real weather box (day 2 uses real data)
        lv_img_set_src(forecast_icons[i], random_icons[i]);
    }
}



// ---------------- END SET WEATHER ICON ----------------



// ---------------- GET WEATHER ----------------
void get_weather(void)
{
    puts("Smartclock: getting weather");

    char base_command[512];
    snprintf(base_command, sizeof(base_command),
        "curl -s \"http://api.openweathermap.org/data/2.5/weather?q=%s&units=%s&appid=%s\"",
        CITY, UNITS, API_KEY);

    FILE* fp_raw = popen(base_command, "r");
    if (!fp_raw) {
        puts("Smartclock: failed to run curl");
        return;
    }

    // Read entire JSON response into a buffer
    char json[4096] = { 0 };
    fread(json, 1, sizeof(json) - 1, fp_raw);
    pclose(fp_raw);

    if (strlen(json) == 0) {
        puts("Smartclock: empty JSON response");
        return;
    }

    // --- Search for fields:
    char* temp_ptr = strstr(json, "\"temp\":");
    char* desc_ptr = strstr(json, "\"description\":\"");
    char* id_ptr = strstr(json, "\"id\":");

    if (!temp_ptr || !desc_ptr || !id_ptr) {
        puts("Smartclock: failed to find temp, description, or id in JSON");
        return;
    }

    // --- Parse temperature
    temp_ptr += strlen("\"temp\":");
    float temperature = atof(temp_ptr);

    // --- Parse description
    desc_ptr += strlen("\"description\":\"");
    char description[128] = { 0 };
    int i = 0;
    while (*desc_ptr && *desc_ptr != '"' && i < (int)(sizeof(description) - 1)) {
        description[i++] = *desc_ptr++;
    }
    description[i] = '\0';

    // --- Parse weather ID
    id_ptr += strlen("\"id\":");
    int weather_id = atoi(id_ptr);

    printf("Smartclock: parsed temp=%.1f°F description=%s id=%d\n", temperature, description, weather_id);

    // --- Update the labels separately
    char temp_text[64];
    snprintf(temp_text, sizeof(temp_text), "%.1f°F", temperature);

    lv_label_set_text(temp_label, temp_text);     // Temperature label
    lv_label_set_text(alarm_label, description);  // Weather description label

    // Use weather_id to select the right weather icon
    set_weather_icon(weather_id);
}
// ---------------- END GET WEATHER ----------------


static void update_date_task(lv_timer_t* timer)
{
    (void)timer;
    time_t now = time(NULL);

    now -= 24 * 60 * 60;   // Move back 1 day manually (minus 1 day)

    struct tm t = *localtime(&now);
    char buf[16];

    // --- Update Month ---
    snprintf(buf, sizeof(buf), "%d", t.tm_mon + 1);   // tm_mon is 0-11
    lv_label_set_text(month_label, buf);

    // --- Update Year ---
    snprintf(buf, sizeof(buf), "%d", t.tm_year + 1900);  // tm_year is years since 1900
    lv_label_set_text(year_label, buf);

    // --- Update Forecast Days and Dates ---
    for (int i = 0; i < NUM_FORECAST_DAYS; i++) {
        struct tm f = t;
        f.tm_mday += i;    // Today + i
        mktime(&f);        // Normalize

        // Day name ("Mon", "Tue", etc.)
        strftime(buf, sizeof(buf), "%a", &f);
        lv_label_set_text(day_labels[i], buf);

        // Day number ("01", "15", etc.)
        strftime(buf, sizeof(buf), "%d", &f);
        lv_label_set_text(date_labels[i], buf);
    }
}




static void update_clock_task(lv_timer_t* timer)
{
    time_t now = time(NULL);
    struct tm* t = localtime(&now);

    static char time_str[16];
    strftime(time_str, sizeof(time_str), "%H:%M:%S", t);

    lv_label_set_text(clock_label, time_str);
}

void clock_app_init(void)
{

    setup_screen();

    update_date_task(NULL);

    get_weather();

    lv_timer_create(update_clock_task, 1000, NULL);
    lv_timer_create(update_date_task, 60 * 60 * 1000, NULL);
}

