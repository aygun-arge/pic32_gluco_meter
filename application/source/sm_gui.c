
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
    entry(state_set_meas_time,       TOP)                                       \
    entry(state_start_meas,          TOP)                                       \
    entry(state_meas,                TOP)                                       \
    entry(state_stop_meas,           TOP)                                       \
    entry(state_meas_overview,       TOP)                                       \

#define VOC_PWR_ERRATA_0                1
#define VOC_PWR_SHDN_PORT               &GpioD
#define VOC_PWR_SHDN_PIN                1

#define LCD_REFRESH_RATE_SLOW           ES_VTMR_TIME_TO_TICK_MS(500)
#define LCD_REFRESH_RATE_FAST           ES_VTMR_TIME_TO_TICK_MS(100)
#define LCD_GUI_TOUCH_POLL              ES_VTMR_TIME_TO_TICK_MS(100)

/*======================================================  LOCAL DATA TYPES  ==*/

enum gui_state_id
{
    ES_STATE_ID_INIT(GUI_TABLE)
};

enum gui_local_evt
{
    EVENT_REFRESH_LCD = ES_EVENT_LOCAL_ID,
    EVENT_TOUCH_POLL,
    EVENT_TIMEOUT_PREP_MEAS,
    EVENT_GUI_SWITCH_SENSOR,
    EVENT_GUI_SWITCH_SS,
    EVENT_GUI_SWITCH_REC,
    EVENT_GUI_BTN_BACK,
    EVENT_GUI_BTN_OK
};

struct wspace
{
    struct appTimer     refresh;
    struct appTimer     poll;
    struct appTimer     timeout;
    float               curr_r0;
    float               prev_r0;
    struct voc_record   curr;
    struct voc_record   prev;
    struct main_page_ctx main_page_ctx;
    int                 blowing_time;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static esAction state_init              (void *, const esEvent *);
static esAction state_main              (void *, const esEvent *);
static esAction state_set_voltage       (void *, const esEvent *);
static esAction state_set_meas_time     (void *, const esEvent *);
static esAction state_start_meas        (void *, const esEvent *);
static esAction state_meas              (void *, const esEvent *);
static esAction state_stop_meas         (void *, const esEvent *);
static esAction state_meas_overview     (void *, const esEvent *);

/*=======================================================  LOCAL VARIABLES  ==*/

static const ES_MODULE_INFO_CREATE("GUI state machine", "Runs main GUI machine", "Nenad Radulovic");

static const esSmTable          g_gui_table[] = ES_STATE_TABLE_INIT(GUI_TABLE);

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
#if VOC_PWR_ERRATA_0
#else
            gpioSetAsOutput(VOC_PWR_SHDN_PORT, VOC_PWR_SHDN_PIN);
            gpioClrPin(VOC_PWR_SHDN_PORT, VOC_PWR_SHDN_PIN);
#endif
            memset(wspace, 0, sizeof(*wspace));
            wspace->blowing_time = 3000;
            app_timer_init(&wspace->refresh);
            app_timer_init(&wspace->poll);
            app_timer_init(&wspace->timeout);
            main_page_init(&wspace->main_page_ctx);
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
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
            app_timer_start(&wspace->poll, LCD_GUI_TOUCH_POLL, EVENT_TOUCH_POLL);
            main_page_draw(&wspace->main_page_ctx);

