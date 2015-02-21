

/*=========================================================  INCLUDE FILES  ==*/

#include "eds/epa.h"
#include "app_timer.h"
#include "voc_freq.h"

#include "sm_voc.h"

/*=========================================================  LOCAL MACRO's  ==*/

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

float                           g_voc_voltage = 0.0f;
float                           g_voc_current = 0.0f;
float                           g_voc_temperature = 0.0f;
float                           g_voc_resistance  = 0.0f;
float                           g_voc_ro;
float                           g_voc_rmin;
float                           g_voc_rmax;
bool                            g_is_voc_stabilised;

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static esAction state_init(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_INIT: {

            appTimerInit(&wspace->periodic);
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_STATE);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_STATE: {
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_STATE);

            g_voc_voltage = 0.0;
            g_voc_current = 0.0;
            g_voc_temperature = 0.0;
            g_voc_resistance  = 0.0;

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