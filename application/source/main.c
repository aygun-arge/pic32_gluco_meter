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

#include "sm_gui.h"
#include "sm_voc.h"

#include "USB/usb.h"
#include "USB/usb_host_msd.h"
#include "app_buzzer.h"
#include "TimeDelay.h"
#include "voc_heater.h"

#include "neon_eds.h"

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static void board_init_early(void);
static void board_init_late(void);
static void idle_hook(void);

/*=======================================================  LOCAL VARIABLES  ==*/

/*-- Event storage and heap --------------------------------------------------*/
static struct nheap             g_event_heap;									/* Dinamicka memorija za event-ove */
static uint8_t                  g_event_heap_storage[4096];						/* Prostor za din. mem. za event-ove */
static uint8_t                  g_generic_heap_storage[24000];					/* Prostor za din. mem. za opstu upotrebu */

/*======================================================  GLOBAL VARIABLES  ==*/

struct nheap             		g_generic_heap;
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
    board_init_late();

    /* Initialize the portable core. Portable core handles interrupts, timer
     * and CPU initialization. After initialization the core timer is started
     * so event timer can be used in this example.
     */
    ncore_init();
    ncore_timer_enable();

    /* Initialize internal scheduler data structures. Event Processing is
     * relaying on scheduler to provide efficient task switching.
     */
    nsched_init();

    /* Initialize a memory for events. Since events are dynamic they require
     * either a heap memory or a pool memory. Currently only Neon Heap and Pool
     * memory are supported. In the future a standard malloc/free support will
     * be added.
     *
     * Function nheap_init() requires a pointer to heap memory structure,
     * pointer to statically allocated storage and it's size.
     */
    nheap_init(&g_event_heap, g_event_heap_storage, sizeof(g_event_heap_storage));

    /* Initialize a generic heap memory, used by FLASH programming, USB protocol
     */
    nheap_init(&g_generic_heap, g_generic_heap_storage, sizeof(g_generic_heap_storage));

    /* Register the Heap memory for events. New events will allocate memory from
     * this heap.
     */
    nevent_register_mem(&g_event_heap.mem_class);

    /* Register a user implemented IDLE routine. The idle routine is called
     * when there are no ready EPA for execution. Keep this routine short as
     * possible because it's execution time may impact system response time.
     *
     * When the NULL pointer is given the system will use default ncore_idle()
     * portable function which usually puts CPU to sleep.
     */
    neds_set_idle(idle_hook);

    

    /* Start the scheduler under Event Processing supervision.
     */
    neds_run();

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