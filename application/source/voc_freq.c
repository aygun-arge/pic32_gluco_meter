
#include <xc.h>
#include <stdint.h>


#include "TimeDelay.h"
#include <stdbool.h>
#include <peripheral/timer.h>
#include "arch/intr.h"

#define CONFIG_IC_SELECTION             4
#define CONFIG_NUM_OF_SAMPLES           8

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
#define T1CON_TWDIS                     (0x1u << 12)
#define T1CON_TWIP                      (0x1u << 11)
#define TxCON_TGATE                     (0x1u << 7)
#define T1CON_TCKPS_Pos                 (4)
#define T1CON_TCKPS_Msk                 (0x3u << T1CON_TCKPS_Pos)
#define T1CON_TCKPS(x)                  (((x) << T1CON_TCKPS_Pos) & T1CON_TCKPS_Msk)
#define TxCON_TCKPS_Pos                 (4)
#define TxCON_TCKPS_Msk                 (0x7u << TxCON_TCKPS_Pos)
#define TxCON_TCKPS(x)                  (((x) << TxCON_TCKPS_Pos) & TxCON_TCKPS_Msk)
#define TxCON_T32                       (0x1u << 3)
#define T1CON_TSYNC                     (0x1u << 2)
#define TxCON_TCS                       (0x1u << 1)

static uint32_t g_current_val;
static bool     g_is_sampling;

void __ISR(IC_VECTOR) change_notice_isr(void)
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
        g_current_val = (uint32_t)(acc / (uint64_t)CONFIG_NUM_OF_SAMPLES);
        g_is_sampling = false;
        acc = (uint64_t)0ul;
    }

    while (ICxCON & ICxCON_ICBNE) {
        volatile uint32_t dummy;

        dummy = ICxBUF;
    }
    ICxIFS &= ~(0x1u << ICxISR_BIT);
}

void voc_freq_init(void)
{
    g_is_sampling = true;
    g_current_val = 0u;
    ICxTRIS |= (0x1u << ICxPIN);
    ICxCON  = 0;
    T2CON   = 0;
    T3CON   = 0;
    Delay10us(10);
    T2CON   = TxCON_T32;
    TMR2    = 0;
    PR2     = UINT32_MAX;
    ICxCON  = ICxCON_FEDGE | ICxCON_C32 | ICxCON_ICI(ICxCON_EVERY_SECOND) |
              ICxCON_ICM(ICxCON_MODE_SIMPLE_FALLING);
    ICxIEC &= ~(0x1u << ICxISR_BIT);
    ICxIFS &= ~(0x1u << ICxISR_BIT);
    ICxIPC &= ~(0x1fu << ICxPRIO_BIT);
    ICxIPC |= (CONFIG_INTR_MAX_ISR_PRIO << (ICxPRIO_BIT + 2u));
    ICxIEC |= (0x1u << ICxISR_BIT);
    T2CON  |= TxCON_ON;
    T2CON  |= TxCON_ON;
    ICxCON |= ICxCON_ON;
}

bool voc_is_sampling(void)
{
    return (g_is_sampling);
}

uint32_t voc_freq_raw(void)
{
    g_is_sampling = true;
    return (g_current_val);
}
