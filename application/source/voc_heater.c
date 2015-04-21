
#include <xc.h>
#include "voc_heater.h"
#include "bsp.h"
#include "main.h"
#include "driver/ad5282.h"
#include "TimeDelay.h"

#define CONFIG_VOC_VOLTAGE_COEF_1000    255

static struct ad5282_handle     g_ad5282;

esError voc_heater_init(void)
{
    esError                     err;

    LMR_SHDN_PORT &= ~(0x1u << LMR_SHDN_PIN);
    LMR_SHDN_TRIS |=  (0x1u << LMR_SHDN_PIN);
    LMR_SHDN_OD   |=  (0x1u << LMR_SHDN_PIN);

    LT_OUT_OFF_PORT |=   (0x1u << LT_OUT_OFF_PIN);
    LT_OUT_OFF_TRIS &=  ~(0x1u << LT_OUT_OFF_PIN);

    err = ad5282_init_driver(&g_ad5282, &g_i2c_bus, 0);

    if (err) {
        return (err);
    }
    err = ad5282_set_pot1(&g_ad5282, 0);

    if (err) {
        return (err);
    }
    err = ad5282_set_pot2(&g_ad5282, 0);

    return (err);
}

void voc_heater_on(void)
{
    LMR_SHDN_PORT   |=  (0x1u << LMR_SHDN_PIN);
    Delay10us(100);
    LT_OUT_OFF_PORT &= ~(0x1u << LT_OUT_OFF_PIN);
    Delay10us(100);
    ad5282_operate(&g_ad5282);
}

void voc_heater_off(void)
{
    ad5282_shutdown(&g_ad5282);
    LT_OUT_OFF_PORT |=  (0x1u << LT_OUT_OFF_PIN);
    LMR_SHDN_PORT   &= ~(0x1u << LMR_SHDN_PIN);
}

esError voc_heater_set(int voltage)
{
    esError                     err;

    if (voltage > 70) {
        voltage = 70;
    }
    voltage *= CONFIG_VOC_VOLTAGE_COEF_1000;
    voltage /= 100u;
    err = ad5282_set_pot1(&g_ad5282, voltage);

    return (err);
}
