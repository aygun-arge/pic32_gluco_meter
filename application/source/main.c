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

static void board_init_gpio(void)
{
    initGpioDriver();
}

static void board_init_i2c_bus(void)
{
    struct i2c_config i2c_bus_config =
    {
        &I2C1,
        I2C_ADDRESS_7BIT,
        400000,
        CONFIG_INTR_MAX_ISR_PRIO
    };

    i2c_driver_init();
    
    i2c_bus_open(&g_i2c1_bus, &i2c_bus_config);
}

#define DIG_POT_ADDR            0x58
#define DIG_POT_RD_CMD          (DIG_POT_ADDR |  0x01u)
#define DIG_POT_WR_CMD          (DIG_POT_ADDR & ~0x01u)

#define INA_ADDR                0x80
#define INA_RD_CMD              (INA_ADDR |  0x01u)
#define INA_WR_CMD              (INA_ADDR & ~0x01u)
#define INA_SHUNT_REG           0x01
#define INA_BUS_REG             0x02

/*
 * 
 */
int main(int argc, char** argv) {

    static volatile bool success;
    static volatile uint16_t reg;
    static float bus_voltage;

    board_init_intr();
    board_init_clock();
    board_init_gpio();
    board_init_i2c_bus();

    //rtc_init_driver(&g_i2c1_bus);

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
    success = i2cWrite(&g_i2c1_bus, 255);

    if (!success) {
        goto error_handler;
    }
    i2cStop(&g_i2c1_bus);

    i2cStart(&g_i2c1_bus);
    success = i2cWrite(&g_i2c1_bus, DIG_POT_RD_CMD);
    reg = i2cRead(&g_i2c1_bus);
    i2c_bus_nack(&g_i2c1_bus);
    i2cStop(&g_i2c1_bus);

    while (1) {
        i2cStart(&g_i2c1_bus);
        success = i2cWrite(&g_i2c1_bus, INA_WR_CMD);

        if (!success) {
            goto error_handler;
        }
        success = i2cWrite(&g_i2c1_bus, INA_BUS_REG);
        i2cStop(&g_i2c1_bus);
        i2cStart(&g_i2c1_bus);

        success = i2cWrite(&g_i2c1_bus, INA_RD_CMD);

        if (!success) {
            goto error_handler;
        }
        reg  = (uint16_t)i2cRead(&g_i2c1_bus) << 8;
        i2c_bus_ack(&g_i2c1_bus);
        reg |= (uint16_t)i2cRead(&g_i2c1_bus);
        i2c_bus_nack(&g_i2c1_bus);
        i2cStop(&g_i2c1_bus);
        reg = reg >> 3;
        bus_voltage = reg * 3.9f;
    }

    return (EXIT_SUCCESS);

error_handler:
    i2cStop(&g_i2c1_bus);
    while (1);

    return (EXIT_FAILURE);
}

