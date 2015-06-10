/* 
 * File:   sm_gui.h
 * Author: nenad
 *
 * Created on 07 February 2015, 11:59
 */

#ifndef SM_GUI_H
#define	SM_GUI_H

/*=========================================================  INCLUDE FILES  ==*/

#include "eds/epa.h"

/*===============================================================  MACRO's  ==*/

#define CONFIG_EPA_GUI_NAME             "gui"
#define CONFIG_EPA_GUI_PRIORITY         1
#define CONFIG_EPA_GUI_QUEUE_SIZE       10

/*------------------------------------------------------  C++ extern begin  --*/
#ifdef	__cplusplus
extern "C" {
#endif

/*============================================================  DATA TYPES  ==*/

enum gui_events
{
    EVENT_SENSOR_IS_STABLE = 1000,
    EVENT_SENSOR_IS_UNSTABLE,
    EVENT_VOC_REC_HAS_FINISHED
};

/*======================================================  GLOBAL VARIABLES  ==*/

extern const struct esEpaDefine g_gui_epa;
extern const struct esSmDefine  g_gui_sm;
extern struct esEpa *           g_gui;

/*===================================================  FUNCTION PROTOTYPES  ==*/
/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//** @} *//*********************************************
 * END of sm_gui.h
 ******************************************************************************/
#endif	/* SM_GUI_H */

