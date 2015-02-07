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

#include "exe_edit_page.h"
#include "drawing.h"
#include "verdanabold14.h"
#include "colors.h"
#include <stddef.h>
#include <stdlib.h>

/*=========================================================  LOCAL MACRO's  ==*/
#define STRING_COLOR 		COLOR_DARK_BLUE
#define MAX_NUM_OF_DIGITS	3
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
static editPageCtx_T gCtx = NULL;
static uint16_t gEditValue;
static uint8_t  gDigitCnt;
static char gValString[MAX_NUM_OF_DIGITS + 2];
static char gDrawString[MAX_NUM_OF_DIGITS + 2];
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
static inline void drawVal(void) {
	if (gDigitCnt == 0) {
		drawString(25, 90, STRING_COLOR, &verdanabold14ptFontInfo, gValString);

		return;
	}
	gDrawString[0] = gValString[0];
	gDrawString[1] = '.';
	gDrawString[2] = gValString[1];
	gDrawString[3] = gValString[2];
	//strcpy(&gDrawString[2], &gDrawString[2]);
	drawString(25, 90, STRING_COLOR, &verdanabold14ptFontInfo, gDrawString);
}

/*_____________________________________________________________________________*/
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
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void startEditPage(editPageCtx_T ctx, editPageMessages_T message) {
	gCtx = ctx;
	gEditValue = 0;
	gDigitCnt = 0;
	gValString[0] = 0;
	gValString[1] = 0;
	gValString[2] = 0;
	gValString[3] = 0;
	gValString[4] = 0;
	drawEditPage();
	drawEditPageMessages(message);
}

/*_____________________________________________________________________________*/
void updateEditPage(tsTouchData_t * tsData) {
	handleKeyPad(tsData);
	if (tsData->xlcd > 20 && tsData->xlcd < 110) {
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
			gCtx(EDIT_BUTTON_BACK);
		}
	}
	if (tsData->xlcd > 130 && tsData->xlcd < 220) {
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
			gEditValue = atoi(gValString);
			gCtx(EDIT_BUTTON_OK);
		}
	}
}

/*_____________________________________________________________________________*/
uint16_t getEditValue(void) {

	return gEditValue;
}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of exe_edit_page.c
 ******************************************************************************/
