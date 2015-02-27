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

#include <stdint.h>
#include <stdbool.h>

/*===============================================================  MACRO's  ==*/
/*------------------------------------------------------  C++ extern begin  --*/
#ifdef __cplusplus
extern "C" {
#endif
  
/*============================================================  DATA TYPES  ==*/

enum main_page_msg
{
    MSG_UNSTABLE = 0,
    MSG_STABLE,
    MSG_BLOW_PREPARE,
    MSG_BLOW_START,
    MSG_BLOW_STOP
};

struct main_page_overview
{
    float               resistance;
    float               voltage;
    uint8_t             current;
    uint8_t             temperature;
};

struct main_page_res
{
    float               r0;
    float               rmax;
    float               rmin;
};

struct main_page_ctx
{
    bool                is_switch_sensor_on;
    bool                is_switch_ss_on;
    bool                is_switch_rec_on;
};

/*======================================================  GLOBAL VARIABLES  ==*/
/*===================================================  FUNCTION PROTOTYPES  ==*/

void main_page_draw(struct main_page_ctx * ctx);
void main_page_msg(enum main_page_msg message);
void main_page_res(struct main_page_res * values);
void main_page_overview(struct main_page_overview * values);

/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of draw_main_page.h
 ******************************************************************************/
#endif /* DRAW_MAIN_PAGE_H_ */
