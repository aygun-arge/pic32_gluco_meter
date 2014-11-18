
#include <xc.h>
#include <stdint.h>


#include "TimeDelay.h"
#include <stdbool.h>
#include <peripheral/timer.h>
#include "arch/intr.h"

#define CONFIG_IC_SELECTION             1
#define CONFIG_NUM_OF_SAMPLES           16

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
#define ICxCON_ICM(x)                   (((x) << ICxCON_ICM_Pos) & ICxCON_ICM_Pos)

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


static uint32_t g_current_val;

void __ISR(IC_VECTOR) change_notice_isr(void)
{
    uint32_t            first_val;
    uint32_t

    ICxIFS &= (0x1u << ICxISR_BIT);
}

void voc_freq_init(void)
{
    ICxCON  = 0;
    Delay10us(10);
    ICxCON  = ICxCON_FEDGE | ICxCON_C32 | ICxCON_ICI(ICxCON_EVERY_SECOND) |
              ICxCON_ICM(ICxCON_MODE_SIMPLE_FALLING);
    ICxIEC &= (0x1u << ICxISR_BIT);
    ICxIFS &= (0x1u << ICxISR_BIT);
    ICxIPC &= (0x1fu << ICxPRIO_BIT);
    ICxIPC |= (CONFIG_INTR_MAX_ISR_PRIO << (ICxPRIO_BIT + 2u));
    ICxIEC |= (0x1u << ICxISR_BIT);
    ICxCON |= ICxCON_ON;
}

uint32_t voc_freq_raw(void)
{
    return (g_current_val);
}
