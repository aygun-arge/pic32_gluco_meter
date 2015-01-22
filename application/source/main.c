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
#include "voc_freq.h"
#include "GenericTypeDefs.h"
#include "gui.h"

#include "draw_main_page.h"

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

/*
 * Brief GUI stuff
 */
void guiReact(guiAction_T action) {
	if (action == GUI_REC_PRESSED) {
		startMeassurePage();
	}
}

int main(int argc, char** argv)
{
    (void)argc;
    (void)argv;

    TRISD = ~(0x1u << 10);
    LATD |= (0x1u << 10);
    
    board_init_intr();
    board_init_clock();
    board_init_gpio();
    board_init_i2c_bus();

    guiInit();
    guiStart();

    drawMainPageResistanceString();
    mainPageParameters_T mpParams;

    mpParams.sensorResistance = 84.32;
    mpParams.heaterVoltage = 5.28;
    mpParams.current =	131;
    mpParams.temperature = 56;
    drawMainPageParametars(&mpParams);
    resistanceValues_T rValues;

    rValues.ro = 31.2;
    rValues.rmax = 35.3;
    rValues.rmin = 10.42;
    drawMainPageResistanceValues(&rValues);

    while (1) {
        guiExe();
    }

    for (;;);
    
    return (EXIT_SUCCESS);
}

