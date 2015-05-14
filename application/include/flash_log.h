/* 
 * File:   flash_log.h
 * Author: nenad
 *
 * Created on May 13, 2015, 10:31 AM
 */

#ifndef FLASH_LOG_H
#define	FLASH_LOG_H

#include "base/error.h"
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

esError flash_log_init(void);
uint32_t flash_log_num_of_logs(void);
void flash_log_erase(void);
esError flash_log_save(void * data, size_t size);
esError flash_log_restore(void * data, size_t size, uint32_t id);

#ifdef	__cplusplus
}
#endif

#endif	/* FLASH_LOG_H */