            if (g_voc_is_stabilised) {
                main_page_msg(MSG_STABLE);
            } else {
                main_page_msg(MSG_UNSTABLE);
            }

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);
            app_timer_cancel(&wspace->poll);
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview overview;
            struct voc_environment  env;
            struct voc_meas         meas;

            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
            voc_env_get_current(&env);
            voc_meas_get_current(&meas);
            overview.resistance  = meas.rcurr;
            overview.current     = env.current;
            overview.voltage     = env.voltage;
            overview.temperature = env.temperature;
            main_page_overview(&overview);

            if (wspace->main_page_ctx.is_switch_rec_on) {
                struct main_page_res        res;

                voc_rec_get_current(&wspace->curr);
                res.r0      = wspace->curr_r0;
                res.rmin    = wspace->curr.rmin;
                res.rmax    = wspace->curr.rmax;
                main_page_res(&res);
            }

            return (ES_STATE_HANDLED());
        }
        case EVENT_TOUCH_POLL: {
            app_timer_start(&wspace->poll, LCD_GUI_TOUCH_POLL, EVENT_TOUCH_POLL);
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
        case EVENT_VOC_REC_HAS_FINISHED: {
            if (wspace->main_page_ctx.is_switch_rec_on) {
                wspace->main_page_ctx.is_switch_rec_on = false;

                return (ES_STATE_TRANSITION(state_meas_overview));
            }
        }
        case EVENT_GUI_SWITCH_REC: {
            if (wspace->main_page_ctx.is_switch_rec_on) {
                wspace->main_page_ctx.is_switch_rec_on = false;

                voc_rec_stop();

                return (ES_STATE_TRANSITION(state_meas_overview));
            } else {
                struct voc_meas         meas;

                wspace->main_page_ctx.is_switch_rec_on = true;
                main_page_switch_rec(&wspace->main_page_ctx);
                voc_meas_get_current(&meas);
                wspace->curr_r0 = meas.rcurr;
                voc_rec_start();

                return (ES_STATE_HANDLED());
            }
        }
        case EVENT_GUI_SWITCH_SS: {
            wspace->main_page_ctx.is_switch_rec_on = false;
            voc_rec_stop();

            return (ES_STATE_TRANSITION(state_set_meas_time));
        }
        case EVENT_GUI_SWITCH_SENSOR: {

            if (wspace->main_page_ctx.is_switch_sensor_on) {
                wspace->main_page_ctx.is_switch_sensor_on = false;
                main_page_switch_sensor(&wspace->main_page_ctx);
#if VOC_PWR_ERRATA_0
#else
                gpioClrPin(VOC_PWR_SHDN_PORT, VOC_PWR_SHDN_PIN);
#endif
                voc_env_voltage_set(0);

                return (ES_STATE_HANDLED());
            } else {

                return (ES_STATE_TRANSITION(state_set_voltage));
            }
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
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_GUI_BTN_BACK: {
            wspace->main_page_ctx.is_switch_sensor_on = false;
            return (ES_STATE_TRANSITION(state_main));
        }
        case EVENT_GUI_BTN_OK: {
            wspace->main_page_ctx.is_switch_sensor_on = true;
#if VOC_PWR_ERRATA_0
#else
            gpioSetPin(VOC_PWR_SHDN_PORT, VOC_PWR_SHDN_PIN);
#endif
            voc_env_voltage_set(edit_page_get_value());

            return (ES_STATE_TRANSITION(state_main));
        }
        default: {
            return (ES_STATE_IGNORED());
        }
    }
}

