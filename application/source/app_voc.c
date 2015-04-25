


#include "voc_heater.h"
/*=========================================================  INCLUDE FILES  ==*/

#include <xc.h>
#include <stdbool.h>

#include "HardwareProfile.h"
#include "TimeDelay.h"

#include "arch/intr.h"
#include "driver/mlx90614.h"
#include "driver/ad5282.h"
#include "driver/ina219.h"
#include "main.h"
#include "voc.h"
#include "eds/epa.h"
#include "base/error.h"
#include "base/debug.h"
#include "sm_gui.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define CONFIG_IC_SELECTION             4
#define CONFIG_NUM_OF_SAMPLES           8
#define CONFIG_VOC_VOLTAGE_COEF_1000    255
#define CONFIG_BUFFER_SIZE              2048

#define ICxCON_ON                       (0x1u << 15)
#define ICxCON_FEDGE                    (0x1u << 9)
#define ICxCON_C32                      (0x1u << 8)
#define ICxCON_ICTMR                    (0x1u << 7)
#define ICxCON_ICI_Pos                  (5)
#define ICxCON_ICI_Msk                  (0x3u << ICxCON_ICI_Pos)
#define ICxCON_ICI(x)                   (((x) << ICxCON_ICI_Pos) & ICxCON_ICI_Msk)
#define ICxCON_ICOV                     (0x1u << 4)
#define ICxCON_ICBNE                    (0x1u << 3)
#define ICxCON_ICM_Pos                  (0)
#define ICxCON_ICM_Msk                  (0x7u << ICxCON_ICM_Pos)
#define ICxCON_ICM(x)                   (((x) << ICxCON_ICM_Pos) & ICxCON_ICM_Msk)

#define ICxCON_EVERY_FOURTH             3
#define ICxCON_EVERY_THIRD              2
#define ICxCON_EVERY_SECOND             1
#define ICxCON_EVERY_EVENT              0

#define ICxCON_MODE_INTERRUPT           7
#define ICxCON_MODE_SIMPLE_EVERY        6
#define ICxCON_MODE_PRESCALED_16        5
#define ICxCON_MODE_PRESCALED_4         4
#define ICxCON_MODE_SIMPLE_RISING       3
#define ICxCON_MODE_SIMPLE_FALLING      2
#define ICxCON_MODE_EDGE_DETECT         1
#define ICxCON_MODE_DISABLED            0

#define FREQ_TMR_A_CON                  T2CON
#define FREQ_TMR_A                      TMR2
#define FREQ_TMR_A_PR                   PR2
#define FREQ_TMR_B_CON                  T3CON

#define MEAS_TMR_A_CON                  T4CON
#define MEAS_TMR_A                      TMR4
#define MEAS_TMR_A_PR                   PR4
#define MEAS_TMR_B_CON                  T4CON
#define MEAS_TMR_IEC                    IEC0
#define MEAS_TMR_IFS                    IFS0
#define MEAS_TMR_IPC                    IPC5
#define MEAS_TMR_PRIO_BIT               0
#define MEAS_TMR_ISR_BIT                20
#define MEAS_PERIOD_HZ                  50
#define MEAS_TMR_VECTOR                 _TIMER_5_VECTOR

#if (CONFIG_IC_SELECTION == 1)
#define IC_VECTOR                       _INPUT_CAPTURE_1_VECTOR
#define ICxCON                          IC1CON
#define ICxBUF                          IC1BUF
#define ICxIEC                          IEC0
#define ICxIFS                          IFS0
#define ICxIPC                          IPC1
#define ICxISR_BIT                      5
#define ICxPRIO_BIT                     8
#elif (CONFIG_IC_SELECTION == 2)
#define IC_VECTOR                       _INPUT_CAPTURE_2_VECTOR
#define ICxCON                          IC2CON
#define ICxBUF                          IC2BUF
#define ICxIEC                          IEC0
#define ICxIFS                          IFS0
#define ICxIPC                          IPC2
#define ICxISR_BIT                      9
#define ICxPRIO_BIT                     8
#elif (CONFIG_IC_SELECTION == 3)
#define IC_VECTOR                       _INPUT_CAPTURE_3_VECTOR
#define ICxCON                          IC3CON
#define ICxBUF                          IC3BUF
#define ICxIEC                          IEC0
#define ICxIFS                          IFS0
#define ICxIPC                          IPC3
#define ICxISR_BIT                      13
#define ICxPRIO_BIT                     8
#elif (CONFIG_IC_SELECTION == 4)
#define IC_VECTOR                       _INPUT_CAPTURE_4_VECTOR
#define ICxCON                          IC4CON
#define ICxBUF                          IC4BUF
#define ICxIEC                          IEC0
#define ICxIFS                          IFS0
#define ICxIPC                          IPC4
#define ICxISR_BIT                      17
#define ICxPRIO_BIT                     8
#define ICxTRIS                         TRISD
#define ICxPIN                          11
#else
#define IC_VECTOR                       _INPUT_CAPTURE_5_VECTOR
#define ICxCON                          IC5CON
#define ICxBUF                          IC5BUF
#define ICxIEC                          IEC0
#define ICxIFS                          IFS0
#define ICxIPC                          IPC5
#define ICxISR_BIT                      20
#define ICxPRIO_BIT                     8
#endif

