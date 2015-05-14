/* 
 * File:    lld_spi3.h
 * Author:  nenad
 * Details: Low Level Driver for SPI3
 *
 * Created on March 31, 2014, 9:38 PM
 */

#ifndef LLD_SPI3_H_
#define	LLD_SPI3_H_

/*=========================================================  INCLUDE FILES  ==*/
/*===============================================================  MACRO's  ==*/

#if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)))
#elif (((__PIC32_FEATURE_SET__ >= 300) && (__PIC32_FEATURE_SET__ <= 499)))
#elif (((__PIC32_FEATURE_SET__ >= 500) && (__PIC32_FEATURE_SET__ <= 799)))
#define SPI3_PIN_TABLE(entry)                                                   \
    entry(SPI3_SDI_RPD2,            0,              NULL)                       \
    entry(SPI3_SDO_RPD3,            0,              NULL)                     \
    entry(SPI3_SS_RPD4_GPIO,        4,              &GpioD)
#endif

#define SPI3_PIN_ID(id, value, address)                                         \
    id,

/*------------------------------------------------------  C++ extern begin  --*/
#ifdef	__cplusplus
extern "C" {
#endif

/*============================================================  DATA TYPES  ==*/

enum spi3PinId {
    SPI3_PIN_TABLE(SPI3_PIN_ID)
    SPI3_LAST_PIN_ID
};

/*======================================================  GLOBAL VARIABLES  ==*/

/**@brief       Hardware SPI2 identificator
 */
extern const struct spiId GlobalSpi3;

/*===================================================  FUNCTION PROTOTYPES  ==*/

/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//** @} *//*********************************************
 * END of lld_spi1.h
 ******************************************************************************/
#endif /* LLD_SPI2_H_ */
