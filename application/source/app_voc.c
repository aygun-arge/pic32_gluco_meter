/*=========================================================  INCLUDE FILES  ==*/

#include <xc.h>
#include <stdbool.h>

#include "HardwareProfile.h"
#include "TimeDelay.h"

#include "arch/intr.h"
#include "driver/mlx90614.h"
#include "driver/ad5272.h"
#include "driver/ina219.h"
#include "driver/rtc.h"
#include "base/bitop.h"
#include "main.h"
#include "voc.h"
#include "voc_heater.h"
#include "eds/epa.h"
#include "base/error.h"
#include "base/debug.h"
#include "sm_gui.h"
#include "driver/gpio.h"

/*=========================================================  LOCAL MACRO's  ==*/

#define CONFIG_IC_SELECTION             4
#define CONFIG_NUM_OF_SAMPLES           8
#define CONFIG_VOC_VOLTAGE_COEF_1000    255

#define RANGE_
#define RANGE_GPIO                      &GpioB
#define RANGE_PIN                       0

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

#define MEAS_100MS_PERIOD_HZ            10

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

struct voc_profile
{
    const struct voc_cal *      cal;
    uint32_t                    gpio_val;
    float                       min;
    float                       max;
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
static struct voc_buffer        g_record;
static struct voc_environment   g_environment;
static uint32_t                 g_profile_no;


#if 0
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
#elif 0
static struct voc_cal           g_voc_cal[] =
{
    { 791,      1.262 * 1e-6},
    { 1527,     1.309 * 1e-6},
    { 2259,     1.328 * 1e-6},
    { 2991,     1.337 * 1e-6},
    { 3772,     1.325 * 1e-6},
    { 4440,     1.351 * 1e-6},
    { 5170,     1.354 * 1e-6},
    { 5889,     1.358 * 1e-6},
    { 7271,     1.375 * 1e-6},
    { 14355,    1.393 * 1e-6},
    { 21418,    1.400 * 1e-6},
    { 28490,    1.404 * 1e-6},
    { 35664,    1.402 * 1e-6},
    { 42870,    1.399 * 1e-6},
    { 72700,    1.376 * 1e-6},
    { 144980,   1.379 * 1e-6},
    { 214480,   1.398 * 1e-6},
    { 284500,   1.406 * 1e-6},
    { 694750,   1.439 * 1e-6},
    { 1372400,  1.457 * 1e-6},
    { 2042400,  1.468 * 1e-6},
    { 2681200,  1.491 * 1e-6},
    { 6579047,  1.520 * 1e-6},
    { 12887659, 1.551 * 1e-6},
    { 19123582, 1.568 * 1e-6},
    { 25316070, 1.580 * 1e-6},
    { 31414582, 1.592 * 1e-6},
    { 37712854, 1.591 * 1e-6},
    { UINT32_MAX, 1.0},
};
#elif 0
static struct voc_cal           g_voc_cal[] =
{
    {211,       4.739 * 1e-6},
    {390,       5.128 * 1e-6},
    {564,       5.319 * 1e-6},
    {736,       5.434 * 1e-6},
    {910,       5.494 * 1e-6},
    {1078,      5.565 * 1e-6},
    {1247,      5.613 * 1e-6},
    {1419,      5.637 * 1e-6},
    {1740,      5.747 * 1e-6},
    {3393,      5.894 * 1e-6},
    {5006,      5.992 * 1e-6},
    {6636,      6.027 * 1e-6},
    {8261,      6.052 * 1e-6},
    {9916,      6.051 * 1e-6},
    {16776,     6.031 * 1e-6},
    {33200,     6.024 * 1e-6},
    {49480,     6.063 * 1e-6},
    {65526,     6.104 * 1e-6},
    {161801,    6.180 * 1e-6},
    {317850,    6.292 * 1e-6},
    {623874,    6.411 * 1e-6},
    {1555300,   6.429 * 1e-6},
    {3036552,   6.586 * 1e-6},
    {5950717,   6.721 * 1e-6},
    {11652205,  6.866 * 1e-6},
    {14424537,  6.933 * 1e-6},
    { UINT32_MAX, 1.0},
};
#else
static const struct voc_cal     g_higher_voc_cal[] =
{
    {452,       22.124 * 1e-6},
    {851,       23.502 * 1e-6},
    {1248,      24.038 * 1e-6},
    {1640,      24.390 * 1e-6},
    {2032,      24.606 * 1e-6},
    {2429,      24.702 * 1e-6},
    {4077,      24.528 * 1e-6},
    {8022,      24.931 * 1e-6},
    {11940,      25.126 * 1e-6},
    {15833,      25.264 * 1e-6},
    {39124,     25.560 * 1e-6},
    {77485,     25.811 * 1e-6},
    {115217,     26.038 * 1e-6},
    {152586,     26.215 * 1e-6},
    {389304,     25.687 * 1e-6},
    {744216,     26.874 * 1e-6},
    {1140944,    26.294 * 1e-6},
    {1598634,    25.021 * 1e-6},
    {1841559,    27.151 * 1e-6},
    {2201105,    27.259 * 1e-6},
    {2560431,   27.339 * 1e-6},
    {2920170,   27.396 * 1e-6},
    {3200084,   28.124 * 1e-6},
    {3558630,   28.101 * 1e-6},
    { UINT32_MAX, 28.12},
};

static const struct voc_cal     g_lower_voc_cal[] =
{
    {450,       2.2222 * 1e-6},
    {852,       2.3474 * 1e-6},
    {1250,      2.4000 * 1e-6},
    {1645,      2.4316 * 1e-6},
    {2042,      2.4486 * 1e-6},
    {2432,      2.4671 * 1e-6},
    {2820,      2.4823 * 1e-6},
    {3215,      2.4883 * 1e-6},
    {3953,      2.5297 * 1e-6},
    {7739,      2.5843 * 1e-6},
    {11576,     2.5916 * 1e-6},
    {15373,     2.6020 * 1e-6},
    {19197,     2.6046 * 1e-6},
    {23095,     2.5980 * 1e-6},
    {38850,     2.5740 * 1e-6},
    {77014,     2.5969 * 1e-6},
    {114609,    2.6176 * 1e-6},
    {151934,    2.6327 * 1e-6},
    {373179,    2.6797 * 1e-6},
    {734646,    2.7224 * 1e-6},
    {1089716,   2.7530 * 1e-6},
    {1441645,   2.7746 * 1e-6},
    {3511356,   2.8479 * 1e-6},
    { UINT32_MAX, 2.85},
};
#endif



static struct voc_profile       g_profile[2] =
{
    [1] = {
        .cal = &g_lower_voc_cal[0],
        .gpio_val = 1,
        .min = 0.001,
        .max = 10.0,
    },
    [0] = {
        .cal = &g_higher_voc_cal[0],
        .gpio_val = 0,
        .min = 0.01,
        .max = 100.0,
    }
};

/*======================================================  GLOBAL VARIABLES  ==*/
/*============================================  LOCAL FUNCTION DEFINITIONS  ==*/

#define g_voc_cal g_profile[g_profile_no].cal
#define g_voc_max g_profile[g_profile_no].max
#define g_voc_min g_profile[g_profile_no].min

static float current_value(void)
{
    uint32_t                    sec_no;
    uint32_t                    value;
    float                       retval;

    value = g_current_raw_val;

    if (value == 0) {
        return (-1.0);
    }
#if !defined(ENABLE_VOC_CALIBRATION)
    for (sec_no = 0; g_voc_cal[sec_no].section <= value; sec_no++);

    retval = (float)value * g_voc_cal[sec_no].coef;

    if (retval > g_voc_max) {
        retval = g_voc_max;
    }

    if (retval < g_voc_min) {
        retval = g_voc_min;
    }
#else
    (void)g_voc_cal;
    (void)sec_no;
    
    retval = value;
#endif

    return (retval);
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
    err  = ina219_init_driver(&g_ina219, &g_i2c_bus, 0, &ina219_config);
    err |= mlx_init_driver(&g_mlx90614, &g_i2c_bus, 0);
    err |= voc_heater_init();

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
        (void)dummy;
    }
    ICxIFS &= ~(0x1u << ICxISR_BIT);
}

