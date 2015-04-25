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

#include <stdio.h>

#include "draw_rtc_page.h"
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

/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static void rtc_page_events(tsTouchData_t * tsData)
{
	if (tsData->xlcd > 20 && tsData->xlcd < 110) {								/* sensor ON/OFF button */
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
		    gui_event(GUI_BTN_BACK);
		}
	}
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void rtc_page_draw(void)
{
    drawFill(COLOR_BLUE);

    drawString(15, 35, COLOR_WHITE, &verdanabold14ptFontInfo, "Set time/date");

    drawButton(100 - 15, 30, 30, 30, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "+");
    drawButton(140 - 15, 30, 30, 30, &KEYS_FONT, 10, KEYS_FONT_COLOR, KEYS_COLOR, KEYS_FONT_COLOR, "+");
    drawButton(20, 260, 90, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, COLOR_RED, COLOR_WHITE, "BACK");
    gui_set_update(rtc_page_events);
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_measure_page.c
 ******************************************************************************/

