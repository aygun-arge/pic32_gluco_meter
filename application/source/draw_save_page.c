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
#include "sm_gui.h"

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

static void save_page_events(tsTouchData_t * tsData)
{
    (void)tsData;
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void save_page_draw(void)
{
    char buff[64];

    drawFill(COLOR_BLUE);
    drawString(45, 15, COLOR_WHITE, &verdanabold14ptFontInfo, "Exporting logs");
    snprintf(buff, sizeof(buff), "Synchronizing...");
    drawString(10, 100, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
    gui_set_update(save_page_events);
}

void save_page_fail_draw(void)
{
    char buff[64];

    drawFill(COLOR_RED);
    drawString(45, 15, COLOR_WHITE, &verdanabold14ptFontInfo, "Exporting logs");
    snprintf(buff, sizeof(buff), "Failed to access USB");
    drawString(10, 100, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
    gui_set_update(save_page_events);
}

void save_page_refresh(const char * name)
{
    char buff[64];

    snprintf(buff, sizeof(buff), "File name: %s", name);
    drawRectangleFilled(10,100,230,120, COLOR_BLUE);
    drawString(10, 100, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_measure_page.c
 ******************************************************************************/


