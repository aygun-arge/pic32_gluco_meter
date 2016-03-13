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

#include "draw_calib_page.h"
#include "drawing.h"
#include "colors.h"
#include "dejavusansbold9.h"
#include "verdanabold14.h"
#include "gui.h"
#include "sm_gui.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define KEYS_COLOR			COLOR_CYAN
#define KEYS_FRAME_COLOR                COLOR_WHITE
#define KEYS_FONT_COLOR                 COLOR_DARK_BLUE
#define KEYS_FONT			verdanabold14ptFontInfo

/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static uint64_t                     g_acc;
static uint32_t                     g_counter;

static void calib_events(tsTouchData_t * tsData)
{
    if ((tsData->xlcd > 0 && tsData->xlcd < 240) &&								/* sensor ON/OFF button */
        (tsData->ylcd > 0 && tsData->ylcd < 320)) {
        g_acc     = 0;
        g_counter = 0;
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/


void calib_draw(void)
{
    drawFill(COLOR_BLUE);
    gui_set_update(calib_events);
}

void calib_update(struct calib * calib)
{
    static int counter;

    char buff[100];

    g_acc += calib->voc;
    g_counter++;
    
    if (counter == 0) {
        counter = 10;

        drawRectangleFilled(0, 10, 240, 140, COLOR_BLUE);
        snprintf(buff, sizeof(buff), "VOC:  %u", calib->voc);
        drawString(5, 20, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
        snprintf(buff, sizeof(buff), "CNT:  %u", g_counter);
        drawString(5, 60, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
        snprintf(buff, sizeof(buff), "AVG:  %f", (double)g_acc / (double)g_counter);
        drawString(5, 100, COLOR_WHITE, &verdanabold14ptFontInfo, buff);
    }
    counter--;
}


/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_measure_page.c
 ******************************************************************************/

