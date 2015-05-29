/* 
 * File:   draw_save_page.h
 * Author: nenad
 *
 * Created on May 16, 2015, 12:08 PM
 */

#ifndef DRAW_SAVE_PAGE_H
#define	DRAW_SAVE_PAGE_H

#ifdef	__cplusplus
extern "C" {
#endif

void save_page_draw(void);
void save_page_fail_draw(void);
void save_page_refresh(const char * name);


#ifdef	__cplusplus
}
#endif

#endif	/* DRAW_SAVE_PAGE_H */

