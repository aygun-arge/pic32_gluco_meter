
/*=========================================================  INCLUDE FILES  ==*/

#include "sm_gui.h"
#include "eds/epa.h"
#include "gui.h"
#include "app_timer.h"
#include "voc_freq.h"

#include "drawing.h"
#include "dejavusansbold9.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define GUI_TABLE(entry)                                                        \
    entry(state_init,                TOP)                                        \
    entry(state_main,                TOP)

/*======================================================  LOCAL DATA TYPES  ==*/

enum gui_state_id
{
    ES_STATE_ID_INIT(GUI_TABLE)
};

enum gui_local_evt
{
    EVENT_REFRESH_LCD = ES_EVENT_LOCAL_ID
};

struct wspace
{
    struct appTimer     periodic;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static esAction state_init               (void *, const esEvent *);
static esAction state_main               (void *, const esEvent *);

/*=======================================================  LOCAL VARIABLES  ==*/

static const esSmTable  g_gui_table[] = ES_STATE_TABLE_INIT(GUI_TABLE);

/*======================================================  GLOBAL VARIABLES  ==*/


const struct esEpaDefine g_gui_epa = ES_EPA_DEFINE(
    CONFIG_EPA_GUI_NAME,
    CONFIG_EPA_GUI_PRIORITY,
    CONFIG_EPA_GUI_QUEUE_SIZE);
const struct esSmDefine  g_gui_sm = ES_SM_DEFINE(
    g_gui_table,
    sizeof(struct wspace),
    state_init);
struct esEpa *           g_gui;

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static esAction state_init(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_INIT: {
            
            appTimerInit(&wspace->periodic);
            guiInit();
            guiStart();

            return (ES_STATE_TRANSITION(state_main));
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_main(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(333), EVENT_REFRESH_LCD);
            drawMainPageResistanceString();
            drawFill(COLOR_BLUE);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            char buff[16];
            uint32_t            raw_value;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(250), EVENT_REFRESH_LCD);

            raw_value = voc_freq_raw();
            drawRectangleFilled(10,10,80,40, COLOR_BLACK);
            snprintf(buff, sizeof(buff), "%d", raw_value);
            drawString(20, 20, COLOR_WHITE, &dejaVuSansBold9ptFontInfo, buff);

            guiExe();

            return (ES_STATE_HANDLED());
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

/*
 * Brief GUI stuff
 */
void guiReact(guiAction_T action) {
	if (action == GUI_REC_PRESSED) {
		//startMeassurePage();
	}
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of sm_gui.c
 ******************************************************************************/