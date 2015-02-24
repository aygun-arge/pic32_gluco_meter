
#include "driver/ad5282.h"
#include "base/error.h"

#define AD5282_ID                       0x58

/*
 * Disable port
 */
#if 0
#define AD5282_SHDN_TRIS                TRISD
#define AD5282_SHDN_PORT                PORTD
#define AD5282_SHDN_PIN                 1
#endif

static struct i2c_slave_config g_ad5282_i2c_config =
{
    I2C_SLAVE_RD_START_STOP | I2C_SLAVE_RD_NACK | I2C_SLAVE_RD_REPEAT,
    AD5282_ID
};

esError ad5282_init_driver(struct ad5282_handle * handle, struct i2c_bus * bus, uint8_t id)
{
    i2c_slave_open(&handle->comm, &g_ad5282_i2c_config, bus, id);

#if defined(AD5282_SHDN_PORT)
    AD5282_SHDN_PORT |= (0x1u << AD5282_SHDN_PIN);
    AD5282_SHDN_TRIS |= (0x1u << AD5282_SHDN_PIN);
#endif
    return (ES_ERROR_NONE);
}

esError ad5282_term_driver(struct ad5282_handle * handle)
{
    i2c_slave_close(&handle->comm);

    return (ES_ERROR_NONE);
}

esError ad5282_set_pot1(struct ad5282_handle * handle, uint8_t val)
{
    if (i2c_slave_write(&handle->comm, 0, &val, 1) == false) {
        return (ES_ERROR_DEVICE_FAIL);
    } 
    return (ES_ERROR_NONE);
}

esError ad5282_set_pot2(struct ad5282_handle * handle, uint8_t val)
{
    if (i2c_slave_write(&handle->comm, (0x1u << 7), &val, 1) == false) {
        return (ES_ERROR_DEVICE_FAIL);
    } 
    return (ES_ERROR_NONE);
}
