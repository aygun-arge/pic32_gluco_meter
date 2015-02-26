
/*=========================================================  INCLUDE FILES  ==*/

#include "sm_gui.h"
#include "eds/epa.h"
#include "gui.h"
#include "app_timer.h"
#include "voc.h"

#include "drawing.h"
#include "dejavusansbold9.h"
#include "sm_voc.h"

#include "exe_main_page.h"
#include "exe_edit_page.h"
#include "MDD/FSIO.h"
#include "main.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define GUI_TABLE(entry)                                                        \
    entry(state_init,                TOP)                                       \
    entry(state_main,                TOP)                                       \
    entry(state_start_meas,          TOP)                                       \
    entry(state_meas,                TOP)                                       \
    entry(state_stop_meas,           TOP)                                       \
    entry(state_meas_overview,       TOP)                                       \

/*======================================================  LOCAL DATA TYPES  ==*/

enum gui_state_id
{
    ES_STATE_ID_INIT(GUI_TABLE)
};

enum gui_local_evt
{
    EVENT_REFRESH_LCD = ES_EVENT_LOCAL_ID,
    EVENT_START_MEAS,
    EVENT_STOP_MEAS,
    EVENT_OVERVIEW_MEAS,
    EVENT_PREP_MEAS_TIMOUT
};

struct wspace
{
    struct appTimer     periodic;
    struct appTimer     timeout;
    float               curr_r0;
    float               prev_r0;
    struct voc_record   curr;
    struct voc_record   prev;
};

struct device_state
{
    int                 blowing_time;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static esAction state_init              (void *, const esEvent *);
static esAction state_main              (void *, const esEvent *);
static esAction state_start_meas        (void *, const esEvent *);
static esAction state_meas              (void *, const esEvent *);
static esAction state_stop_meas         (void *, const esEvent *);
static esAction state_meas_overview     (void *, const esEvent *);

/*=======================================================  LOCAL VARIABLES  ==*/

static const ES_MODULE_INFO_CREATE("GUI state machine", "Runs main GUI machine", "Nenad Radulovic");

static const esSmTable          g_gui_table[] = ES_STATE_TABLE_INIT(GUI_TABLE);
static struct device_state      g_device_state =
{
    .blowing_time       = 300
};

/*======================================================  GLOBAL VARIABLES  ==*/


const struct esEpaDefine        g_gui_epa = ES_EPA_DEFINE(
    CONFIG_EPA_GUI_NAME,
    CONFIG_EPA_GUI_PRIORITY,
    CONFIG_EPA_GUI_QUEUE_SIZE);
const struct esSmDefine         g_gui_sm = ES_SM_DEFINE(
    g_gui_table,
    sizeof(struct wspace),
    state_init);
struct esEpa *                  g_gui;

/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static esAction state_init(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_INIT: {
            memset(wspace, 0, sizeof(*wspace));
            appTimerInit(&wspace->periodic);
            appTimerInit(&wspace->timeout);
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
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(400), EVENT_REFRESH_LCD);
            startMainPage();

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T    params;
            struct voc_environment  env;
            struct voc_meas         meas;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            params.resistance  = meas.rcurr;
            params.current     = env.current;
            params.voltage     = env.voltage;
            params.temperature = env.temperature;
            drawMainPageParametars(&params);

            if (g_voc_is_stabilised) {
                drawMainPageMessages(SENSOR_READY);
            } else {
                drawMainPageMessages(STABILISING_SENSOR);
            }
            guiExe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_START_MEAS: {
            
            return (ES_STATE_TRANSITION(state_start_meas));
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_start_meas(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            struct voc_meas         meas;

            drawMainPageMessages(BE_READY);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(3000), EVENT_PREP_MEAS_TIMOUT);
            voc_meas_get_current(&meas);
            wspace->curr_r0 = meas.rcurr;
            voc_rec_start();

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->timeout);
            return (ES_STATE_HANDLED());
        }
        case EVENT_STOP_MEAS: {
            return (ES_STATE_TRANSITION(state_main));
        }
        case EVENT_PREP_MEAS_TIMOUT: {
            return (ES_STATE_TRANSITION(state_meas));
        }
        default: {
            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_meas(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            drawMainPageMessages(START_BLOWING);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(g_device_state.blowing_time * 10u), EVENT_PREP_MEAS_TIMOUT);
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);
            appTimerCancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T    params;
            resistanceValues_T      res;
            struct voc_environment  env;
            struct voc_meas         meas;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            voc_rec_get_current(&wspace->curr);
            params.resistance  = meas.rcurr;
            params.current     = env.current;
            params.voltage     = env.voltage;
            params.temperature = env.temperature;
            drawMainPageParametars(&params);
            res.ro      = wspace->curr_r0;
            res.rmin    = wspace->curr.rmin;
            res.rmax    = wspace->curr.rmax;
            drawMainPageResistanceValues(&res);
            
