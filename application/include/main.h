/* 
 * File:   main.h
 * Author: nenad
 *
 * Created on 22 October 2014, 23:19
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdbool.h>

extern struct i2c_bus g_i2c_bus;

struct device_state
{
    bool                is_sensor_enabled;
    int                 heater_voltage;
    int                 blowing_time;
};

extern struct device_state g_device_state;

#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

