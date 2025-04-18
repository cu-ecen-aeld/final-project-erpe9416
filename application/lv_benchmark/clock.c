// clock.c
#include "clock.h"
#include "lvgl/lvgl.h"
#include <time.h>
#include <stdio.h>
#include <unistd.h>

// Internal prototypes
static void setup_screen(void);
static void update_clock_task(lv_timer_t * timer);

// Global objects created in clock_app_init
static lv_obj_t* clock_label;
lv_obj_t* day_label;
lv_obj_t* date_label;
lv_obj_t* weather_icon_bg;

#define NUM_FORECAST_DAYS 6

static lv_obj_t* day_labels[NUM_FORECAST_DAYS];
static lv_obj_t* date_labels[NUM_FORECAST_DAYS];
static lv_obj_t* forecast_boxes[NUM_FORECAST_DAYS];

static lv_obj_t* month_label;
static lv_obj_t* year_label;
static lv_obj_t* alarm_label;

static lv_obj_t* temp_label;

LV_IMAGE_DECLARE(PartlyCloudy);



void clock_app_init(void) {
    setup_screen();

    clock_label = lv_label_create(lv_scr_act());
    lv_label_set_text(clock_label, "00:00:00");
    lv_obj_set_width(clock_label, 300);
    lv_obj_align(clock_label, LV_ALIGN_BOTTOM_RIGHT, -120, -120);
    lv_obj_set_style_text_font(clock_label, &optima_72, 0);
    lv_obj_set_style_text_color(clock_label, lv_color_hex(0xCCCCCC), 0);
    lv_obj_set_style_text_align(clock_label, LV_TEXT_ALIGN_CENTER, 0);

    alarm_label = lv_label_create(lv_scr_act());
    lv_label_set_text(alarm_label, "--:--"); // Default placeholder
    lv_obj_set_width(alarm_label, 250);
    lv_obj_align_to(alarm_label, clock_label, LV_ALIGN_OUT_BOTTOM_MID, 0, 10); // Just below the clock
    lv_obj_set_style_text_font(alarm_label, &optima_24, 0);
    lv_obj_set_style_text_color(alarm_label, lv_color_hex(0x888888), 0); // A little dimmer
    lv_obj_set_style_text_align(alarm_label, LV_TEXT_ALIGN_CENTER, 0);

    lv_timer_create(update_clock_task, 1000, NULL);
}

void set_alarm_time(const char* time_str) {
    char buf[32];
    if(time_str && time_str[0]) {
        snprintf(buf, sizeof(buf), "Alarm: %s", time_str);
    } else {
        snprintf(buf, sizeof(buf), "");
    }
    lv_label_set_text(alarm_label, buf);
}

//--------------------------------------------------------------------------------
// Internal implementation
//--------------------------------------------------------------------------------
void setup_screen(void)
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
    lv_label_set_text(temp_label, "72.0°F");  // Default temperature
    lv_obj_set_style_text_color(temp_label, lv_color_black(), 0);
    lv_obj_set_style_text_font(temp_label, &optima_24, 0); 
    lv_obj_align(temp_label, LV_ALIGN_TOP_MID, 0, 200); // Top middle with a downward offset


    // --- Forecast Boxes Setup ---
    lv_coord_t screen_width = lv_obj_get_width(scr);
    lv_coord_t box_width = 80;
    lv_coord_t total_width = NUM_FORECAST_DAYS * box_width;
    lv_coord_t spacing = (screen_width - total_width) / (NUM_FORECAST_DAYS + 1);
    lv_coord_t y_pos = 115;

    for (int i = 0; i < NUM_FORECAST_DAYS; i++) {
        // Box
        forecast_boxes[i] = lv_obj_create(scr);
        lv_obj_set_size(forecast_boxes[i], box_width, box_width);
        lv_obj_set_style_bg_color(forecast_boxes[i],
            (i == 1) ? lv_color_hex(0x444444) : lv_color_hex(0x222222), 0);
        lv_obj_set_style_border_width(forecast_boxes[i], 0, 0);
        lv_obj_set_style_radius(forecast_boxes[i], 8, 0);

        lv_coord_t x_pos = spacing + i * (box_width + spacing);
        lv_obj_set_pos(forecast_boxes[i], x_pos, y_pos);

        lv_obj_clear_flag(forecast_boxes[i], LV_OBJ_FLAG_SCROLLABLE);

        // Add image inside the forecast box
        lv_obj_t* weather_icon = lv_image_create(forecast_boxes[i]); // <--- parent = forecast box
        lv_image_set_src(weather_icon, &PartlyCloudy);
        lv_obj_center(weather_icon);  // center it inside the box

        // Day label
        day_labels[i] = lv_label_create(scr);
        lv_label_set_text(day_labels[i], "DAY");
        lv_obj_set_style_text_color(day_labels[i],
            (i == 1) ? lv_color_black() : lv_color_hex(0x222222), 0);
        lv_obj_set_style_text_font(day_labels[i], &optima_24, 0);
        lv_obj_align(day_labels[i], LV_ALIGN_TOP_LEFT, x_pos + 15, y_pos - 90);

        // Date label
        date_labels[i] = lv_label_create(scr);
        lv_label_set_text(date_labels[i], "00");
        lv_obj_set_style_text_color(date_labels[i],
            (i == 1) ? lv_color_black() : lv_color_hex(0x222222), 0);
        lv_obj_set_style_text_font(date_labels[i], &optima_48, 0);
        lv_obj_align_to(date_labels[i], day_labels[i], LV_ALIGN_OUT_BOTTOM_MID, 0, 0);
    }
}

static void update_clock_task(lv_timer_t* timer) {
    (void) timer;
    time_t now = time(NULL);
    struct tm* t = localtime(&now);
    char buf[16];
    strftime(buf, sizeof(buf), "%H:%M:%S", t);
    lv_label_set_text(clock_label, buf);
}

