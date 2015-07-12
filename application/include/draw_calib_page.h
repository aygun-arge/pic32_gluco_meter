/* 
 * File:   draw_ps_apply.h
 * Author: nenad
 *
 * Created on June 10, 2015, 10:03 AM
 */

#ifndef DRAW_CALIB_PAHE_H_
#define	DRAW_CALIB_PAHE_H_

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

struct calib
{
    uint32_t            voc;
};

void calib_draw(void);
void calib_update(struct calib * calib);

#ifdef	__cplusplus
}
#endif

#endif	/* DRAW_CALIB_PAHE_H_ */