void __ISR(MEAS_TMR_VECTOR, IPL6SOFT) meas_tmr_isr(void)
{
    MEAS_TMR_IFS &= ~(0x1u << MEAS_TMR_ISR_BIT);

    float                       value;
    uint32_t                    current_no;

    value       = current_value();
    current_no  = g_record.current;
    current_no++;
    g_record.data[current_no].rcurr = value;
    g_record.data[current_no].rmin  = g_record.data[current_no - 1u].rmin;
    g_record.data[current_no].rmax  = g_record.data[current_no - 1u].rmax;
    g_record.data[current_no].voltage     = g_environment.voltage;
    g_record.data[current_no].current     = g_environment.current;
    g_record.data[current_no].temperature = g_environment.temperature;

    if (g_record.data[current_no].rmin > g_record.data[current_no].rcurr) {
        g_record.data[current_no].rmin = g_record.data[current_no].rcurr;
    }

    if (g_record.data[current_no].rmax < g_record.data[current_no].rcurr) {
        g_record.data[current_no].rmax = g_record.data[current_no].rcurr;
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
    g_record.current = current_no;
}

esError voc_init(void)
{
    gpioSetAsOutput(RANGE_GPIO, RANGE_PIN);
    rec_init();
    meas_init();

    return (env_init());
}


#define IREF 50E-6
#define RMAX 200000.0
#define VIZ_OFFSET (-0.052)
#define VIZ_MULTI 0.9434

esError voc_env_voltage_set(int voltage)
{
    double                      viz;
    double                      rpot;
    int                         raw_value;
    esError                     err;

    if (voltage > 65) {
        voltage = 65;
    }

    if (voltage < 0) {
        voltage = 0;
    }
    viz  = (float)voltage / 10.0;
    viz += VIZ_OFFSET;
    viz *= VIZ_MULTI;
    rpot = viz / IREF;

    if (rpot > 200000.0) {
        rpot = 200000.0;
    }

    if (rpot < 1.0) {
        rpot = 1.0;
    }
    raw_value = (int)((rpot / RMAX) * 255.0);

    if (raw_value > 255) {
        raw_value = 255;
    }
    err = voc_heater_set(raw_value);

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
    g_record.current    = 0;
    g_record.data[0].rcurr   = value;
    g_record.data[0].rmin    = value;
    g_record.data[0].rmax    = value;
    g_record.data[0].voltage = g_environment.voltage;
    g_record.data[0].current = g_environment.current;
    g_record.data[0].temperature = g_environment.temperature;
    g_record.period = period;
    rtc_get_time_i(&g_record.time);

    meas_init();
    
    if (period == PERIOD_20MS) {
        MEAS_TMR_A_PR   = GetPeripheralClock() / (256u * MEAS_PERIOD_HZ);
    } else if (period == PERIOD_100MS) {
        MEAS_TMR_A_PR   = GetPeripheralClock() / (256u * MEAS_100MS_PERIOD_HZ);
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
    return ((CONFIG_BUFFER_SIZE - 1u) - g_record.current);
}

void voc_rec_get_current(struct voc_record * record)
{
    uint32_t                current;
    
    current = g_record.current;
    *record = g_record.data[current];
}

void voc_env_get_current(struct voc_environment * environment)
{
    *environment = g_environment;
}

void voc_env_update(void)
{
    ina219_get_current(&g_ina219, &g_environment.current);

    if (g_environment.current > 0.9) {
        g_environment.current = 0.0;
    }
    ina219_get_voltage(&g_ina219, &g_environment.voltage);
    mlx_read_temp(&g_mlx90614, &g_environment.temperature);
}

void voc_meas_get_current(struct voc_meas * meas)
{
    meas->rcurr = current_value();
}

uint32_t voc_meas_get_current_raw(void)
{
    return (g_current_raw_val);
}

uint32_t voc_rec_get_current_no(void)
{
    return (g_record.current);
}

void voc_rec_get_by_id(uint32_t rec_no, struct voc_record * record)
{
    *record = g_record.data[rec_no];
}

int voc_reg_get_period(void)
{
    return (g_record.period);
}

struct voc_buffer * voc_rec_get_buffer(void)
{
    return (&g_record);
}

void voc_rec_get_time(struct rtc_time * time)
{
    *time = g_record.time;
}

void voc_set_profile(unsigned int profile_no)
{
    unsigned int                max_profile;

    max_profile = ES_ARRAY_DIMENSION(g_profile);

    if (profile_no >= max_profile) {
        return;
    }
    
    if (g_profile[profile_no].gpio_val) {
        gpioSetPin(RANGE_GPIO, RANGE_PIN);
    } else {
        gpioClrPin(RANGE_GPIO, RANGE_PIN);
    }
    g_profile_no = profile_no;
}

unsigned int voc_get_profile(void)
{
    return (g_profile_no);
}

/*================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/
/** @endcond *//** @} *//******************************************************
 * END of voc.c
 ******************************************************************************/