#define TxCON_ON                        (0x1u << 15)
#define TxCON_TWDIS                     (0x1u << 12)
#define TxCON_TWIP                      (0x1u << 11)
#define TxCON_TGATE                     (0x1u << 7)
#define TxCON_TCKPS_Pos                 (4)
#define TxCON_TCKPS_Msk                 (0x7u << TxCON_TCKPS_Pos)
#define TxCON_TCKPS(x)                  (((x) << TxCON_TCKPS_Pos) & TxCON_TCKPS_Msk)
#define TxCON_T32                       (0x1u << 3)
#define TxCON_TSYNC                     (0x1u << 2)
#define TxCON_TCS                       (0x1u << 1)

/*======================================================  LOCAL DATA TYPES  ==*/

struct voc_cal
{
    uint32_t                    section;
    float                       coef;
};

/*=============================================  LOCAL FUNCTION PROTOTYPES  ==*/

static float current_value(void);
static void rec_init(void);
static esError env_init(void);

/*=======================================================  LOCAL VARIABLES  ==*/

static const ES_MODULE_INFO_CREATE("VOC", "VOC", "Nenad Radulovic");

static uint32_t                 g_current_raw_val;
static struct ina219_handle     g_ina219;
static struct mlx90614_handle   g_mlx90614;
static struct voc_record        g_buffer[CONFIG_BUFFER_SIZE];
static uint32_t                 g_buffer_current;
static struct voc_environment   g_environment;

static struct voc_cal           g_voc_cal[] =
{
    { 850, 1.182 * 1e-6},
    { 1650, 1.2203 * 1e-6},
    { 3250, 1.2449 * 1e-6},
    { 7837, 1.276 * 1e-6},
    { 15470, 1.2928 * 1e-6},
    { 30780, 1.2995 * 1e-6},
    { 78535, 1.2733 * 1e-6},
    { 155890, 1.283 * 1e-6},
    { 309170, 1.2938 * 1e-6},
    { 760200, 1.3154 * 1e-6},
    { 1499100, 1.3341 * 1e-6},
    { 2946300, 1.3576 * 1e-6},
    { 7280600, 1.3735 * 1e-6},
    { 14266140, 1.4019 * 1e-6},
    { 28639120, 1.3967 * 1e-6},
    { UINT32_MAX, 1.4675 * 1e-6},
};

/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

static float current_value(void)
{
    uint32_t                    sec_no;
    uint32_t                    value;

    value = g_current_raw_val;
    
    for (sec_no = 0; g_voc_cal[sec_no].section <= value; sec_no++);

    return (value * g_voc_cal[sec_no].coef);
}

static void rec_init(void)
{
    g_current_raw_val = 0u;
    ICxTRIS |= (0x1u << ICxPIN);
    ICxCON  = 0;
    FREQ_TMR_A_CON = 0;
    FREQ_TMR_B_CON = 0;
    Delay10us(10);
    FREQ_TMR_A_CON = TxCON_T32;
    FREQ_TMR_A     = 0;
    FREQ_TMR_A_PR  = UINT32_MAX;
    ICxCON  = ICxCON_FEDGE | ICxCON_C32 | ICxCON_ICI(ICxCON_EVERY_SECOND) |
              ICxCON_ICM(ICxCON_MODE_SIMPLE_FALLING);
    ICxIEC &= ~(0x1u << ICxISR_BIT);
    ICxIFS &= ~(0x1u << ICxISR_BIT);
    ICxIPC &= ~(0x1fu << ICxPRIO_BIT);
    ICxIPC |= (7u << (ICxPRIO_BIT + 2u));
    ICxIEC |= (0x1u << ICxISR_BIT);
    FREQ_TMR_A_CON |= TxCON_ON;
    ICxCON         |= ICxCON_ON;
}


static void meas_init(void)
{
    MEAS_TMR_A_CON  = 0;
    MEAS_TMR_B_CON  = 0;
    Delay10us(10);
    MEAS_TMR_A_CON  = TxCON_TCKPS(7) | TxCON_T32;
    MEAS_TMR_A      = 0;
    MEAS_TMR_A_PR   = GetPeripheralClock() / (256u * MEAS_PERIOD_HZ);
    MEAS_TMR_IPC   &= ~(0x1fu << MEAS_TMR_PRIO_BIT);
    MEAS_TMR_IPC   |=  (6u << (MEAS_TMR_PRIO_BIT + 2u));
    MEAS_TMR_IFS   &= ~(0x1u << MEAS_TMR_ISR_BIT);
}

static esError env_init(void)
{
    esError                     err;

    static const struct ina219_config ina219_config =
    {
        10.0,
        0.5,
        0.18
    };
    err = ina219_init_driver(&g_ina219, &g_i2c_bus, 0, &ina219_config);

    if (err) {
        return (err);
    }
    err = mlx_init_driver(&g_mlx90614, &g_i2c_bus, 0);

    if (err) {
        return (err);
    }
    err = voc_heater_init();

    return (err);
}

