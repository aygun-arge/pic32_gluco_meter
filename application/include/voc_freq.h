/* 
 * File:   voc_freq.h
 * Author: nenad
 *
 * Created on 12 November 2014, 20:48
 */

#ifndef VOC_FREQ_H
#define	VOC_FREQ_H

#include <stdint.h>
#include <stdbool.h>

#include "base/error.h"

#ifdef	__cplusplus
extern "C" {
#endif

void voc_freq_init(void);
uint32_t voc_freq_raw(void);
void voc_voltage_init(void);
esError voc_set_voltage(int voltage);

#ifdef	__cplusplus
}
#endif

#endif	/* VOC_FREQ_H */

