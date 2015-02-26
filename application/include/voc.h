/* 
 * File:   voc_freq.h
 * Author: nenad
 *
 * Created on 12 November 2014, 20:48
 */

#ifndef VOC_H
#define	VOC_H

/*=========================================================  INCLUDE FILES  ==*/

#include <stdint.h>

#include "base/error.h"

/*===============================================================  MACRO's  ==*/
/*------------------------------------------------------  C++ extern begin  --*/
#ifdef	__cplusplus
extern "C" {
#endif

/*============================================================  DATA TYPES  ==*/

struct voc_environment
{
    float           voltage;
    float           current;
    float           temperature;
};

struct voc_meas
{
    float           rcurr;
};

struct voc_record
{
    float           rcurr;
    float           rmin;
    float           rmax;
    float           temperature;
};

/*======================================================  GLOBAL VARIABLES  ==*/
/*===================================================  FUNCTION PROTOTYPES  ==*/

esError voc_init(void);

esError voc_env_voltage_set(int voltage);
void voc_env_get_current(struct voc_environment * environment);
void voc_env_update(void);

void voc_rec_start(void);
void voc_rec_stop(void);
uint32_t voc_rec_get_remaining_no(void);
void voc_rec_get_current(struct voc_record * record);
uint32_t voc_rec_get_current_no(void);
void voc_rec_get_by_id(uint32_t rec_no, struct voc_record * record);

void voc_meas_get_current(struct voc_meas * meas);

/*--------------------------------------------------------  C++ extern end  --*/
#ifdef __cplusplus
}
#endif

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//** @} *//*********************************************
 * END of voc.h
 ******************************************************************************/
#endif	/* VOC_H */

