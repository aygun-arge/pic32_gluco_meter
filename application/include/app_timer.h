/*
 * File:   app_timer.h
 * Author: nenad
 *
 * Created on April 30, 2014, 12:48 AM
 */

#ifndef APP_TIMER_H
#define	APP_TIMER_H

#include "vtimer/vtimer.h"
#include "eds/epa.h"

#ifdef	__cplusplus
extern "C" {
#endif

struct appTimer {
    esVTimer            timer;
    uint16_t            eventId;
    esEpa *             epa;
};

void app_timer_init(
    struct appTimer *   timer);

void app_timer_start(
    struct appTimer *   timer,
    esSysTimerTick      tick,
    uint16_t            eventId);

void app_timer_cancel(
    struct appTimer *   timer);


esSysTimerTick appTimerGetRemaining(
    const struct appTimer * timer);

#ifdef	__cplusplus
}
#endif

#endif	/* APP_TIMER_H */
