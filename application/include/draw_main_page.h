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
 * @brief       Interface of draw_main_page.
 * @defgroup    def_group Group name
 * @brief       Group brief
 *********************************************************************//** @{ */

#ifndef DRAW_MAIN_PAGE_H_
#define DRAW_MAIN_PAGE_H_

/*=========================================================  INCLUDE FILES  ==*/
#include "stdint.h"
/*===============================================================  MACRO's  ==*/
/*------------------------------------------------------  C++ extern begin  --*/
#ifdef __cplusplus
extern "C" {
#endif
  
/*============================================================  DATA TYPES  ==*/
typedef enum {
	SENSOR_BUTTON = 0,
	START_STOP_BUTTON,
	REC_BUTTON
} mainPageButtons_T;

typedef enum {
	STABILISING_SENSOR = 0,
	SENSOR_READY,
	BE_READY,
	START_BLOWING,
	STOP_BLOWING
} mainPageMessages_T;

typedef struct {
	float 	sensorResistance;
	float 	heaterVoltage;
	uint8_t	current;
	uint8_t temperature;
} mainPageParameters_T;

typedef struct {
	float ro;
	float rmax;
	float rmin;
} resistanceValues_T;
/*======================================================  GLOBAL VARIABLES  ==*/
/*===================================================  FUNCTION PROTOTYPES  ==*/
void setMainPageButtonColor(mainPageButtons_T button, uint16_t color);
void drawMainPage(void);
void drawMainPageMessages(mainPageMessages_T message);
mainPageMessages_T getMainPageMessage(void);
void drawMainPageResistanceString(void);
void drawMainPageResistanceValues(resistanceValues_T * values);
void drawMainPageParametars(mainPageParameters_T * params);
void redrawMainPageButton(mainPageButtons_T button);
/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_main_page.h
 ******************************************************************************/
#endif /* DRAW_MAIN_PAGE_H_ */
