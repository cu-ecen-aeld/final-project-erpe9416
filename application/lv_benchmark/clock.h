// clock.h
#ifndef CLOCK_H
#define CLOCK_H

#include "lvgl.h"

/**
 * Initialize the clock screen and all UI elements.
 *  - Sets up background, sidebar, clock, alarm label, and starts the timer.
 */
void clock_app_init(void);

/**
 * Update the alarm label text.
 * @param time_str  A string like "06:30 AM". Pass NULL or empty string to clear.
 */
void set_alarm_time(const char * time_str);

#endif // CLOCK_H

