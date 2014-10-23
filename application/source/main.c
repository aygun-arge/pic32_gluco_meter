/* 
 * File:   main.c
 * Author: nenad
 *
 * Created on 22 October 2014, 21:35
 */

#include <stdio.h>
#include <stdlib.h>

#include "driver/adc.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/i2c.h"
#include "driver/intr.h"
#include "driver/rtc.h"
#include "driver/systick.h"
#include "arch/intr_config.h"
#include "main.h"

struct i2c_bus g_i2c1_bus;

static void board_init_intr(void)
{
    initIntrDriver();
}

static void board_init_clock(void)
{
    initClockDriver();
}

static void board_init_i2c_bus(void)
{
    struct i2cConfig i2c_bus_config =
    {
        &I2C1,
        I2C_ADDRESS_7BIT,
        100000,
        CONFIG_INTR_MAX_ISR_PRIO
    };

    initI2cDriver();
    
    i2cOpen(&g_i2c1_bus, &i2c_bus_config);
}

#define DIG_POT_ADDR            0x58
#define DIG_POT_RD_CMD          (DIG_POT_ADDR |  0x01u)
#define DIG_POT_WR_CMD          (DIG_POT_ADDR & ~0x01u)

/*
 * 
 */
int main(int argc, char** argv) {

    static volatile bool success;

    board_init_intr();
    board_init_clock();
    board_init_i2c_bus();

    rtc_init_driver(&g_i2c1_bus);

    TRISD |= (0x1u << 1u);
    PORTD |= (0x1u << 1u);

    i2cStart(&g_i2c1_bus);
    success = i2cWrite(&g_i2c1_bus, DIG_POT_WR_CMD);

    if (!success) {
        goto error_handler;
    }
    success = i2cWrite(&g_i2c1_bus, 0);

    if (!success) {
        goto error_handler;
    }
    success = i2cWrite(&g_i2c1_bus, 128);

    if (!success) {
        goto error_handler;
    }
    i2cStop(&g_i2c1_bus);

    while (1);

    return (EXIT_SUCCESS);

error_handler:
    while (1);

    return (EXIT_FAILURE);
}

