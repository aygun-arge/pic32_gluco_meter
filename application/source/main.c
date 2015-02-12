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

#include "vtimer/vtimer.h"
#include "mem/static.h"
#include "mem/mem_class.h"
#include "eds/epa.h"
#include "sm_gui.h"
#include "driver/ad5242.h"

struct i2c_bus g_i2c_bus;

static uint8_t                  g_static_storage[1024];
static uint8_t                  g_heap_storage[4096];
static esMem                    g_static_mem;
static esMem                    g_heap_mem;
static struct ad5242_handle     g_ad5242;

static void board_init_intr(void)
{
    initIntrDriver();
}

static void board_init_clock(void)
{
    initClockDriver();
    initSysTickDriver();
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

int main(int argc, char** argv)
{
    esError             err;
    (void)argc;
    (void)argv;

    DDPCONbits.JTAGEN = 0;

    board_init_intr();
    board_init_clock();
    board_init_gpio();
    board_init_i2c_bus();

    voc_freq_init();
    err = ad5242_init_driver(&g_ad5242, &g_i2c_bus, 0);

    if (err) {
        goto FAIL_AD5242_INIT;
    }
    err = ad5242_set_pot1(&g_ad5242, 100);

    if (err) {
        goto FAIL_AD5242_INIT;
    }

    /*-- eSolid --------------------------------------------------------------*/
    esEdsInit();
    esModuleVTimerInit();
    esMemInit(&esGlobalStaticMemClass, &g_static_mem, g_static_storage, sizeof(g_static_storage), 0);
    esMemInit(&esGlobalHeapMemClass, &g_heap_mem, g_heap_storage, sizeof(g_heap_storage), 0);
    esEventRegisterMem(&g_heap_mem);
    esEpaCreate(&g_gui_epa, &g_gui_sm, &g_static_mem, &g_gui);

    esEdsStart();

    return (EXIT_SUCCESS);
FAIL_AD5242_INIT:

    return (EXIT_FAILURE);
}

