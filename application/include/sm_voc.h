/* 
 * File:   sm_voc_state.h
 * Author: nenad
 *
 * Created on 21 February 2015, 15:50
 */

#ifndef SM_VOC_STATE_H
#define	SM_VOC_STATE_H

#include <stdbool.h>

#ifdef	__cplusplus
extern "C" {
#endif

#define CONFIG_EPA_VOC_NAME             "voc state"
#define CONFIG_EPA_VOC_PRIORITY         2
#define CONFIG_EPA_VOC_QUEUE_SIZE       10

extern const struct esEpaDefine g_voc_epa;
extern const struct esSmDefine  g_voc_sm;
extern struct esEpa *           g_voc;

extern float                    g_voc_voltage;
extern float                    g_voc_current;
extern float                    g_voc_temperature;
extern float                    g_voc_resistance;
extern float                    g_voc_ro;
extern float                    g_voc_rmin;
extern float                    g_voc_rmax;
extern bool                     g_is_voc_stabilised;


#ifdef	__cplusplus
}
#endif

#endif	/* SM_VOC_STATE_H */

