/* 
 * File:   app_buzzer.h
 * Author: nenad
 *
 * Created on April 25, 2015, 3:01 PM
 */

#ifndef APP_BUZZER_H
#define	APP_BUZZER_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

void buzzer_init(void);
void buzzer_beep(uint32_t duration_ms);

#ifdef	__cplusplus
}
#endif

#endif	/* APP_BUZZER_H */

