/*
 * File:    lld_SPI3.c
 * Author:  nenad
 * Details: Low Level Driver for SPI3
 *
 * Created on March 11, 2014, 10:00 PM
 */

/*=========================================================  INCLUDE FILES  ==*/

#include <stdbool.h>
#include <xc.h>

#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/spi.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define SPI3CON_ON                      (0x1u << 15)
#define SPI3CON_ENHBUF                  (0x1u << 16)
#define SPI3CON_MCLKSEL                 (0x1u << 23)
#define SPI3CON_FRMEN                   (0x1u << 31)

#define SPI3STAT_SPITBF                 (0x1u << 1)
#define SPI3STAT_SPITBE                 (0x1u << 3)
#define SPI3STAT_SPIRBE                 (0x1u << 5)
#define SPI3STAT_SPIROV                 (0x1u << 6)
#define SPI3STAT_SPITUR                 (0x1u << 8)
#define SPI3STAT_SPIBUSY                (0x1u << 11)

#define SPI3_PIN_ADDRESS(id, value, address)                                    \
    (volatile unsigned int *)address,

#define SPI3_PIN_VALUE(id, value, address)                                      \
    value,

/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static void lldSpiOpen(
    const struct spiConfig *,
    struct spiHandle *);
static void lldSpiClose(
    struct spiHandle *);
static bool lldSpiIsBuffFull(
    struct spiHandle *);
static uint32_t lldSpiExchange(
    struct spiHandle *,
    uint32_t);
static void lldSpiSSActivate(
    struct spiHandle *);
static void lldSpiSSDeactivate(
    struct spiHandle *);

/*=======================================================  LOCAL VARIABLES  ==*/

static volatile unsigned int * const spiPinAddress[SPI3_LAST_PIN_ID] = {
    SPI3_PIN_TABLE(SPI3_PIN_ADDRESS)
};

static const unsigned int spiPinValue[SPI3_LAST_PIN_ID] = {
    SPI3_PIN_TABLE(SPI3_PIN_VALUE)
};

static struct gpio * ssPort;
static uint32_t      ssPinMask;

/*======================================================  GLOBAL VARIABLES  ==*/

const struct spiId GlobalSpi3 = {
    lldSpiOpen,
    lldSpiClose,
    lldSpiIsBuffFull,
    lldSpiExchange,
    lldSpiSSActivate,
    lldSpiSSDeactivate
};

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static void lldSpiOpen(
    const struct spiConfig * config,
    struct spiHandle *  handle) {

#if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)) || defined(__32MXGENERIC__))
    unsigned int data;

    (void)handle;
    SPI2CON             = 0;
    SPI2CON2            = 0;
    IEC1CLR             = IEC1_SPI2TX | IEC1_SPI2RX | IEC1_SPI2E;               /* Disable all interrupts                                   */
    IFS1CLR             = IFS1_SPI2TX | IFS1_SPI2RX | IFS1_SPI2E;               /* Clear all interrupts                                     */
    data                = SPI2BUF;                                              /* Clear the receive buffer                                 */
    IPC9CLR             = IPC9_SPI2IP_Msk | IPC9_SPI2IS_Msk;                    /* Set ISR priority and clear subpriority                   */
    IPC9SET             = (config->isrPrio << IPC9_SPI2IP_Pos) & IPC9_SPI2IP_Msk;
    SPI2CON             = config->flags & ~SPI2CON_ON;
    SPI2CONCLR          = SPI2CON_FRMEN | SPI2CON_MCLKSEL;
    SPI2CONSET          = SPI2CON_ENHBUF;
    
    if ((config->speed * 2u) >= clockGetPeripheralClock()) {
        SPI2BRG         = 0;                                                    /* Maximum SPI speed                                        */
    } else {
        unsigned int    divisor;
        
        divisor  = (clockGetPeripheralClock() / (config->speed * 2u)) - 1u;
        divisor &= 0x0fffu;
        SPI2BRG         = divisor;
    }
    SPI2STATCLR         = SPI2STAT_SPIROV | SPI2STAT_SPITUR;                    /* Clear events                                             */
    SPI2CONSET          = SPI2CON_ON;                                           /* Start SPI module                                         */
    
    /*--  Remap port pins  ---------------------------------------------------*/
    SDI2Rbits.SDI2R     = spiPinValue[config->remap.sdi];

    if (config->flags & SPI_SLAVE_SS) {
        SS2Rbits.SS2R   = spiPinValue[config->remap.ss];
    }
    *spiPinAddress[config->remap.sdo] = 0x04u;

    if (config->flags & SPI_MASTER_SS) {
        *spiPinAddress[config->remap.ss] = 0x04u;
    } else {
        ssPort    = (struct gpio *)spiPinAddress[config->remap.ss];
        ssPinMask = 0x1u << spiPinValue[config->remap.ss];
        *ssPort->tris &= ~ssPinMask;
    }
#elif (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 799)))
    unsigned int data;

    (void)handle;
    SPI3CON             = 0;
    data                = SPI3BUF;                                              /* Clear the receive buffer                                 */
    SPI3CON             = config->flags & ~SPI3CON_ON;
    SPI3CONCLR          = SPI3CON_FRMEN;
    SPI3CONSET          = SPI3CON_ENHBUF;

    if ((config->speed * 2u) >= clockGetPeripheralClock()) {
        SPI3BRG         = 0;                                                    /* Maximum SPI speed                                        */
    } else {
        unsigned int    divisor;

        divisor  = (clockGetPeripheralClock() / (config->speed * 2u)) - 1u;
        divisor &= 0x0fffu;
        SPI3BRG         = divisor;
    }
    SPI3STATCLR         = SPI3STAT_SPIROV | SPI3STAT_SPITUR;                    /* Clear events                                             */
    SPI3CONSET          = SPI3CON_ON;                                           /* Start SPI module                                         */

    if (!(config->flags & SPI_MASTER_SS)) {
        ssPort    = (struct gpio *)spiPinAddress[config->remap.ss];
        ssPinMask = 0x1u << spiPinValue[config->remap.ss];
        *ssPort->tris &= ~ssPinMask;
    }
#endif
}

