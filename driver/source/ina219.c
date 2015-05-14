
#include "driver/ina219.h"
#include "driver/i2c.h"

#define INA219_CONFIGURATION            0x00u
#define INA219_SHUNT                    0x01u
#define INA219_BUS                      0x02u
#define INA219_POWER                    0x03u
#define INA219_CURRENT                  0x04u
#define INA219_CALIBRATION              0x05u

#define INA219_ID                       0x80u

static const struct i2c_slave_config g_ina219_i2c_config =
{
    I2C_SLAVE_RD_START_STOP | I2C_SLAVE_RD_NACK,
    INA219_ID
};

esError ina219_init_driver(
    struct ina219_handle * handle,
    struct i2c_bus *    bus,
    uint8_t             id,
    const struct ina219_config * config)
{
    float                       max_possible_i;
    uint16_t                    cal;
    uint8_t                     buff[2];

    i2c_slave_open(&handle->comm, &g_ina219_i2c_config, bus, id);
    max_possible_i = 0.32 / config->shunt_res;
    handle->current_lsb = config->shunt_current / 32768;
    cal = 0.04096 / (handle->current_lsb * config->shunt_res);
    buff[0] = cal >> 8u;
    buff[1] = cal & 0xffu;

    if (!i2c_slave_write(&handle->comm, INA219_CALIBRATION, buff, sizeof(buff))) {
        return (ES_ERROR_DEVICE_FAIL);
    }
    return (ES_ERROR_NONE);
}

void ina219_term_driver(struct ina219_handle * handle)
{
    i2c_slave_close(&handle->comm);
}

esError ina219_get_current(struct ina219_handle * handle, float * value)
{
    uint8_t             buff[2];
    uint16_t            raw_value;
    
    if (i2c_slave_read(&handle->comm, INA219_CURRENT, buff, sizeof(buff)) == true) {
        raw_value = ((uint16_t)buff[0] << 8u) | (uint16_t)buff[1];
        *value = (float)raw_value * handle->current_lsb;

        return (ES_ERROR_NONE);
    } else {
        *value = 0.0;

        return (ES_ERROR_DEVICE_FAIL);
    }
}

esError ina219_get_voltage(struct ina219_handle * handle, float * value)
{
    uint8_t             buff[2];
    uint16_t            raw_value;

    if (i2c_slave_read(&handle->comm, INA219_BUS, buff, sizeof(buff)) == true) {
        float   uncalib;

        raw_value = ((uint16_t)buff[0] << 8u) | (uint16_t)buff[1];
        raw_value >>= 3;
        
        uncalib = (float)raw_value * 0.004;

#if 0
        if (uncalib < 1.0) {
            *value = uncalib * 1.35;
        } else if (uncalib < 2.0) {
            *value = uncalib * 1.76;
        } else if (uncalib < 3.0) {
            *value = uncalib * 1.72;
        } else if (uncalib < 4.0) {
            *value = uncalib * 1.34;
        } else if (uncalib < 5.0) {
            *value = uncalib * 1.26;
        } else if (uncalib < 6.0) {
            *value = uncalib * 1.20;
        } else {
            *value = uncalib * 1.20;
        }
#endif
        *value = uncalib;
        
        return (ES_ERROR_NONE);
    } else {
        *value = 0.0;

        return (ES_ERROR_DEVICE_FAIL);
    }
}
