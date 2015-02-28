/*
 * This file is part of tft
 *
 * Template version: 1.1.16 (24.12.2013)
 *
 * Copyright (C) 2011, 2012 - Nenad Radulovic
 *
 * tft is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * tft is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with eSolid.  If not, see <http://www.gnu.org/licenses/>.
 *
 * web site:    http://blueskynet.dyndns-server.com
 * e-mail  :    blueskyniss@gmail.com
 *//***********************************************************************//**
 * @file
 * @author      Administrator
 * @brief       Short desciption of file
 * @addtogroup  module_impl
 *********************************************************************//** @{ */
                                                                                                  
/*=========================================================  INCLUDE FILES  ==*/

#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#include "driver/touchscreen.h"
#include "draw_edit_page.h"
#include "drawing.h"
#include "colors.h"
#include "dejavusansbold9.h"
#include "verdanabold14.h"
#include "gui.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define KEYS_COLOR			COLOR_CYAN
#define KEYS_FRAME_COLOR	COLOR_WHITE
#define KEYS_FONT_COLOR		COLOR_DARK_BLUE
#define KEYS_FONT			verdanabold14ptFontInfo

#define STRING_COLOR 		COLOR_DARK_BLUE
#define MAX_NUM_OF_DIGITS	2

/*======================================================  LOCAL DATA TYPES  ==*/

static uint16_t         gEditValue;
static uint8_t          gDigitCnt;
static char             gValString[MAX_NUM_OF_DIGITS + 1];
static char             gDrawString[MAX_NUM_OF_DIGITS + 2];
static bool             g_is_bigger_input;

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/


static inline void drawVal(void)
{
	if (gDigitCnt == 0) {
		drawString(25, 90, STRING_COLOR, &verdanabold14ptFontInfo, gValString);

		return;
	}

    if (g_is_bigger_input) {
        gDrawString[0] = gValString[0];
        gDrawString[1] = gValString[1];
        gDrawString[2] = 0;
    } else {
        gDrawString[0] = gValString[0];
        gDrawString[1] = '.';
        gDrawString[2] = gValString[1];
        gDrawString[3] = 0;
    }
	drawString(25, 90, STRING_COLOR, &verdanabold14ptFontInfo, gDrawString);
}



static void handleKeyPad(tsTouchData_t * tsData) {
	if (tsData->xlcd < 20 || tsData->xlcd > 220 || \
		tsData->ylcd < 140 || tsData->ylcd > 220) {

		return;
	}
	if (gDigitCnt > MAX_NUM_OF_DIGITS - 1) {

		return;
	}

	uint8_t  pos;
	uint16_t x;
	uint8_t  yt;
	uint8_t	 yb;

	pos = 1;
	x = 20;
	yt = 140;
	yb = 180;

	while (pos <= 10) {
		if (tsData->xlcd > x && tsData->xlcd < (x + 40)) {
			if (tsData->ylcd > yt && tsData->ylcd < yb) {
				if (pos == 10) {
					gValString[gDigitCnt] = '0';
				} else {
					gValString[gDigitCnt] = pos + '0';
				}
				gValString[gDigitCnt + 1] = '\0';
				drawVal();

				break;
			}
		}
		pos++;
		if (pos == 6) {
			x = 20;
			yt = 180;
			yb = 220;

			continue;
		}
		x += 40;
	}
	gDigitCnt++;
}



static void edit_page_events(tsTouchData_t * tsData)
{
	handleKeyPad(tsData);
	if (tsData->xlcd > 20 && tsData->xlcd < 110) {
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
			gui_event(GUI_BTN_BACK);
		}
	}
	if (tsData->xlcd > 130 && tsData->xlcd < 220) {
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
			gEditValue = atoi(gValString);
			gui_event(GUI_BTN_OK);
		}
	}
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void edit_page_draw(editPageMessages_T message)
{
    gEditValue  = 0;
    gDigitCnt   = 0;
    memset(gValString, 0, sizeof(gValString));
    memset(gDrawString, 0, sizeof(gDrawString));
	drawFill(COLOR_BLUE);
	drawRectangleFilled(20, 80, 220, 120, COLOR_CYAN);
	drawRectangle(20, 80, 220, 120, COLOR_DARK_BLUE);

	drawButton(20, 140, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "1");
	drawButton(60, 140, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "2");
	drawButton(100, 140, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "3");
	drawButton(140, 140, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "4");
	drawButton(180, 140, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "5");
	drawButton(20, 180, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "6");
	drawButton(60, 180, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "7");
	drawButton(100, 180, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "8");
	drawButton(140, 180, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "9");
	drawButton(180, 180, 40, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "0");

	drawButton(20, 260, 90, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "BACK");
	drawButton(130, 260, 90, 40, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "OK");

    switch (message) {
		case SET_HEATER_VOLTAGE : {
			drawString(40, 30, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, "Set heater voltage  ");
            g_is_bigger_input = false;

			break;
		}

		case SET_BLOWING_TIME : {
			drawString(40, 30, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, "Input blowing time ");
            g_is_bigger_input = true;
            
			break;
		}

		default : {
			;
		}
	}
    gui_set_update(edit_page_events);
}



uint16_t edit_page_get_value(void)
{
	return gEditValue;
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of drawEditPage.c
 ******************************************************************************/
