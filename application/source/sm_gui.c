
/*=========================================================  INCLUDE FILES  ==*/

#include "sm_gui.h"
#include "eds/epa.h"
#include "gui.h"
#include "app_timer.h"
#include "voc_freq.h"

#include "drawing.h"
#include "dejavusansbold9.h"
#include "sm_voc.h"

#include "exe_main_page.h"
#include "exe_edit_page.h"
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
    EVENT_PREP_MEAS_TIMOUT
};

struct wspace
{
    struct appTimer     periodic;
    struct appTimer     timeout;
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
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(400), EVENT_REFRESH_LCD);
            startMainPage();

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T params;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            params.current = g_voc_current;
            params.voltage = g_voc_voltage;
            params.resistance = g_voc_resistance;
            params.temperature = g_voc_temperature;
            drawMainPageParametars(&params);

            if (g_is_voc_stabilised) {
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
            drawMainPageMessages(BE_READY);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(3000), EVENT_PREP_MEAS_TIMOUT);

            return (ES_STATE_HANDLED());
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
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(g_device_state.blowing_time * 10u), EVENT_PREP_MEAS_TIMOUT);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T params;
            resistanceValues_T res;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            params.current = g_voc_current;
            params.voltage = g_voc_voltage;
            params.resistance = g_voc_resistance;
            params.temperature = g_voc_temperature;
            drawMainPageParametars(&params);

            res.ro      = g_voc_ro;
            res.rmin    = g_voc_rmin;
            res.rmax    = g_voc_rmax;
            drawMainPageResistanceValues(&res);
            
            guiExe();
        }
        case EVENT_PREP_MEAS_TIMOUT: {
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
            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(g_device_state.blowing_time * 10u), EVENT_PREP_MEAS_TIMOUT);
            appTimerStart(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            appTimerCancel(&wspace->periodic);
            appTimerCancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            mainPageParameters_T params;
            resistanceValues_T res;

            appTimerStart(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            params.current = g_voc_current;
            params.voltage = g_voc_voltage;
            params.resistance = g_voc_resistance;
            params.temperature = g_voc_temperature;
            drawMainPageParametars(&params);

            res.ro      = g_voc_ro;
            res.rmin    = g_voc_rmin;
            res.rmax    = g_voc_rmax;
            drawMainPageResistanceValues(&res);

            guiExe();
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

            return (ES_STATE_HANDLED());
        }
        case EVENT_PREP_MEAS_TIMOUT: {
            return (ES_STATE_TRANSITION(state_meas_overview));
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
            esError             err;

            if (g_device_state.is_sensor_enabled) {
                err = voc_set_voltage(0);

                if (!err) {
                    g_device_state.is_sensor_enabled = false;
                }
            } else {
                
            }
            break;
        }
        case GUI_START_STOP_PRESSED: {
            break;
        }
        case GUI_START_STOP_RELEASED: {
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
            esError     err;

            value = getEditValue();

            if (value > 600) {
                value = 600;
            }
            err = voc_set_voltage(value);

            if (!err) {
                g_device_state.is_sensor_enabled = true;
                g_device_state.heater_voltage = value;
                return;
            }
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