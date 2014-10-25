/* 
 * File:   i2c.h
 * Author: nenad
 *
 * Created on May 3, 2014, 6:35 PM
 */

#ifndef I2C_H
#define	I2C_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#include "driver/lld_i2c1.h"

#ifdef	__cplusplus
extern "C" {
#endif

enum i2c_config_flags {
    I2C_ADDRESS_10BIT               = (0x1 << 10),
    I2C_ADDRESS_7BIT                = (0x0 << 10)
};

struct i2c_id;

struct i2c_config {
    const struct i2c_id *   id;
    uint32_t                flags;
    uint32_t                speed;
    uint32_t                isrPrio;
};

struct i2c_bus {
    const struct i2c_id *   id;
    uint32_t                flags;
};

struct i2c_id {
    void             (* open)(const struct i2c_config *, struct i2c_bus *);
    void             (* close)(struct i2c_bus *);
    bool             (* write)(struct i2c_bus *, uint8_t);
    uint8_t          (* read)(struct i2c_bus *);
    void             (* start)(struct i2c_bus *);
    void             (* restart)(struct i2c_bus *);
    void             (* stop)(struct i2c_bus *);
    void             (* ack)(struct i2c_bus *);
    void             (* nack)(struct i2c_bus *);
};

void i2c_driver_init(void);

void i2c_bus_open(
    struct i2c_bus *            bus,
    const struct i2c_config *   config);

void i2c_close(
    struct i2c_bus *            bus);

void i2c_bus_ack(
    struct i2c_bus *            bus);

void i2c_bus_nack(
    struct i2c_bus *            bus);

bool i2cWriteArray(
    struct i2c_bus *            bus,
    const uint8_t *             data,
    size_t                      size);

bool i2cWrite(
    struct i2c_bus *            bus,
    uint8_t                     data);

void i2cReadArray(
    struct i2c_bus *            bus,
    uint8_t *                   data,
    size_t                      size);

uint8_t i2cRead(
    struct i2c_bus *          bus);

void i2cStart(
    struct i2c_bus *          bus);

void i2cRestart(
    struct i2c_bus *          bus);

void i2cStop(
    struct i2c_bus *          bus);

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