static void lldSpiClose(
    struct spiHandle *  handle) {
#if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)) || defined(__32MXGENERIC__))
    (void)handle;
    SPI2CON             = 0;
    IEC1CLR             = IEC1_SPI2TX | IEC1_SPI2RX | IEC1_SPI2E;               /* Disable all interrupts                                   */
    IFS1CLR             = IFS1_SPI2TX | IFS1_SPI2RX | IFS1_SPI2E;               /* Clear all interrupts                                     */
#elif (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 799)))
    (void)handle;
    SPI3CON             = 0;
#endif
}

static bool lldSpiIsBuffFull(
    struct spiHandle *  handle) {
#if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)) || defined(__32MXGENERIC__))
    (void)handle;

    if ((SPI2STAT & SPI2STAT_SPITBF) != 0) {

        return (true);
    } else {

        return (false);
    }
#elif (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 799)))
    (void)handle;

    if ((SPI3STAT & SPI3STAT_SPITBF) != 0) {

        return (true);
    } else {

        return (false);
    }
#endif
}

static uint32_t lldSpiExchange(
    struct spiHandle *  handle,
    uint32_t            data) {

    (void)handle;
    SPI3BUF = data;
    while ((SPI3STAT & SPI3STAT_SPIRBE) != 0u);
    data = SPI3BUF;

    return (data);
}

static void lldSpiSSActivate(
    struct spiHandle * handle) {

    if ((handle->flags & SPI_MASTER_SS) == 0u) {
        if ((handle->flags & SPI_MASTER_SS_ACTIVE_HIGH) != 0u) {
            *ssPort->set = ssPinMask;
        } else {
            *ssPort->clr = ssPinMask;
        }
    }
}

static void lldSpiSSDeactivate(
    struct spiHandle * handle) {

    if ((handle->flags & SPI_MASTER_SS) == 0u) {
        while ((SPI3STAT & SPI3STAT_SPIBUSY) != 0u);
        
        if ((handle->flags & SPI_MASTER_SS_ACTIVE_HIGH) != 0u) {
            *ssPort->clr = ssPinMask;
        } else {
            *ssPort->set = ssPinMask;
        }
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of lld_SPI3.c
 ******************************************************************************/