            guiExe();
            return (ES_STATE_HANDLED());
        }
        case EVENT_STOP_MEAS: {
            return (ES_STATE_TRANSITION(state_meas_overview));
        }
        case EVENT_PREP_MEAS_TIMOUT: {
            main_page_btn_set_is_pressed(BTN_SS_ID, false);
            return (ES_STATE_TRANSITION(state_stop_meas));
        }
        default: {
            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_stop_meas(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            drawMainPageMessages(STOP_BLOWING);
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(60000u), EVENT_PREP_MEAS_TIMOUT);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);
            appTimerCancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T    params;
            struct voc_environment  env;
            struct voc_meas         meas;

            if (voc_rec_get_remaining_no() == 0) {
                return (ES_STATE_TRANSITION(state_meas_overview));
            }
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            params.resistance  = meas.rcurr;
            params.current     = env.current;
            params.voltage     = env.voltage;
            params.temperature = env.temperature;
            drawMainPageParametars(&params);
            guiExe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_STOP_MEAS: {
            
            return (ES_STATE_TRANSITION(state_meas_overview));
        }
        case EVENT_PREP_MEAS_TIMOUT: {

            return (ES_STATE_TRANSITION(state_meas_overview));
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_meas_overview(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            measurePageData_T meas_data;

            startMeassurePage();
            meas_data.ro        = wspace->curr_r0;
            meas_data.rmin      = wspace->curr.rmin;
            meas_data.rmax      = wspace->curr.rmax;
            meas_data.rRatio    = 0.0;

            if (wspace->curr.rmin > 0.0) {
                meas_data.rRatio = wspace->curr.rmax / wspace->curr.rmin;
            }
            draw_meas_curr_results(&meas_data);
            meas_data.ro        = wspace->prev_r0;
            meas_data.rmin      = wspace->prev.rmin;
            meas_data.rmax      = wspace->prev.rmax;
            meas_data.rRatio    = 0.0;

            if (wspace->prev.rmin > 0.0) {
                meas_data.rRatio = wspace->prev.rmax / wspace->prev.rmin;
            }
            draw_meas_prev_results(&meas_data);
            wspace->prev    = wspace->curr;
            wspace->prev_r0 = wspace->curr_r0;
            
            if (USBHostMSDSCSIMediaDetect()) {
                if (FSInit()) {
                    uint32_t            records;
                    uint32_t            rec_no;
                    uint32_t            rec_txt_len;
                    struct voc_record   rec;
                    FSFILE *            data_file;
                    char                buffer[100];

                    data_file = FSfopen("dataset.csv", "w");

                    records = voc_rec_get_current_no();

                    for (rec_no = 0; rec_no < records; rec_no++) {
                        voc_rec_get_by_id(rec_no, &rec);
                        snprintf(buffer, sizeof(buffer), "%d,%f,%f,%f,%f,\n",
                            rec_no * 10, 
                            (double)rec.rcurr,
                            (double)rec.rmax,
                            (double)rec.rmin,
                            (double)rec.temperature);
                        rec_txt_len = strlen(buffer);
                        FSfwrite(buffer, 1, rec_txt_len, data_file);
                    }
                    FSfclose(data_file);
                }
            }
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            
            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            guiExe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_OVERVIEW_MEAS: {
            return (ES_STATE_TRANSITION(state_main));
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void guiReact(guiAction_T action)
{
    switch (action) {
        case GUI_SENSOR_PRESSED: {
            break;
        }
        case GUI_SENSOR_RELEASED: {
            voc_env_voltage_set(0);
            break;
        }
        case GUI_START_STOP_PRESSED: {
            break;
        }
        case GUI_START_STOP_RELEASED: {
            esError     err;
            esEvent *   event;

            err = esEventCreate(sizeof(esEvent), EVENT_STOP_MEAS, &event);

            if (!err) {
                ES_ENSURE(esEpaSendEvent(g_gui, event));
            }
            break;
        }
        case GUI_REC_PRESSED: {
            break;
        }
        case GUI_REC_RELEASED: {
            break;
        }
        case GUI_HEATER_BACK_PRESSED: {
            break;
        }
        case GUI_HEATER_OK_PRESSED: {
            uint16_t    value;

            value = getEditValue();

            if (value > 600) {
                value = 600;
            }
            voc_env_voltage_set(value);
            break;
        }
        case GUI_TIME_BACK_PRESSED: {
            break;
        }
        case GUI_TIME_OK_PRESSED: {
            uint16_t    value;
            esError     err;
            esEvent *   event;

            value = getEditValue();

            if (value > 1000) {
                value = 1000;
            }
            g_device_state.blowing_time = value;

            err = esEventCreate(sizeof(esEvent), EVENT_START_MEAS, &event);

            if (!err) {
                ES_ENSURE(esEpaSendEvent(g_gui, event));
            }
            break;
        }
        case GUI_MEASSURE_BACK_PRESSED: {
            esError     err;
            esEvent *   event;

            err = esEventCreate(sizeof(esEvent), EVENT_OVERVIEW_MEAS, &event);

            if (!err) {
                ES_ENSURE(esEpaSendEvent(g_gui, event));
            }
            break;
            break;
        }
        default: {
            break;
        }
    }
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of sm_gui.c
 ******************************************************************************/