static esAction state_set_meas_time(void * space, const esEvent * event) {
    struct wspace * wspace = space;

    switch (event->id) {
        case ES_ENTRY: {
            edit_page_draw(SET_BLOWING_TIME);
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_GUI_BTN_BACK: {
            wspace->main_page_ctx.is_switch_ss_on = false;
            
            return (ES_STATE_TRANSITION(state_main));
        }
        case EVENT_GUI_BTN_OK: {
            wspace->main_page_ctx.is_switch_ss_on  = true;
            wspace->main_page_ctx.is_switch_rec_on = true;
            wspace->blowing_time = edit_page_get_value();

            if (wspace->blowing_time > 30) {
                wspace->blowing_time = 30;
            }

            if (wspace->blowing_time < 4) {
                wspace->blowing_time = 4;
            }
            wspace->blowing_time *= 1000;

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

            wspace->main_page_ctx.is_switch_ss_on = true;
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
            app_timer_start(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(wspace->blowing_time), EVENT_TIMEOUT_PREP_MEAS);
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
            app_timer_start(&wspace->poll, LCD_GUI_TOUCH_POLL, EVENT_TOUCH_POLL);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);
            app_timer_cancel(&wspace->poll);
            app_timer_cancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_TOUCH_POLL: {
            app_timer_start(&wspace->poll, LCD_GUI_TOUCH_POLL, EVENT_TOUCH_POLL);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview   overview;
            struct main_page_res        res;
            struct voc_environment      env;
            struct voc_meas             meas;

            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
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
            
            return (ES_STATE_HANDLED());
        }
        case EVENT_VOC_REC_HAS_FINISHED:
        case EVENT_TIMEOUT_PREP_MEAS:
        case EVENT_GUI_SWITCH_SS: {
            wspace->main_page_ctx.is_switch_rec_on = false;
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
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
            app_timer_start(&wspace->timeout, ES_VTMR_TIME_TO_TICK_MS(10000u), EVENT_TIMEOUT_PREP_MEAS);

            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);
            app_timer_cancel(&wspace->timeout);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            struct main_page_overview   overview;
            struct voc_environment      env;
            struct voc_meas             meas;

            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_SLOW, EVENT_REFRESH_LCD);
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
        case EVENT_VOC_REC_HAS_FINISHED: {

            return (ES_STATE_TRANSITION(state_meas_overview));
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
                curr.rRatio = wspace->curr_r0 / wspace->curr.rmin;
            }
            prev.r0        = wspace->prev_r0;
            prev.rmin      = wspace->prev.rmin;
            prev.rmax      = wspace->prev.rmax;
            prev.rRatio    = 0.0;

            if (wspace->prev.rmin > 0.0) {
                prev.rRatio = wspace->prev_r0 / wspace->prev.rmin;
            }
            meas_page_draw(&curr, &prev);
            
            wspace->prev    = wspace->curr;
            wspace->prev_r0 = wspace->curr_r0;
            
            if (USBHostMSDSCSIMediaDetect()) {
                if (FSInit()) {
                    static uint32_t     file_num = 0;
                    uint32_t            records;
                    uint32_t            rec_no;
                    uint32_t            rec_txt_len;
                    struct voc_record   rec;
                    FSFILE *            data_file;
                    char                buffer[100];

                    for (;;) {
                        snprintf(buffer, sizeof(buffer), "log%d.csv", file_num);
                        data_file = FSfopen(buffer, "r");

                        if (data_file == NULL) {
                            break;
                        }
                        FSfclose(data_file);
                        file_num++;

                        if (file_num == 99999) {
                            break;
                        }
                    }
                    snprintf(buffer, sizeof(buffer), "log%d.csv", file_num++);
                    data_file = FSfopen(buffer, "w");
                    records = voc_rec_get_current_no();

                    for (rec_no = 0; rec_no < records; rec_no++) {
                        voc_rec_get_by_id(rec_no, &rec);
                        snprintf(buffer, sizeof(buffer), "%d,%f,%f,%f,%1.1f,%3.1f,\n",
                            rec_no * 10, 
                            (double)rec.rcurr,
                            (double)rec.rmax,
                            (double)rec.rmin,
                            (double)rec.voltage,
                            (double)rec.temperature);
                        rec_txt_len = strlen(buffer);
                        FSfwrite(buffer, 1, rec_txt_len, data_file);
                    }
                    FSfclose(data_file);
                }
            }
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);
            
            return (ES_STATE_HANDLED());
        }
        case ES_EXIT: {
            app_timer_cancel(&wspace->refresh);

            return (ES_STATE_HANDLED());
        }
        case EVENT_REFRESH_LCD: {
            app_timer_start(&wspace->refresh, LCD_REFRESH_RATE_FAST, EVENT_REFRESH_LCD);
            gui_exe();

            return (ES_STATE_HANDLED());
        }
        case EVENT_GUI_BTN_BACK: {

            return (ES_STATE_TRANSITION(state_main));
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
        case GUI_SWITCH_SENSOR: {
            id = EVENT_GUI_SWITCH_SENSOR;
            break;
        }
        case GUI_SWITCH_SS: {
            id = EVENT_GUI_SWITCH_SS;
            break;
        }
        case GUI_SWITCH_REC: {
            id = EVENT_GUI_SWITCH_REC;
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
