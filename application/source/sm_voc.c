

/*=========================================================  INCLUDE FILES  ==*/

#include <math.h>

#include "eds/epa.h"
#include "app_timer.h"
#include "voc.h"

#include "sm_voc.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define CONFIG_D_RCURR_PERCENT                  2.0

#define VOC_TABLE(entry)                                                        \
    entry(state_init,                TOP)                                       

/*======================================================  LOCAL DATA TYPES  ==*/

enum voc_state_id
{
    ES_STATE_ID_INIT(VOC_TABLE)
};

enum voc_local_evt
{
    EVENT_REFRESH_STATE = ES_EVENT_LOCAL_ID,
};

struct wspace
{
    struct appTimer     periodic;
    struct voc_meas     prev;
    struct voc_meas     curr;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static esAction state_init               (void *, const esEvent *);

/*=======================================================  LOCAL VARIABLES  ==*/

static const ES_MODULE_INFO_CREATE("VOC state machine", "Runs VOC state machine", "Nenad Radulovic");

static const esSmTable          g_voc_table[] = ES_STATE_TABLE_INIT(VOC_TABLE);

/*======================================================  GLOBAL VARIABLES  ==*/


const struct esEpaDefine        g_voc_epa = ES_EPA_DEFINE(
    CONFIG_EPA_VOC_NAME,
    CONFIG_EPA_VOC_PRIORITY,
    CONFIG_EPA_VOC_QUEUE_SIZE);
const struct esSmDefine         g_voc_sm = ES_SM_DEFINE(
    g_voc_table,
    sizeof(struct wspace),
    state_init);
struct esEpa *                  g_voc;

bool                            g_voc_is_stabilised;

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static esAction state_init(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_INIT: {
            appTimerInit(&wspace->periodic);
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(1000), EVENT_REFRESH_STATE);
            voc_env_update();
            voc_meas_get_current(&wspace->curr);
            voc_meas_get_current(&wspace->prev);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_STATE: {
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(1000), EVENT_REFRESH_STATE);
            voc_env_update();
            voc_meas_get_current(&wspace->curr);

            if (wspace->curr.rcurr > 0.001) {
                float           d_rcurr;
                float           rcurr_rel;

                d_rcurr = fabsf(wspace->curr.rcurr - wspace->prev.rcurr);
                rcurr_rel = d_rcurr / wspace->curr.rcurr;

                if (rcurr_rel < (CONFIG_D_RCURR_PERCENT / 100.0)) {
                    g_voc_is_stabilised = true;
                } else {
                    g_voc_is_stabilised = false;
                }
            } else {
                g_voc_is_stabilised = false;
            }
            wspace->prev = wspace->curr;

            return (ES_STATE_HANDLED());
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/
/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of sm_voc.c
 ******************************************************************************/