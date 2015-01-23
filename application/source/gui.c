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
#include "drawing.h"
#include "stdbool.h"
#include "exe_main_page.h"
#include "lcd_gpio.h"
/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
static tsTouchData_t gTsData;
static updater_T gUpdater;
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void guiInit(void) {
    lcdGpioInit();
    lcdAdcInit();
    lcdInit();
    //tsInit();
    lcdTest();
}

/*_____________________________________________________________________________*/
void guiSetUpdater(updater_T upFunc) {
	gUpdater = upFunc;
}

/*_____________________________________________________________________________*/
void guiStart(void) {
    tsCalibrate();
    startMainPage();
}

/*_____________________________________________________________________________*/
void guiExe(void) {
	static bool alreadyPressed = false;

	tsRead(&gTsData);
	if (gTsData.valid == true) {
		if (alreadyPressed == false) {
			alreadyPressed = true;
			gUpdater(&gTsData);
		}
	} else {
		alreadyPressed = false;
	}
}

/*_____________________________________________________________________________*/
__attribute__((weak)) void guiReact(guiAction_T action) {

}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of gui.c
 ******************************************************************************/
