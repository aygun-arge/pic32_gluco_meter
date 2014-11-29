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
        100000,
        CONFIG_INTR_MAX_ISR_PRIO
    };
    i2c_driver_init();
    i2c_bus_open(&g_i2c_bus, &i2c_bus_config);
}

static void board_init_lcd(void)
{
    lcd_init();
}

#define MLX90614_ADDRESS                (0xb4)
#define MLX90614_RD                     (MLX90614_ADDRESS |  0x1u)
#define MLX90614_WR                     (MLX90614_ADDRESS)

static uint16_t mlx90614_read_temp(struct i2c_bus * bus)
{
    bool                        success;
    uint8_t                     buff[2];
    uint16_t                    retval;

    i2c_bus_start(bus);
    success = i2c_bus_write(bus, MLX90614_WR);

    if (!success) {
        goto failure;
    }
    success = i2c_bus_write(bus, 0x07);

    if (!success) {
        goto failure;
    }
    i2c_bus_restart(bus);
    success = i2c_bus_write(bus, MLX90614_RD);

    if (!success) {
        goto failure;
    }
    buff[0] = i2c_bus_read(bus);
    i2c_bus_ack(bus);
    buff[1] = i2c_bus_read(bus);
    i2c_bus_nack(bus);
    i2c_bus_stop(bus);

    retval = ((uint16_t)buff[1] << 8u) | (uint16_t)buff[0];

    return (retval);
failure:
    i2c_bus_stop(bus);

    return (0);
}

/*
 * 
 */
int main(int argc, char** argv)
{
    uint32_t count;
    double temperature;

    (void)argc;
    (void)argv;

    board_init_intr();
    board_init_clock();
    board_init_gpio();
    board_init_i2c_bus();

    for (count = 0; count < 1000000ul; count++);

    while (1) {
        temperature = mlx90614_read_temp(&g_i2c_bus);
        temperature *= 0.02;
        temperature -= 273.15;
        temperature -= 0.01;
    }

    return (EXIT_SUCCESS);
}

