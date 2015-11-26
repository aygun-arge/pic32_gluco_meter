
#include <xc.h>
#include "voc_heater.h"
#include "bsp.h"
#include "main.h"
#include "driver/ad5272.h"
#include "TimeDelay.h"

#define CONFIG_VOC_VOLTAGE_COEF_1000    275

static struct ad5272_handle     g_ad5282;

esError voc_heater_init(void)
{
    esError                     err;

    LMR_SHDN_PORT &= ~(0x1u << LMR_SHDN_PIN);
    LMR_SHDN_OD   |=  (0x1u << LMR_SHDN_PIN);
    LMR_SHDN_TRIS &= ~(0x1u << LMR_SHDN_PIN); /* Turn off at start-up */

    LT_OUT_OFF_PORT |=   (0x1u << LT_OUT_OFF_PIN);
    LT_OUT_OFF_TRIS &=  ~(0x1u << LT_OUT_OFF_PIN);

    err = ad5272_init_driver(&g_ad5282, &g_i2c_bus, 0);

    return (err);
}

void voc_heater_on(void)
{
    ad5272_operate(&g_ad5282);
    Delay10us(100);
    LMR_SHDN_PORT |= (0x1u << LMR_SHDN_PIN);
    Delay10us(100);
    LT_OUT_OFF_PORT &= ~(0x1u << LT_OUT_OFF_PIN);
    Delay10us(100);
}



void voc_heater_off(void)
{
    LT_OUT_OFF_PORT |=  (0x1u << LT_OUT_OFF_PIN);
    Delay10us(100);
    LMR_SHDN_PORT &= ~(0x1u << LMR_SHDN_PIN);
    Delay10us(100);
    ad5272_shutdown(&g_ad5282);
    Delay10us(100);
}



esError voc_heater_set(int voltage)
{
    static int                  old_voltage = 0u;
    int                         curr_voltage;
    esError                     err = ES_ERROR_NONE;

    if (old_voltage < voltage) {
        for (curr_voltage = old_voltage; curr_voltage < voltage; curr_voltage++) {
            err = ad5272_set_pot1(&g_ad5282, curr_voltage);

            if (err) {
                break;
            }
            Delay10us(400);
        }
    } else {
        for (curr_voltage = old_voltage; curr_voltage > voltage; curr_voltage--) {
            err = ad5272_set_pot1(&g_ad5282, curr_voltage);

            if (err) {
                break;
            }
            Delay10us(400);
        }
    }
    old_voltage = voltage;
    
    return (err);
}