/*===================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*====================================  GLOBAL PUBLIC FUNCTION DEFINITIONS  ==*/

void __ISR(IC_VECTOR, IPL7SRS) change_notice_isr(void)
{
    static uint32_t     no;
    static uint64_t     acc;
    uint32_t            first;
    uint32_t            second;
    uint32_t            current;

    first = ICxBUF;
    second  = ICxBUF;

    if (second > first) {
        current = second - first;
    } else {
        current = UINT32_MAX - (first - second);
    }
    acc += (uint64_t)current;
    no++;

    if (no == CONFIG_NUM_OF_SAMPLES) {
        no  = 0;
        g_current_raw_val = (uint32_t)(acc / (uint64_t)CONFIG_NUM_OF_SAMPLES);
        acc = (uint64_t)0ul;
    }

    while (ICxCON & ICxCON_ICBNE) {
        volatile uint32_t dummy;

        dummy = ICxBUF;
    }
    ICxIFS &= ~(0x1u << ICxISR_BIT);
}

void __ISR(MEAS_TMR_VECTOR, IPL6SOFT) meas_tmr_isr(void)
{
    MEAS_TMR_IFS &= ~(0x1u << MEAS_TMR_ISR_BIT);

    float                       value;
    uint32_t                    current_no;

    value = current_value();
    current_no = g_buffer_current;
    current_no++;
    g_buffer[current_no].rcurr = value;
    g_buffer[current_no].rmin  = g_buffer[current_no - 1u].rmin;
    g_buffer[current_no].rmax  = g_buffer[current_no - 1u].rmax;
    g_buffer[current_no].voltage     = g_environment.voltage;
    g_buffer[current_no].temperature = g_environment.temperature;

    if (g_buffer[current_no].rmin > g_buffer[current_no].rcurr) {
        g_buffer[current_no].rmin = g_buffer[current_no].rcurr;
    }

    if (g_buffer[current_no].rmax < g_buffer[current_no].rcurr) {
        g_buffer[current_no].rmax = g_buffer[current_no].rcurr;
    }

    if (current_no == (CONFIG_BUFFER_SIZE - 1u)) {
        esEvent *               event;
        esError                 error;

        MEAS_TMR_IEC   &= ~(0x1u << MEAS_TMR_ISR_BIT);
        MEAS_TMR_A_CON &= ~TxCON_ON;

        ES_ENSURE(error = esEventCreateI(sizeof(esEvent), EVENT_VOC_REC_HAS_FINISHED, &event));

        if (!error) {
            esEpaSendEventI(g_gui, event);
        }
    }
    g_buffer_current = current_no;
}

esError voc_init(void)
{
    rec_init();
    meas_init();

    return (env_init());
}

esError voc_env_voltage_set(int voltage)
{
    esError                     err = ES_ERROR_NONE;

    err = voc_heater_set(voltage);

    return (err);
}

void voc_env_voltage_on(void)
{
    voc_heater_on();
}

void voc_env_voltage_off(void)
{
    voc_heater_off();
}

void voc_rec_start(int period)
{
    float                    value;

    value = current_value();
    g_buffer_current    = 0;
    g_buffer[0].rcurr   = value;
    g_buffer[0].rmin    = value;
    g_buffer[0].rmax    = value;
    g_buffer[0].voltage = g_environment.voltage;
    g_buffer[0].temperature = g_environment.temperature;
    
    if (period == PERIOD_20MS) {
        MEAS_TMR_A_PR   = GetPeripheralClock() / (256u * MEAS_PERIOD_HZ);
    } else {
        MEAS_TMR_A_PR   = GetPeripheralClock() / (256u * 1u);
    }
    MEAS_TMR_A_CON |= TxCON_ON;
    MEAS_TMR_IEC   |= (0x1u << MEAS_TMR_ISR_BIT);
}

void voc_rec_stop(void)
{
    MEAS_TMR_IEC   &= ~(0x1u << MEAS_TMR_ISR_BIT);
    MEAS_TMR_A_CON &= ~TxCON_ON;
}

uint32_t voc_rec_get_remaining_no(void)
{
    return ((CONFIG_BUFFER_SIZE - 1u) - g_buffer_current);
}

void voc_rec_get_current(struct voc_record * record)
{
    uint32_t                current;
    
    current = g_buffer_current;
    *record = g_buffer[current];
}

void voc_env_get_current(struct voc_environment * environment)
{
    *environment = g_environment;
}

void voc_env_update(void)
{
    ina219_get_current(&g_ina219, &g_environment.current);
    ina219_get_voltage(&g_ina219, &g_environment.voltage);
    mlx_read_temp(&g_mlx90614, &g_environment.temperature);
}

void voc_meas_get_current(struct voc_meas * meas)
{
    meas->rcurr = current_value();
}

uint32_t voc_rec_get_current_no(void)
{
    return (g_buffer_current);
}

void voc_rec_get_by_id(uint32_t rec_no, struct voc_record * record)
{
    *record = g_buffer[rec_no];
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of voc.c
 ******************************************************************************/
