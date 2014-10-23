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

enum i2cConfigFlags {
    I2C_ADDRESS_10BIT               = (0x1 << 10),
    I2C_ADDRESS_7BIT                = (0x0 << 10)
};

struct i2cId;

struct i2cConfig {
    const struct i2cId * id;
    uint32_t            flags;
    uint32_t            speed;
    uint32_t            isrPrio;
};

struct i2c_bus {
    const struct i2cId *    id;
    uint32_t                flags;
};

struct i2cId {
    void             (* open)(const struct i2cConfig *, struct i2c_bus *);
    void             (* close)(struct i2c_bus *);
    bool             (* write)(struct i2c_bus *, uint8_t);
    uint8_t          (* read)(struct i2c_bus *);
    void             (* start)(struct i2c_bus *);
    void             (* restart)(struct i2c_bus *);
    void             (* stop)(struct i2c_bus *);
    void             (* ack)(struct i2c_bus *);
    void             (* nack)(struct i2c_bus *);
};

void initI2cDriver(void);

void i2cOpen(
    struct i2c_bus *          handle,
    const struct i2cConfig *    config);

void i2cClose(
    struct i2c_bus *          handle);

void i2cAck(
    struct i2c_bus *          handle);

void i2cNack(
    struct i2c_bus *          handle);

bool i2cWriteArray(
    struct i2c_bus *          handle,
    const uint8_t *             data,
    size_t                      size);

bool i2cWrite(
    struct i2c_bus *          handle,
    uint8_t                     data);

void i2cReadArray(
    struct i2c_bus *          handle,
    uint8_t *                   data,
    size_t                      size);

uint8_t i2cRead(
    struct i2c_bus *          handle);

void i2cStart(
    struct i2c_bus *          handle);

void i2cRestart(
    struct i2c_bus *          handle);

void i2cStop(
    struct i2c_bus *          handle);

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

