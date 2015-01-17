/***************************************************************************//**
 * @file		
 * @author      dejan 
 * @brief       Implementation of main.
 * @details     detalis
 *
 * Template version: 1.0.1 (26.07.2014)
 * 
 * Copyright (C) 2013, 2014 Dejan Ristic
 *
 * minimum is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * minimum is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *//************************************************************************//**
 * @addtogroup  group 
 *********************************************************************//** @{ */
 
/*_________________________________________________________  Include Files  __*/
#include "main.h"
#include "stm32f10x.h"
/*_________________________________________________________  Local Defines  __*/
/*_________________________________________________________  Local Macro's  __*/
/*______________________________________________________  Local Data Types  __*/
/*_______________________________________________________  Local Variables  __*/
/*______________________________________________________  Global Variables  __*/
/*_____________________________________________  Local Function Prototypes  __*/
void guiReact(guiAction_T action) {
	if (action == GUI_REC_PRESSED) {
		startMeassurePage();
	}
}
/*____________________________________________  Local Function Definitions  __*/
/*___________________________________________  Global Function Definitions  __*/

int main(void) {
    systickInit();
    guiInit();

    guiStart();

    drawMainPageResistanceString();
    mainPageParameters_T mpParams;

    mpParams.sensorResistance = 84.32;
    mpParams.heaterVoltage = 5.28;
    mpParams.current =	131;
    mpParams.temperature = 56;
    drawMainPageParametars(&mpParams);
    resistanceValues_T rValues;

    rValues.ro = 31.2;
    rValues.rmax = 35.3;
    rValues.rmin = 10.42;
    drawMainPageResistanceValues(&rValues);

	while (1) {
		GPIO_WriteBit(GPIOC, GPIO_Pin_8, Bit_SET);
		DelayMs(5);
		GPIO_WriteBit(GPIOC, GPIO_Pin_8, Bit_RESET);
		DelayMs(5);
		guiExe();
	}

	return (0);
}

/** @} *//*********************************************************************/
