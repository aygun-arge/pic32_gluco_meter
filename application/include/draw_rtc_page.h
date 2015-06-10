/* 
 * File:   draw_rtc_page.h
 * Author: nenad
 *
 * Created on April 25, 2015, 4:45 PM
 */

#ifndef DRAW_RTC_PAGE_H
#define	DRAW_RTC_PAGE_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

struct rtc_page_data
{
    uint32_t                    year;
    uint8_t                     month;
    uint8_t                     day;
    uint8_t                     hour;
    uint8_t                     minute;
};

void rtc_page_draw(const struct rtc_page_data * data);
void rtc_page_refresh(const struct rtc_page_data * data);

#ifdef	__cplusplus
}
#endif

#endif	/* DRAW_RTC_PAGE_H */

