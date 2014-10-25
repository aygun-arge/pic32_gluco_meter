
#include "driver/i2c.h"

void i2c_driver_init(void) {
    
}

void i2c_bus_open(
    struct i2c_bus *          handle,
    const struct i2c_config *    config) {

    handle->id    = config->id;
    handle->flags = config->flags;
    handle->id->open(config, handle);
}

void i2c_close(
    struct i2c_bus *  handle) {

    handle->id->close(handle);
}

void i2c_bus_ack(
    struct i2c_bus *          handle) {

    handle->id->ack(handle);
}

void i2c_bus_nack(
    struct i2c_bus *          handle) {

    handle->id->nack(handle);
}

bool i2cWriteArray(
    struct i2c_bus *          handle,
    const uint8_t *             data,
    size_t                      size) {

    while (size != 0) {

        if (handle->id->write(handle, *data) != true) {

            return (false);
        }
        data++;
        size--;
    }

    return (true);
}

bool i2cWrite(
    struct i2c_bus *          handle,
    uint8_t                     data) {

    return (handle->id->write(handle, data));
}

void i2cReadArray(
    struct i2c_bus *          handle,
    uint8_t *                   data,
    size_t                      size) {

    while (size != 0) {

        *data = handle->id->read(handle);
        handle->id->ack(handle);
        data++;
        size--;
    }
}

uint8_t i2cRead(
    struct i2c_bus *          handle) {

    return (handle->id->read(handle));
}

void i2cStart(
    struct i2c_bus *          handle) {

    handle->id->start(handle);
}

void i2cRestart(
    struct i2c_bus *          handle) {

    handle->id->restart(handle);
}

void i2cStop(
    struct i2c_bus *          handle) {

    handle->id->stop(handle);
}