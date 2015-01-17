/*
 * File:    spi.c
 * Author:  nenad
 * Details: GPIO
 *
 * Created on February 17, 2014, 1:41 AM
 */

/*=========================================================  INCLUDE FILES  ==*/

#include <xc.h>

#include "driver/gpio.h"

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/

const struct gpio GpioA = {
    0
};

const struct gpio GpioB = {
    .port     = &PORTB,
    .tris     = &TRISB,
    .lat      = &LATB,
    .set      = &LATBSET,
    .clr      = &LATBCLR,
    .invert   = &LATBINV,
    .od       = &ODCB,
    .change   = NULL,
    .status   = NULL,
    .pullup   = NULL,
    .pulldown = NULL,
    .ansel    = NULL
};

const struct gpio GpioC = {
    .port     = &PORTC,
    .tris     = &TRISC,
    .lat      = &LATC,
    .set      = &LATCSET,
    .clr      = &LATCCLR,
    .invert   = &LATCINV,
    .od       = &ODCC,
    .change   = NULL,
    .status   = NULL,
    .pullup   = NULL,
    .pulldown = NULL,
    .ansel    = NULL
};

#if (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 700)))
const struct gpio GpioD = {
    .port     = &PORTD,
    .tris     = &TRISD,
    .lat      = &LATD,
    .set      = &LATDSET,
    .clr      = &LATDCLR,
    .invert   = &LATDINV,
    .od       = &ODCD,
    .change   = NULL,
    .status   = NULL,
    .pullup   = NULL,
    .pulldown = NULL,
    .ansel    = NULL
};
#endif

#if (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 700)))
const struct gpio GpioE = {
    .port     = &PORTE,
    .tris     = &TRISE,
    .lat      = &LATE,
    .set      = &LATESET,
    .clr      = &LATECLR,
    .invert   = &LATEINV,
    .od       = &ODCE,
    .change   = NULL,
    .status   = NULL,
    .pullup   = NULL,
    .pulldown = NULL,
    .ansel    = NULL
};
#endif

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static void init_port(const struct gpio * gpio)
{
    if (gpio->port) {
        *(gpio->port)     = 0u;
    }

    if (gpio->tris) {
        *(gpio->tris)     = 0xffffffffu;
    }

    if (gpio->lat) {
        *(gpio->lat)      = 0u;
    }

    if (gpio->od) {
        *(gpio->od)       = 0u;
    }

    if (gpio->change) {
        *(gpio->change)   = 0u;
    }

    if (gpio->pullup) {
        *(gpio->pullup)   = 0u;
    }

    if (gpio->pulldown) {
        *(gpio->pulldown) = 0u;
    }

    if (gpio->ansel) {
        *(gpio->ansel)    = 0u;
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void initGpioDriver(void)
{
    init_port(&GpioA);
    init_port(&GpioB);
    init_port(&GpioC);
    init_port(&GpioE);
    AD1PCFGSET = UINT32_MAX;
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of gpio.c
 ******************************************************************************/

