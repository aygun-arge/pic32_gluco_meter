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

#include "draw_main_page.h"
#include "drawing.h"
#include "colors.h"
#include "dejavusansbold9.h"
#include "verdanabold14.h"
#include <stdio.h>

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*=======================================================  LOCAL VARIABLES  ==*/
static uint16_t buttonColors[3] = {COLOR_RED, COLOR_RED, COLOR_RED};
static mainPageMessages_T gMsg = STABILISING_SENSOR;
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
void setMainPageButtonColor(mainPageButtons_T button, uint16_t color) {
	buttonColors[button] = color;
}

/*_____________________________________________________________________________*/
void drawMainPage(void) {
	drawFill(COLOR_BLUE);
	drawButton(20, 20, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[SENSOR_BUTTON], COLOR_BLACK, "Sensor ON/OFF");
	drawButton(20, 70, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[START_STOP_BUTTON], COLOR_BLACK, "Start/Stop");
	drawButton(160, 20, 60, 88, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[REC_BUTTON], COLOR_BLACK, "REC");
	drawString(13, 120, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Sensor resistance (Meg) :                  ");
	drawString(13, 140, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Heater       voltage [V] :                         ");
	drawString(10, 160, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "             current [mA] :                        ");
	drawString(13, 180, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "         temperature [C] :                         ");
}

/*_____________________________________________________________________________*/
void drawMainPageMessages(mainPageMessages_T message) {
	gMsg = message;
	switch (message) {
		case STABILISING_SENSOR : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "      stabilising sensor");
			break;
		}
		case SENSOR_READY : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "   sensor ready for use ");
			break;
		}
		case BE_READY : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "Be ready to blow after  ");
			drawString(10, 262, COLOR_YELLOW, &verdanabold14ptFontInfo, "beep, stop after second ");
			drawString(10, 289, COLOR_YELLOW, &verdanabold14ptFontInfo, "      second beep       ");
			break;
		}
		case START_BLOWING : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "  Start blowing gently  ");
			drawString(10, 262, COLOR_YELLOW, &verdanabold14ptFontInfo, "    into the device     ");
			drawString(10, 289, COLOR_YELLOW, &verdanabold14ptFontInfo, "                        ");
			break;
		}
		case STOP_BLOWING : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "         Stop blowing   ");
			drawString(10, 262, COLOR_YELLOW, &verdanabold14ptFontInfo, "                        ");
			drawString(10, 289, COLOR_YELLOW, &verdanabold14ptFontInfo, "                        ");
			break;
		}
		default : {
			;
		}
	}
}

/*_____________________________________________________________________________*/
mainPageMessages_T getMainPageMessage(void) {

	return gMsg;
}

/*_____________________________________________________________________________*/
void drawMainPageResistanceString(void) {
	drawString(11, 210, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Ro:       ,Rmax:       ,Rmin:    ");
}

/*_____________________________________________________________________________*/
void drawMainPageResistanceValues(resistanceValues_T * values) {
	char buff[16];

	snprintf(buff, sizeof(buff), "%3.2f", (double)values->ro);
	drawString(35, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
	snprintf(buff, sizeof(buff), "%3.2f", (double)values->rmax);
	drawString(120, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
	snprintf(buff, sizeof(buff), "%3.2f", (double)values->rmin);
	drawString(200, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
}

/*_____________________________________________________________________________*/
void drawMainPageParametars(mainPageParameters_T * params) {
	char buff[16];

    drawRectangleFilled(200, 120, 240, 180, COLOR_BLUE);
	snprintf(buff, sizeof(buff), "%2.3f", (double)params->resistance);
	drawString(200, 120, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
	snprintf(buff, sizeof(buff), "%3.2f", (double)params->voltage);
	drawString(200, 140, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
	snprintf(buff, sizeof(buff), "%2d", params->current);
	drawString(200, 160, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
	snprintf(buff, sizeof(buff), "%2d", params->temperature);
	drawString(200, 180, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);
}

/*_____________________________________________________________________________*/
void redrawMainPageButton(mainPageButtons_T button) {
	switch (button) {
		case SENSOR_BUTTON : {
			drawButton(20, 20, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[SENSOR_BUTTON], COLOR_BLACK, "Sensor ON/OFF");
			break;
		}
		case START_STOP_BUTTON : {
			drawButton(20, 70, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[START_STOP_BUTTON], COLOR_BLACK, "Start/Stop");
			break;
		}
		case REC_BUTTON : {
			drawButton(160, 20, 60, 88, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, buttonColors[REC_BUTTON], COLOR_BLACK, "REC");
			break;
		}
		default : {
			;
		}
	}
}
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_main_page.c
 ******************************************************************************/
