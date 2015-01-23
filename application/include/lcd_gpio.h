#ifndef _GPIO_H_
  #define _GPIO_H_

#define TFT_LCD_DATA_PORT     GpioE

#define TFT_LCD_FMARK_PIN     6
#define TFT_LCD_FMARK_PORT    GpioE

#define TFT_LCD_CS_PIN        7
#define TFT_LCD_CS_PORT       GpioG

#define TFT_LCD_DC_PIN        8
#define TFT_LCD_DC_PORT       GpioG

#define TFT_LCD_WR_PIN        9
#define TFT_LCD_WR_PORT       GpioG

#define TFT_LCD_RD_PIN        8
#define TFT_LCD_RD_PORT       GpioB

#define TFT_LCD_RESET_PIN     1
#define TFT_LCD_RESET_PORT    GpioF

#define TFT_LCD_BACKLIGHT_PIN 9
#define TFT_LCD_BACKLIGHT_PORT GpioB

/*
#define lcdTouchscreenYDPin   10
#define lcdTouchScreenXRPin   13
#define lcdTouchscreenYUPin   12
#define lcdTouchscreenXLPin   11
#define TS_PORT               GpioB
*/
void lcdGpioInit();

#endif