/* 
 * File:   draw_rtc_page.h
 * Author: nenad
 *
 * Created on April 25, 2015, 4:45 PM
 */

#ifndef DRAW_INIT_LOG_PAGE_H
#define	DRAW_INIT_LOG_PAGE_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

struct init_log_page_data
{
    uint32_t                    num_of_logs;
};

void init_log_page_draw(const struct init_log_page_data * data);

#ifdef	__cplusplus
}
#endif

#endif	/* DRAW_INIT_LOG_PAGE_H */

