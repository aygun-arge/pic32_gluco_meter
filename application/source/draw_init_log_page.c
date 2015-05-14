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

#include "draw_init_log_page.h"
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

static void init_log_page_events(tsTouchData_t * tsData)
{
    if ((tsData->xlcd > 60 && tsData->xlcd < 180) &&								/* sensor ON/OFF button */
        (tsData->ylcd > 260 && tsData->ylcd < 300)) {
            gui_event(GUI_BTN_OK);
    } else if ((tsData->xlcd > 60 && tsData->xlcd < 180) &&								/* sensor ON/OFF button */
               (tsData->ylcd > 200 && tsData->ylcd < 240)) {
            gui_event(GUI_BTN_BACK);
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void init_log_page_draw(const struct init_log_page_data * data)
{
    char buff[64];

    drawFill(COLOR_BLUE);

    drawString(65, 15, COLOR_WHITE, &verdanabold14ptFontInfo, "Data logs");

    snprintf(buff, sizeof(buff), "Number of logs: %4d", data->num_of_logs);
    drawString(18, 76, COLOR_WHITE, &verdanabold14ptFontInfo, buff);

    drawButton(60, 200, 120, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, COLOR_RED, COLOR_WHITE, "Delete all");
    drawButton(60, 260, 120, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, COLOR_RED, COLOR_WHITE, "Continue");
    gui_set_update(init_log_page_events);
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_measure_page.c
 ******************************************************************************/

