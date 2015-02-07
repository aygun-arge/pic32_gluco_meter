/* 
 * File:   sm_gui.h
 * Author: nenad
 *
 * Created on 07 February 2015, 11:59
 */

#ifndef SM_GUI_H
#define	SM_GUI_H

#ifdef	__cplusplus
extern "C" {
#endif

#define CONFIG_EPA_GUI_NAME             "gui"
#define CONFIG_EPA_GUI_PRIORITY         1
#define CONFIG_EPA_GUI_QUEUE_SIZE       10

extern const struct esEpaDefine g_gui_epa;
extern const struct esSmDefine  g_gui_sm;
extern struct esEpa *           g_gui;

#ifdef	__cplusplus
}
#endif

#endif	/* SM_GUI_H */

