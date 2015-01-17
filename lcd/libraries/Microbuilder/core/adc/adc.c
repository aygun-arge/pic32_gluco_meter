/*
[nwazet Open Source Software & Open Source Hardware
Authors: Fabien Royer
Software License Agreement (BSD License)

Copyright (c) 2010, Nwazet, LLC. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of Nwazet, LLC. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
* The names '[nwazet', 'nwazet', the ASCII hazelnut in the [nwazet logo and the color of the logo are Trademarks of nwazet, LLC. and cannot be used to endorse or promote products derived from this software or any hardware designs without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Parts of the [nwazet source code is derived from the MicroBuilder codebase.
The MicroBuilder license is provided below and is alos located under .\MicroBuilder\License.txt
*/
#include "adc.h"

GPIO_InitTypeDef GPIO_InitStructure;

void adcInit (void){
  ADC_InitTypeDef ADC_InitStructure;

  ADC_StructInit(&ADC_InitStructure);

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
  RCC_ADCCLKConfig(RCC_PCLK2_Div2);                                           /* ADCCLK = PCLK2/2 */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);                        /* Ukljuci ADC1 clock */

  ADC_DeInit(ADC1);

  ADC_InitStructure.ADC_Mode = ADC_Mode_Independent;                          /* Nezavisni nacin rada (zato sto se koristi samo jedan ADC modl)*/
  ADC_InitStructure.ADC_ScanConvMode = DISABLE;                               /* Iskljucen je Scan mod */
  ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;                         /* Izabran je Single mod */
  ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;         /* Softwersko trigerovanje */
  ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;                      /* Desno poravnanje podataka u ADC Data registru*/
  ADC_InitStructure.ADC_NbrOfChannel = 1;                                     /* Broj kanala */
  ADC_Init(ADC1, &ADC_InitStructure);

  ADC_Cmd(ADC1, ENABLE);
  ADC_ResetCalibration(ADC1);                                                 /* Resetuje se ADC1 kalibracioni registar */
  while (ADC_GetResetCalibrationStatus(ADC1)) {                               /* Sacekaj da se zavrsi proces resetovanja ADC1 kalibracionog registra */
      ;
  }
  ADC_StartCalibration(ADC1);                                                 /* Zapocni ADC1 kalibraciju */
  while(ADC_GetCalibrationStatus(ADC1)) {                                     /* Sacekaj da se zavrsi ADC1 kalibracija */
      ;
  }
}

uint16_t adcRead(uint8_t channel){
  unsigned int pin;

  switch(channel){
  case ADC_YM_CHANNEL:
    pin = ADC_YM_Pin;
    break;
  case ADC_XM_CHANNEL:
    pin = ADC_XM_Pin;
    break;
  case ADC_YP_CHANNEL:
    pin = ADC_YP_Pin;
    break;
  case ADC_XP_CHANNEL:
    pin = ADC_XP_Pin;
    break;
  }

  // Configure the GPIO as an analog input
  GPIO_InitStructure.GPIO_Pin = pin;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AIN;
  GPIO_Init(ADC_PORT, &GPIO_InitStructure);

  // Configure the channel corresponding to the GPIO
  ADC_RegularChannelConfig(ADC1, channel, 1, ADC_SampleTime_13Cycles5);

  // Start the conversion
  ADC_SoftwareStartConvCmd(ADC1, ENABLE);

  // Wait until conversion completion
  while(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET) {
      ;
  }

  // Return the conversion value
  return ADC_GetConversionValue(ADC1);

}
