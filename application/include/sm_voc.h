/* 
 * File:   sm_voc_state.h
 * Author: nenad
 *
 * Created on 21 February 2015, 15:50
 */

#ifndef SM_VOC_H
#define	SM_VOC_H

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

extern bool                     g_voc_is_stabilised;

#ifdef	__cplusplus
}
#endif

#endif	/* SM_VOC_H */

