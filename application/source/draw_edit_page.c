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

#include "draw_edit_page.h"
#include "drawing.h"
#include "colors.h"
#include "dejavusansbold9.h"
#include "verdanabold14.h"

/*=========================================================  LOCAL MACRO's  ==*/
#define KEYS_COLOR			COLOR_CYAN
#define KEYS_FRAME_COLOR	COLOR_WHITE
#define KEYS_FONT_COLOR		COLOR_DARK_BLUE
#define KEYS_FONT			verdanabold14ptFontInfo
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void drawEditPage(void) {
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
}

/*_____________________________________________________________________________*/
void drawEditPageMessages(editPageMessages_T message) {
	switch (message) {
		case SET_HEATER_VOLTAGE : {
			drawString(40, 30, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, "   Set heater voltage  ");
			break;
		}

		case INPUT_BLOWING_TIME : {
			drawString(40, 30, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, "    Input blowing time ");
			break;
		}

		default : {
			;
		}
	}
}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of drawEditPage.c
 ******************************************************************************/
