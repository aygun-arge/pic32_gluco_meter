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

#include "exe_main_page.h"
#include "draw_main_page.h"
#include "exe_edit_page.h"
#include "gui.h"
#include "colors.h"
#include <stdbool.h>

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
static bool sensorBtnPressed = false;
static bool ssBtnPressed = false;
static bool recBtnPressed = false;
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
static void heaterVoltageCtx(editPageCtxElement_T element) {
	startMainPage();
	if (element == EDIT_BUTTON_OK) {
		guiReact(GUI_HEATER_OK_PRESSED);
	} else {
		guiReact(GUI_HEATER_BACK_PRESSED);
	}
}

/*_____________________________________________________________________________*/
static void blowingTimeCtx(editPageCtxElement_T element) {
	startMainPage();
	if (element == EDIT_BUTTON_OK) {
		guiReact(GUI_TIME_OK_PRESSED);
	} else {
		guiReact(GUI_TIME_BACK_PRESSED);
	}
}

/*_____________________________________________________________________________*/
static inline void setButtonsColor(void) {
	if (sensorBtnPressed == true) {
		setMainPageButtonColor(SENSOR_BUTTON, COLOR_GREEN);
	} else {
		setMainPageButtonColor(SENSOR_BUTTON, COLOR_ORANGE);
	}
	if (ssBtnPressed == true) {
		setMainPageButtonColor(START_STOP_BUTTON, COLOR_GREEN);
	} else {
		setMainPageButtonColor(START_STOP_BUTTON, COLOR_ORANGE);
	}
	if (recBtnPressed == true) {
		setMainPageButtonColor(REC_BUTTON, COLOR_GREEN);
	} else {
		setMainPageButtonColor(REC_BUTTON, COLOR_ORANGE);
	}
}
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void startMainPage(void) {
	guiSetUpdater(updateMainPage);
	setButtonsColor();
	drawMainPage();
	drawMainPageMessages(getMainPageMessage());
}

/*_____________________________________________________________________________*/
void updateMainPage(tsTouchData_t * tsData) {
	if (tsData->xlcd > 20 && tsData->xlcd < 134) {								/* sensor ON/OFF button */
		if (tsData->ylcd > 20 && tsData->ylcd < 60) {
			if (sensorBtnPressed == false) {
				sensorBtnPressed = true;
		    	guiSetUpdater(updateEditPage);
		    	startEditPage(heaterVoltageCtx, SET_HEATER_VOLTAGE);
		    	guiReact(GUI_SENSOR_PRESSED);
			} else {
				sensorBtnPressed = false;
				setButtonsColor();
				redrawMainPageButton(SENSOR_BUTTON);
				guiReact(GUI_SENSOR_RELEASED);
			}
		}
	}
	if (tsData->xlcd > 20 && tsData->xlcd < 134) {								/* start/stop button */
		if (tsData->ylcd > 70 && tsData->ylcd < 110) {
			if (ssBtnPressed == false) {
				ssBtnPressed = true;
		    	guiSetUpdater(updateEditPage);
		    	startEditPage(blowingTimeCtx, INPUT_BLOWING_TIME);
		    	guiReact(GUI_START_STOP_PRESSED);
			} else {
				ssBtnPressed = false;
				setButtonsColor();
				redrawMainPageButton(START_STOP_BUTTON);
				guiReact(GUI_START_STOP_RELEASED);
			}
		}
	}
	if (tsData->xlcd > 160 && tsData->xlcd < 220) {								/* rec button */
		if (tsData->ylcd > 20 && tsData->ylcd < 88) {
			if (recBtnPressed == false) {
				recBtnPressed = true;
				guiReact(GUI_REC_PRESSED);
			} else {
				recBtnPressed = false;
				guiReact(GUI_REC_RELEASED);
			}
			setButtonsColor();
			redrawMainPageButton(REC_BUTTON);
		}
	}
}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of exe_main_page.c
 ******************************************************************************/
