/* 
 * File:   main.c
 * Author: nenad
 *
 * Created on 22 October 2014, 21:35
 */

#include <stdio.h>
#include <stdlib.h>

#include "mcu_config.h"

#include "driver/adc.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/i2c.h"
#include "driver/intr.h"
#include "driver/rtc.h"
#include "driver/systick.h"
#include "driver/lcd_ili9341.h"
#include "arch/intr_config.h"
#include "main.h"
#include "voc_freq.h"
#include "GenericTypeDefs.h"

#define DIG_POT_ADDR            0x58
#define DIG_POT_RD_CMD          (DIG_POT_ADDR |  0x01u)
#define DIG_POT_WR_CMD          (DIG_POT_ADDR & ~0x01u)

struct i2c_bus g_i2c_bus;

static void board_init_intr(void)
{
    initIntrDriver();
}

static void board_init_clock(void)
{
    initClockDriver();
}

static void board_init_gpio(void)
{
    initGpioDriver();
}

static void board_init_i2c_bus(void)
{
    struct i2c_bus_config i2c_bus_config =
    {
        &I2C5,
        I2C_BUS_ADDRESS_7BIT,
        400000,
        CONFIG_INTR_MAX_ISR_PRIO
    };
    i2c_driver_init();
    i2c_bus_open(&g_i2c_bus, &i2c_bus_config);
}

static void board_init_lcd(void)
{
    lcd_init();
}

#define AD5280_POTA 0
#define AD5280_POTB (0x1u << 7)

static void ad5280_write(struct i2c_bus * bus, uint8_t reg, uint8_t val)
{
    bool success;
    
    i2c_bus_start(bus);
    success = i2c_bus_write(bus, DIG_POT_WR_CMD);

    if (!success) {
        goto error_handler;
    }
    success = i2c_bus_write(bus, reg);

    if (!success) {
        goto error_handler;
    }
    success = i2c_bus_write(bus, val);

    if (!success) {
        goto error_handler;
    }
error_handler:
    i2c_bus_stop(bus);
}

#define VOC_SAMPLES     16

static uint32_t g_raw_value;
/*
 * 
 */
int main(int argc, char** argv)
{
    (void)argc;
    (void)argv;

    TRISD = ~(0x1u << 10);
    LATD |= (0x1u << 10);

    TRISD |= (0x1u << 1u);
    PORTD |= (0x1u << 1u);

    board_init_intr();
    board_init_clock();
    board_init_gpio();
    board_init_i2c_bus();
    voc_freq_init();
    
    ad5280_write(&g_i2c_bus, AD5280_POTA, 33);
    ad5280_write(&g_i2c_bus, AD5280_POTB, 0);

    while (1) {
        uint32_t count;
        uint64_t acc;

        for (count = 0, acc = 0; count < VOC_SAMPLES; count++) {
            while (voc_is_sampling());

            acc += (uint64_t)voc_freq_raw();
        }
        acc /= (uint64_t)VOC_SAMPLES;
        g_raw_value = acc;
    }

    return (EXIT_SUCCESS);
}

