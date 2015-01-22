#ifndef _ADC_H_
#define _ADC_H_

#include "driver/gpio.h"

#define ADC_YD_CHANNEL  10
#define ADC_XR_CHANNEL  13
#define ADC_YU_CHANNEL  12
#define ADC_XL_CHANNEL  11

#define ADC_YM_CHANNEL ADC_YD_CHANNEL
#define ADC_XM_CHANNEL ADC_XR_CHANNEL
#define ADC_YP_CHANNEL ADC_YU_CHANNEL
#define ADC_XP_CHANNEL ADC_XL_CHANNEL

#define ADC_YM_Pin  10
#define ADC_XM_Pin  13
#define ADC_YP_Pin  12
#define ADC_XP_Pin  11
#define ADC_PORT    GpioB

void     lcdAdcInit(void);
uint16_t lcdAdcRead(uint8_t channel);

#endif
