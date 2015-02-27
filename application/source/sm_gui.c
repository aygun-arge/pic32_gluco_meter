
/*=========================================================  INCLUDE FILES  ==*/

#include "sm_gui.h"
#include "eds/epa.h"
#include "gui.h"
#include "app_timer.h"
#include "voc.h"

#include "drawing.h"
#include "dejavusansbold9.h"
#include "sm_voc.h"

#include "draw_main_page.h"
#include "draw_edit_page.h"
#include "draw_measure_page.h"
#include "MDD/FSIO.h"
#include "main.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define GUI_TABLE(entry)                                                        \
    entry(state_init,                TOP)                                       \
    entry(state_main,                TOP)                                       \
    entry(state_set_voltage,         TOP)                                       \
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
    EVENT_TIMEOUT_PREP_MEAS,
    EVENT_GUI_SENSOR_ACTIVE,
    EVENT_GUI_SENSOR_INACTIVE,
    EVENT_GUI_SS_ACTIVE,
    EVENT_GUI_SS_INACTIVE,
    EVENT_GUI_REC_ACTIVE,
    EVENT_GUI_REC_INACTIVE,
    EVENT_GUI_BTN_BACK,
    EVENT_GUI_BTN_OK
};

struct wspace
{
    struct appTimer     periodic;
    struct appTimer     timeout;
    float               curr_r0;
    float               prev_r0;
    struct voc_record   curr;
    struct voc_record   prev;
    struct main_page_ctx main_page_ctx;
};

struct device_state
{
    int                 blowing_time;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static esAction state_init              (void *, const esEvent *);
static esAction state_main              (void *, const esEvent *);
static esAction state_set_voltage       (void *, const esEvent *);
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
            app_timer_init(&wspace->periodic);
            app_timer_init(&wspace->timeout);
            gui_init();
            gui_start();

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
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(400), EVENT_REFRESH_LCD);
            main_page_draw(&wspace->main_page_ctx);

            if (g_voc_is_stabilised) {
                main_page_msg(MSG_STABLE);
            } else {
                main_page_msg(MSG_UNSTABLE);
            }

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->periodic);
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview overview;
            struct voc_environment  env;
            struct voc_meas         meas;

            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            overview.resistance  = meas.rcurr;
            overview.current     = env.current;
            overview.voltage     = env.voltage;
            overview.temperature = env.temperature;
            main_page_overview(&overview);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_SENSOR_IS_STABLE: {
            main_page_msg(MSG_STABLE);

            return (ES_STATE_HANDLED());
        }
        case EVENT_SENSOR_IS_UNSTABLE: {
            main_page_msg(MSG_UNSTABLE);

            return (ES_STATE_HANDLED());
        }
        case EVENT_GUI_SENSOR_ACTIVE: {

            return (ES_STATE_TRANSITION(state_set_voltage));
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}
static esAction state_set_voltage(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            edit_page_draw(SET_HEATER_VOLTAGE);
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(100u), EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->periodic);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(100u), EVENT_REFRESH_LCD);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_GUI_BTN_BACK: {
            return (ES_STATE_TRANSITION(state_main));
        }
        case EVENT_GUI_BTN_OK: {
            voc_env_voltage_set(edit_page_get_value());

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

            main_page_draw(&wspace->main_page_ctx);
            main_page_msg(MSG_BLOW_PREPARE);
            app_timer_start(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(3000), EVENT_TIMEOUT_PREP_MEAS);
            voc_meas_get_current(&meas);
            wspace->curr_r0 = meas.rcurr;
            voc_rec_start();

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->timeout);
            return (ES_STATE_HANDLED());
        }
        case EVENT_TIMEOUT_PREP_MEAS: {
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
            main_page_msg(MSG_BLOW_START);
            app_timer_start(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(g_device_state.blowing_time * 10u), EVENT_TIMEOUT_PREP_MEAS);
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->periodic);
            app_timer_cancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview   overview;
            struct main_page_res        res;
            struct voc_environment      env;
            struct voc_meas             meas;

            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            voc_rec_get_current(&wspace->curr);
            overview.resistance  = meas.rcurr;
            overview.current     = env.current;
            overview.voltage     = env.voltage;
            overview.temperature = env.temperature;
            main_page_overview(&overview);
            res.r0      = wspace->curr_r0;
            res.rmin    = wspace->curr.rmin;
            res.rmax    = wspace->curr.rmax;
            main_page_res(&res);
            gui_exe();
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_TIMEOUT_PREP_MEAS: {
            wspace->main_page_ctx.is_switch_ss_on = false;
            
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
            main_page_msg(MSG_BLOW_STOP);
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            app_timer_start(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(60000u), EVENT_TIMEOUT_PREP_MEAS);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->periodic);
            app_timer_cancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview   overview;
            struct voc_environment      env;
            struct voc_meas             meas;

            if (voc_rec_get_remaining_no() == 0) {
                return (ES_STATE_TRANSITION(state_meas_overview));
            }
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            overview.resistance  = meas.rcurr;
            overview.current     = env.current;
            overview.voltage     = env.voltage;
            overview.temperature = env.temperature;
            main_page_overview(&overview);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_TIMEOUT_PREP_MEAS: {

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
            struct meas_page_data curr;
            struct meas_page_data prev;

            curr.r0        = wspace->curr_r0;
            curr.rmin      = wspace->curr.rmin;
            curr.rmax      = wspace->curr.rmax;
            curr.rRatio    = 0.0;

            if (wspace->curr.rmin > 0.0) {
                curr.rRatio = wspace->curr.rmax / wspace->curr.rmin;
            }
            prev.r0        = wspace->prev_r0;
            prev.rmin      = wspace->prev.rmin;
            prev.rmax      = wspace->prev.rmax;
            prev.rRatio    = 0.0;

            if (wspace->prev.rmin > 0.0) {
                curr.rRatio = wspace->prev.rmax / wspace->prev.rmin;
            }
            meas_page_draw(&curr, &prev);
            
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
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            
            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->periodic);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            app_timer_start(&wspace->periodic, ES_VTMR_TIME_TO_TICK_MS(200u), EVENT_REFRESH_LCD);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        default: {

            return (ES_STATE_IGNORED());
        }
    }
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void gui_event(enum gui_action action)
{
    esError                     error;
    esEvent *                   event;
    uint16_t                    id;

    switch (action) {
        case GUI_SENSOR_ACTIVE: {
            id = EVENT_GUI_SENSOR_ACTIVE;
            break;
        }
        case GUI_SENSOR_INACTIVE: {
            id = EVENT_GUI_SENSOR_INACTIVE;
            break;
        }
        case GUI_SS_ACTIVE: {
            id = EVENT_GUI_SS_ACTIVE;
            break;
        }
        case GUI_SS_INACTIVE: {
            id = EVENT_GUI_SS_INACTIVE;
            break;
        }
        case GUI_REC_ACTIVE: {
            id = EVENT_GUI_REC_ACTIVE;
            break;
        }
        case GUI_REC_INACTIVE: {
            id = EVENT_GUI_REC_INACTIVE;
            break;
        }
        case GUI_BTN_BACK: {
            id = EVENT_GUI_BTN_BACK;
            break;
        }
        case GUI_BTN_OK: {
            id = EVENT_GUI_BTN_OK;
            break;
        }
        default: {
            return;
        }
    }
    ES_ENSURE(error = esEventCreate(sizeof(esEvent), id, &event));

    if (!error) {
        esEpaSendEvent(g_gui, event);
    }
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of sm_gui.c
 ******************************************************************************/
