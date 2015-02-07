/*
 * This file is part of tft
 *
 * Template version: 1.1.18 (24.12.2013)
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
 * @author  	Administrator
 * @brief       Interface of gui.
 * @defgroup    def_group Group name
 * @brief       Group brief
 *********************************************************************//** @{ */

#ifndef GUI_H_
#define GUI_H_

/*=========================================================  INCLUDE FILES  ==*/

#include "driver/touchscreen.h"
#include "draw_measure_page.h"
#include "draw_main_page.h"
#include "draw_edit_page.h"
#include "exe_meassure_page.h"

/*===============================================================  MACRO's  ==*/
/*------------------------------------------------------  C++ extern begin  --*/
#ifdef __cplusplus
extern "C" {
#endif
  
/*============================================================  DATA TYPES  ==*/
typedef void (*updater_T)(tsTouchData_t * tsData);

typedef enum {
	GUI_SENSOR_PRESSED = 0,
	GUI_SENSOR_RELEASED,
	GUI_START_STOP_PRESSED,
	GUI_START_STOP_RELEASED,
	GUI_REC_PRESSED,
	GUI_REC_RELEASED,
	GUI_HEATER_BACK_PRESSED,
	GUI_HEATER_OK_PRESSED,
	GUI_TIME_BACK_PRESSED,
	GUI_TIME_OK_PRESSED,
	GUI_MEASSURE_BACK_PRESSED
} guiAction_T;
/*======================================================  GLOBAL VARIABLES  ==*/
/*===================================================  FUNCTION PROTOTYPES  ==*/
void guiInit(void);
void guiStart(void);
void guiSetUpdater(updater_T upFunc);
void guiExe(void);
__attribute__((weak)) void guiReact(guiAction_T action);
/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of gui.h
 ******************************************************************************/
#endif /* GUI_H_ */
