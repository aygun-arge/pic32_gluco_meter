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

#include "exe_meassure_page.h"
#include "exe_main_page.h"
#include "gui.h"
#include "colors.h"

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void startMeassurePage(void) {
	guiSetUpdater(updateMeassurePage);
	drawMeasurePage();
}

/*_____________________________________________________________________________*/
void updateMeassurePage(tsTouchData_t * tsData) {
	if (tsData->xlcd > 20 && tsData->xlcd < 110) {								/* sensor ON/OFF button */
		if (tsData->ylcd > 260 && tsData->ylcd < 300) {
		    guiSetUpdater(updateMainPage);
		    startMainPage();
		    guiReact(GUI_MEASSURE_BACK_PRESSED);
		}
	}
}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of exe_meassure_page.c
 ******************************************************************************/
