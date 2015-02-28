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

#include "gui.h"
#include "driver/gpio.h"
#include "driver/ILI9341.h"
#include "lcd_gpio.h"
#include "drawing.h"

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/

static updater_T        g_event_handler;

/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void gui_init(void) {
    lcdGpioInit();
    lcdAdcInit();
    lcdInit();
    tsInit();
}

/*_____________________________________________________________________________*/
void gui_set_update(updater_T handler)
{
	g_event_handler      = handler;
}

/*_____________________________________________________________________________*/
void gui_start(void) {
    tsCalibrate();
}

/*_____________________________________________________________________________*/
void gui_exe(void) {
    tsTouchData_t ts_data;

	static bool alreadyPressed = false;

	tsRead(&ts_data);
	if (ts_data.valid == true) {
		if (alreadyPressed == false) {
			alreadyPressed = true;
			g_event_handler(&ts_data);
		}
	} else {
		alreadyPressed = false;
	}
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of gui.c
 ******************************************************************************/
