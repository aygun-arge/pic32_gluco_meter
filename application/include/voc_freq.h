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

#ifdef	__cplusplus
extern "C" {
#endif

void voc_freq_init(void);
bool voc_is_sampling(void);
uint32_t voc_freq_raw(void);

#ifdef	__cplusplus
}
#endif

#endif	/* VOC_FREQ_H */

