
#include <xc.h>
#include "driver/ad5282.h"
#include "base/error.h"
#include "bsp.h"

#define AD5282_ID                       0x58
#define RETRY_COUNT                     5

/*
 * Disable port
 */
#if defined(AD_SHDN_PORT) && defined(AD_SHDN_PIN) && defined(AD_SHDN_TRIS)
#define AD5282_SHDN_TRIS                AD_SHDN_TRIS
#define AD5282_SHDN_PORT                AD_SHDN_PORT
#define AD5282_SHDN_PIN                 AD_SHDN_PIN
#endif

static struct i2c_slave_config g_ad5282_i2c_config =
{
    I2C_SLAVE_RD_START_STOP | I2C_SLAVE_RD_NACK | I2C_SLAVE_RD_REPEAT,
    AD5282_ID
};

static void shdn_init(void)
{
#if defined(AD5282_SHDN_PORT)
    AD5282_SHDN_PORT &= ~(0x1u << AD5282_SHDN_PIN);
    AD5282_SHDN_TRIS &= ~(0x1u << AD5282_SHDN_PIN);
#endif
}

static void shdn_term(void)
{
#if defined(AD5282_SHDN_PORT)
    AD5282_SHDN_PORT |= (0x1u << AD5282_SHDN_PIN);
    AD5282_SHDN_TRIS |= (0x1u << AD5282_SHDN_PIN);
#endif
}

static void shdn_shutdown(void)
{
#if defined(AD5282_SHDN_PORT)
    AD5282_SHDN_PORT &= ~(0x1u << AD5282_SHDN_PIN);
#endif
}

static void shdn_operate(void)
{
#if defined(AD5282_SHDN_PORT)
    AD5282_SHDN_PORT |= (0x1u << AD5282_SHDN_PIN);
#endif
}

esError ad5282_init_driver(struct ad5282_handle * handle, struct i2c_bus * bus, uint8_t id)
{
    i2c_slave_open(&handle->comm, &g_ad5282_i2c_config, bus, id);
    shdn_init();

    return (ES_ERROR_NONE);
}

esError ad5282_term_driver(struct ad5282_handle * handle)
{
    shdn_term();
    i2c_slave_close(&handle->comm);

    return (ES_ERROR_NONE);
}

esError ad5282_set_pot1(struct ad5282_handle * handle, uint8_t val)
{
    bool                is_successful;
    uint32_t            retry;

    is_successful = false;
    retry         = RETRY_COUNT;

    while (!is_successful && retry--) {
        is_successful = i2c_slave_write(&handle->comm, 0, &val, 1);
    }

    if (!is_successful) {
        return (ES_ERROR_DEVICE_FAIL);
    } else {
        return (ES_ERROR_NONE);
    }
}

esError ad5282_set_pot2(struct ad5282_handle * handle, uint8_t val)
{
    if (i2c_slave_write(&handle->comm, (0x1u << 7), &val, 1) == false) {
        return (ES_ERROR_DEVICE_FAIL);
    } 
    return (ES_ERROR_NONE);
}

esError ad5282_operate(struct ad5282_handle * handle)
{
    (void)handle;
    shdn_operate();

    return (ES_ERROR_NONE);
}

esError ad5282_shutdown(struct ad5282_handle * handle)
{
    (void)handle;
    shdn_shutdown();

    return (ES_ERROR_NONE);
}

