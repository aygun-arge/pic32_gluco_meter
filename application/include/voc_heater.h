/* 
 * File:   voc_heater.h
 * Author: nenad
 *
 * Created on April 14, 2015, 11:08 PM
 */

#ifndef VOC_HEATER_H
#define	VOC_HEATER_H

#include "base/error.h"

#ifdef	__cplusplus
extern "C" {
#endif

esError voc_heater_init(void);
void voc_heater_on(void);
void voc_heater_off(void);
esError voc_heater_set(int voltage);

#ifdef	__cplusplus
}
#endif

#endif	/* VOC_HEATER_H */

