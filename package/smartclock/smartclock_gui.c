//#include "lvgl.h"
//#include "lv_drivers/display/fbdev.h"

#include <stdio.h>
#include <time.h>
#include <unistd.h>
/*
#define DISP_BUF_SIZE (LV_HOR_RES_MAX * 80)

lv_obj_t *label_time;

void update_clock_task(lv_timer_t *timer) {
    time_t now = time(NULL);
    struct tm *t = localtime(&now);

    static char time_str[16];
    strftime(time_str, sizeof(time_str), "%H:%M:%S", t);

    lv_label_set_text(label_time, time_str);
}
*/
int main(void)
{
/*
    lv_init();

    // Initialize framebuffer device 
    fbdev_init();

    // Create draw buffer
    static lv_color_t buf[DISP_BUF_SIZE];
    static lv_disp_draw_buf_t draw_buf;
    lv_disp_draw_buf_init(&draw_buf, buf, NULL, DISP_BUF_SIZE);

    // Initialize and register display driver
    static lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);
    disp_drv.draw_buf = &draw_buf;
    disp_drv.flush_cb = fbdev_flush;
    disp_drv.hor_res = 800;
    disp_drv.ver_res = 480;
    lv_disp_drv_register(&disp_drv);

    // Create clock label
    label_time = lv_label_create(lv_scr_act());
    lv_obj_center(label_time);
    lv_obj_set_style_text_font(label_time, &lv_font_montserrat_48, 0);

    // Update every second
    lv_timer_create(update_clock_task, 1000, NULL);

    while (1) {
        lv_timer_handler();
        usleep(5000);
    }
*/
    return 0;

}

