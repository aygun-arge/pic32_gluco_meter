
#include "app_buzzer.h"
#include "bsp.h"
#include "vtimer/vtimer.h"


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
    static esVTimer         timeout;

    esVTimerInit(&timeout);
    esVTimerStart(&timeout, ES_VTMR_TIME_TO_TICK_MS(duration_ms), buzzer_off, NULL);

    BUZZER_LAT |= (0x1u << BUZZER_PIN);
}