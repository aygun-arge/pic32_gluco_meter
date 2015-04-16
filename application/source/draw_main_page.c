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
#include "gui.h"
#include <stdio.h>

/*=========================================================  LOCAL MACRO's  ==*/
/*======================================================  LOCAL DATA TYPES  ==*/
/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static void draw_switch_sensor(const struct main_page_ctx * ctx);
static void draw_switch_ss(const struct main_page_ctx * ctx);
static void draw_switch_rec(const struct main_page_ctx * ctx);
static void main_page_events(tsTouchData_t * ts_data);

/*=======================================================  LOCAL VARIABLES  ==*/
/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static void draw_switch_sensor(const struct main_page_ctx * ctx)
{
    uint16_t            color;

    if (ctx->is_switch_sensor_on) {
        color = COLOR_ORANGE;
    } else {
        color = COLOR_GREEN;
    }
    drawButton(20, 20, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, color, COLOR_BLACK, "Sensor ON/OFF");
}

static void draw_switch_ss(const struct main_page_ctx * ctx)
{
    uint16_t            color;

    if (ctx->is_switch_ss_on) {
        color = COLOR_ORANGE;
    } else {
        color = COLOR_GREEN;
    }
    drawButton(20, 70, 114, 40, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, color, COLOR_BLACK, "Start/Stop");
}

static void draw_switch_rec(const struct main_page_ctx * ctx)
{
    uint16_t            color;

    if (ctx->is_switch_rec_on) {
        color = COLOR_ORANGE;
    } else {
        color = COLOR_GREEN;
    }
    drawButton(160, 20, 60, 88, &dejaVuSansBold9ptFontInfo, 7, COLOR_BLACK, color, COLOR_BLACK, "REC");
}

static void main_page_events(tsTouchData_t * ts_data)
{
	if (ts_data->xlcd > 20 && ts_data->xlcd < 134) {								/* sensor ON/OFF button */
		if (ts_data->ylcd > 20 && ts_data->ylcd < 60) {
            gui_event(GUI_SWITCH_SENSOR);
		}
	}

	if (ts_data->xlcd > 20 && ts_data->xlcd < 134) {								/* start/stop button */
		if (ts_data->ylcd > 70 && ts_data->ylcd < 110) {
            gui_event(GUI_SWITCH_SS);
		}
	}

	if (ts_data->xlcd > 160 && ts_data->xlcd < 220) {								/* rec button */
		if (ts_data->ylcd > 20 && ts_data->ylcd < 88) {
            gui_event(GUI_SWITCH_REC);
		}
	}
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void main_page_init(struct main_page_ctx * ctx)
{
    ctx->is_switch_rec_on    = false;
    ctx->is_switch_sensor_on = false;
    ctx->is_switch_ss_on     = false;
}

void main_page_draw(struct main_page_ctx * ctx)
{
	drawFill(COLOR_BLUE);
    draw_switch_sensor(ctx);
    draw_switch_ss(ctx);
    draw_switch_rec(ctx);
    drawString(13, 120, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Resistance");
	drawString(13, 140, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Voltage");
	drawString(13, 160, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Current");
	drawString(13, 180, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Temperature");
    drawString(120, 120, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "[Meg]:");
	drawString(120, 140, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "[V]:");
	drawString(120, 160, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "[mA]:");
	drawString(120, 180, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "[C]:");
    gui_set_update(main_page_events);
}



void main_page_msg(enum main_page_msg message)
{
    drawRectangleFilled(10, 235, 230, 310, COLOR_BLUE);
    switch (message) {
		case MSG_UNSTABLE : {
			drawString(40, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "stabilising sensor");
			break;
		}
		case MSG_STABLE : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "sensor ready for use");
			break;
		}
		case MSG_BLOW_PREPARE : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "Be ready to blow after");
			drawString(10, 262, COLOR_YELLOW, &verdanabold14ptFontInfo, "beep, stop after");
			drawString(10, 289, COLOR_YELLOW, &verdanabold14ptFontInfo, "second beep");
			break;
		}
		case MSG_BLOW_START : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "Start blowing gently");
			drawString(10, 262, COLOR_YELLOW, &verdanabold14ptFontInfo, "into the device");
			break;
		}
		case MSG_BLOW_STOP : {
			drawString(10, 235, COLOR_YELLOW, &verdanabold14ptFontInfo, "Stop blowing");
			break;
		}
		default : {
			;
		}
	}
}



void main_page_res(struct main_page_res * values)
{
    char r0[16];
    char rmax[16];
    char rmin[16];

    snprintf(r0, sizeof(r0), "%3.4f", (double)values->r0);
    snprintf(rmax, sizeof(rmax), "%3.4f", (double)values->rmax);
    snprintf(rmin, sizeof(rmin), "%3.4f", (double)values->rmin);

    drawRectangleFilled(10, 210, 230, 220, COLOR_BLUE);
    drawString(11, 210, COLOR_CYAN, &dejaVuSansBold9ptFontInfo, "Ro:       ,Rmax:       ,Rmin:    ");
	drawString(35, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, r0);
	drawString(120, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, rmax);
	drawString(200, 210, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, rmin);
}



void main_page_overview(struct main_page_overview * values)
{
    char resistance[16];
    char voltage[16];
    char current[16];
    char temperature[16];

    snprintf(resistance, sizeof(resistance), "%3.4f", (double)values->resistance);
    snprintf(voltage, sizeof(voltage), "%3.3f", (double)values->voltage);
    snprintf(current, sizeof(current), "%3.3f", (double)values->current);
    snprintf(temperature, sizeof(temperature), "%3.3f", (double)values->temperature);
    drawRectangleFilled(170, 120, 240, 190, COLOR_BLUE);
	drawString(170, 120, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, resistance);
	drawString(170, 140, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, voltage);
	drawString(170, 160, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, current);
	drawString(170, 180, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, temperature);
}


void main_page_switch_sensor(struct main_page_ctx * ctx)
{
    draw_switch_sensor(ctx);
}



void main_page_switch_ss(struct main_page_ctx * ctx)
{
    draw_switch_ss(ctx);
}



void main_page_switch_rec(struct main_page_ctx * ctx)
{
    draw_switch_rec(ctx);
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_main_page.c
 ******************************************************************************/
