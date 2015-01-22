/* 
 * File:    gpio.h
 * Author:  nenad
 * Details: GPIO
 *
 * Created on February 16, 2014, 8:47 PM
 */

#ifndef GPIO_H
#define	GPIO_H

/*=========================================================  INCLUDE FILES  ==*/

#include <stdint.h>

/*===============================================================  MACRO's  ==*/

#define CONFIG_MAX_CHANGE_HANDLERS          3
#define GPIO_NUM_OF_PORTS                   3

/*------------------------------------------------------  C++ extern begin  --*/
#ifdef	__cplusplus
extern "C" {
#endif

/*============================================================  DATA TYPES  ==*/

struct change_slot;

struct gpio {
    volatile unsigned int * port;
    volatile unsigned int * tris;
    volatile unsigned int * lat;
    volatile unsigned int * set;
    volatile unsigned int * clr;
    volatile unsigned int * invert;
    volatile unsigned int * od;
    volatile unsigned int * change;
    volatile unsigned int * status;
    volatile unsigned int * pullup;
    volatile unsigned int * pulldown;
    volatile unsigned int * ansel;
};

/*======================================================  GLOBAL VARIABLES  ==*/

extern const struct gpio GpioA;
extern const struct gpio GpioB;
extern const struct gpio GpioC;
extern const struct gpio GpioD;
extern const struct gpio GpioE;
extern const struct gpio GpioG;

/*===================================================  FUNCTION PROTOTYPES  ==*/

void initGpioDriver(void);

static inline void gpioSetAsInput(const struct gpio * gpio, uint32_t pin)
{
    *gpio->tris |= ((uint32_t)0x1u << pin);
}

static inline void gpioSetPullDown(const struct gpio * gpio, uint32_t pin)
{
    *gpio->pulldown |= ((uint32_t)0x1u << pin);
}

static inline void gpioSetAsOutput(const struct gpio * gpio, uint32_t pin)
{
    *gpio->tris &= ~((uint32_t)0x1u << pin);
}

static inline void gpioSetAllAsOutput(const struct gpio * gpio)
{
    *gpio->tris = 0;
}

static inline void gpioSetAsOutputPullUp(const struct gpio * gpio, uint32_t pin)
{
    *gpio->tris   &= ~((uint32_t)0x1u << pin);
    *gpio->od     |=  ((uint32_t)0x1u << pin);
    *gpio->pullup |=  ((uint32_t)0x1u << pin);
}

static inline void gpioSetPin(const struct gpio * gpio, uint32_t pin)
{
    *gpio->set = ((uint32_t)0x1u << pin);
}

static inline void gpioClrPin(const struct gpio * gpio, uint32_t pin)
{
    *gpio->clr = ((uint32_t)0x1u << pin);
}

static inline uint32_t gpioRead(const struct gpio * gpio)
{
    return (*gpio->port);
}

static inline void gpioWrite(const struct gpio * gpio, uint8_t data)
{
    *gpio->lat = data;
}

/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//** @} *//*********************************************
 * END of gpio.h
 ******************************************************************************/
#endif /* GPIO_H */
