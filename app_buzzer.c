
#include "app_buzzer.h"
#include "bsp.h"
#include "timer/timer.h"


static void buzzer_off(void * arg)
{
    (void)arg;

    BUZZER_LAT  &= ~(0x1u << BUZZER_PIN);
}

void buzzer_init(void)
{
    BUZZER_LAT  &= ~(0x1u << BUZZER_PIN);
    BUZZER_TRIS &= ~(0x1u << BUZZER_PIN);
}


void buzzer_beep(uint32_t duration_ms)
{
    static struct ntimer        timeout;

    ntimer_init(&timeout);
    esVTimerStart(&timeout, ES_VTMR_TIME_TO_TICK_MS(duration_ms), buzzer_off, NULL);

    BUZZER_LAT |= (0x1u << BUZZER_PIN);
}