/* 
 * File:   main.c
 * Author: nenad
 *
 * Created on 22 October 2014, 21:35
 */

/*=========================================================  INCLUDE FILES  ==*/

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
#include "driver/s25fl.h"
#include "arch/intr_config.h"
#include "main.h"
#include "voc.h"

#include "vtimer/vtimer.h"
#include "mem/static.h"
#include "mem/mem_class.h"
#include "eds/epa.h"
#include "sm_gui.h"
#include "sm_voc.h"

#include "USB/usb.h"
#include "USB/usb_host_msd.h"
#include "app_buzzer.h"
#include "TimeDelay.h"

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static void board_init_early(void);
static void board_init_late(void);
static void idle_hook(void);

/*=======================================================  LOCAL VARIABLES  ==*/

static const ES_MODULE_INFO_CREATE("main", "Main module", "Nenad Radulovic");
static uint8_t                  g_static_storage[1024];
static uint8_t                  g_heap_storage[4096];
static esMem                    g_static_mem;
static esMem                    g_heap_mem;

/*======================================================  GLOBAL VARIABLES  ==*/

struct i2c_bus                  g_i2c_bus;

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static void board_init_early(void)
{
    /* Turn off FUCKING JTAG. */
    DDPCONbits.JTAGEN = 0;

    initIntrDriver();
    initClockDriver();
    initSysTickDriver();
    initGpioDriver();
    buzzer_init();
    buzzer_beep(20);
}

static void board_init_late(void)
{
    static const struct i2c_bus_config i2c_bus_config =
    {
        &g_I2C5,
        I2C_BUS_ADDRESS_7BIT,
        100000,
        CONFIG_INTR_MAX_ISR_PRIO
    };
    i2c_driver_init();
    i2c_bus_open(&g_i2c_bus, &i2c_bus_config);
    rtc_init_driver(&g_i2c_bus);
    voc_init();
    USBInitialize(0);
    initFlashDriver();
}

static void idle_hook(void)
{
    USBTasks();
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

int main(int argc, char** argv)
{
    (void)argc;
    (void)argv;

    board_init_early();

    /*-- eSolid --------------------------------------------------------------*/
    esEdsInit();
    esEdsSetIdle(idle_hook);
    esMemInit(&esGlobalStaticMemClass, &g_static_mem, g_static_storage, sizeof(g_static_storage), 0);
    esMemInit(&esGlobalHeapMemClass, &g_heap_mem, g_heap_storage, sizeof(g_heap_storage), 0);

    board_init_late();
    
    esEventRegisterMem(&g_heap_mem);
    esEpaCreate(&g_gui_epa, &g_gui_sm, &g_static_mem, &g_gui);
    esEpaCreate(&g_voc_epa, &g_voc_sm, &g_static_mem, &g_voc);

    esEdsStart();

    return (EXIT_SUCCESS);
}

/****************************************************************************
  Function:
    BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event,
                void *data, DWORD size )

  Summary:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.

  Description:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.  If the application is able to handle the event, it
    returns TRUE.  Otherwise, it returns FALSE.

  Precondition:
    None

  Parameters:
    BYTE address    - Address of device where event occurred
    USB_EVENT event - Identifies the event that occured
    void *data      - Pointer to event-specific data
    DWORD size      - Size of the event-specific data

  Return Values:
    TRUE    - The event was handled
    FALSE   - The event was not handled

  Remarks:
    The application may also implement an event handling routine if it
    requires knowledge of events.  To do so, it must implement a routine that
    matches this function signature and define the USB_HOST_APP_EVENT_HANDLER
    macro as the name of that function.
  ***************************************************************************/

BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    switch( event )
    {
        case EVENT_VBUS_REQUEST_POWER:
            // The data pointer points to a byte that represents the amount of power
            // requested in mA, divided by two.  If the device wants too much power,
            // we reject it.
            return TRUE;

        case EVENT_VBUS_RELEASE_POWER:
            // Turn off Vbus power.
            // The PIC24F with the Explorer 16 cannot turn off Vbus through software.

            //This means that the device was removed
            return TRUE;
            break;

        case EVENT_HUB_ATTACH:
            return TRUE;
            break;

        case EVENT_UNSUPPORTED_DEVICE:
            return TRUE;
            break;

        case EVENT_CANNOT_ENUMERATE:
            //UART2PrintString( "\r\n***** USB Error - cannot enumerate device *****\r\n" );
            return TRUE;
            break;

        case EVENT_CLIENT_INIT_ERROR:
            //UART2PrintString( "\r\n***** USB Error - client driver initialization error *****\r\n" );
            return TRUE;
            break;

        case EVENT_OUT_OF_MEMORY:
            //UART2PrintString( "\r\n***** USB Error - out of heap memory *****\r\n" );
            return TRUE;
            break;

        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
            //UART2PrintString( "\r\n***** USB Error - unspecified *****\r\n" );
            return TRUE;
            break;

        default:
            break;
    }

    return FALSE;
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of main.c
 ******************************************************************************/