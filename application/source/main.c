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

struct i2c_bus g_i2c1_bus;

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
        &I2C1,
        I2C_BUS_ADDRESS_7BIT,
        400000,
        CONFIG_INTR_MAX_ISR_PRIO
    };

    i2c_driver_init();
    
    i2c_bus_open(&g_i2c1_bus, &i2c_bus_config);
}

static void board_init_lcd(void)
{
    lcd_init();
}

/*
 * 
 */
int main(int argc, char** argv)
{
    (void)argc;
    (void)argv;

    TRISD = ~(0x1u << 10);
    LATD |= (0x1u << 10);
    
    board_init_intr();
    board_init_clock();
    board_init_gpio();
    //board_init_i2c_bus();
    board_init_lcd();
    voc_freq_init();

    while (1) {
        static uint32_t          no;
        static volatile uint64_t raw_value;

        while (voc_is_sampling());
        raw_value += (uint64_t)voc_freq_raw();
        no++;

        if (no == 100) {
            raw_value = raw_value / (uint64_t)100ul;
            no = 0;
        }
    }
    
    return (EXIT_SUCCESS);
}

