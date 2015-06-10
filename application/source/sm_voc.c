

/*=========================================================  INCLUDE FILES  ==*/

#include <math.h>

#include "eds/epa.h"
#include "app_timer.h"
#include "voc.h"

#include "sm_voc.h"
#include "sm_gui.h"

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
    bool                stabilisation_state;
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

static bool is_sensor_stable(float value)
{
    static uint32_t     sample_no;
    static float        sample_buff[10];
    uint32_t            idx;
    float               min_val;
    float               max_val;
    float               average_val;
    
    sample_buff[sample_no++] = value;

    if (sample_no == 10) {
        sample_no = 0;
    }
    average_val = 0;
    min_val = value;
    max_val = value;

    for (idx = 0; idx < 10; idx++) {
        average_val += sample_buff[idx];

        if (min_val > sample_buff[idx]) {
            min_val = sample_buff[idx];
        }

        if (max_val < sample_buff[idx]) {
            max_val = sample_buff[idx];
        }
    }
    average_val /= 10.0;

    if (max_val > (average_val * 1.02)) {
        return (false);
    }

    if (min_val < (average_val * 0.98)) {
        return (false);
    }

    return (true);
}


static esAction state_init(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_INIT: {
            app_timer_init(&wspace->periodic);
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(1000), EVENT_REFRESH_STATE);
            voc_env_update();

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_STATE: {
            struct voc_meas     meas;

            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(1000), EVENT_REFRESH_STATE);
            voc_env_update();
            voc_meas_get_current(&meas);

            g_voc_is_stabilised = is_sensor_stable(meas.rcurr);

            if ((meas.rcurr < 0.001) || (meas.rcurr > 99.0)) {
                g_voc_is_stabilised = false;
            }
            
            if (wspace->stabilisation_state != g_voc_is_stabilised) {
                esError         error;
                esEvent *       event;

                wspace->stabilisation_state  = g_voc_is_stabilised;

                if (g_voc_is_stabilised) {
                    ES_ENSURE(error = esEventCreate(sizeof(esEvent), EVENT_SENSOR_IS_STABLE, &event));
                } else {
                    ES_ENSURE(error = esEventCreate(sizeof(esEvent), EVENT_SENSOR_IS_UNSTABLE, &event));
                }

                if (!error) {
                    esEpaSendEvent(g_gui, event);
                }
            }

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