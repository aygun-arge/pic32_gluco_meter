/* 
 * File:   ad5282.h
 * Author: nenad
 *
 * Created on October 27, 2014, 4:08 AM
 */

#ifndef AD5282_H
#define	AD5282_H

#include "base/error.h"
#include "driver/i2c.h"

#ifdef	__cplusplus
extern "C" {
#endif

struct ad5282_handle
{
    struct i2c_slave            comm;
};

esError ad5282_init_driver(struct ad5282_handle * handle, struct i2c_bus * bus, uint8_t id);
esError ad5282_term_driver(struct ad5282_handle * handle);
esError ad5282_set_pot1(struct ad5282_handle * handle, uint8_t val);
esError ad5282_set_pot2(struct ad5282_handle * handle, uint8_t val);
esError ad5282_operate(struct ad5282_handle * handle);
esError ad5282_shutdown(struct ad5282_handle * handle);

#ifdef	__cplusplus
}
#endif

#endif	/* AD5282_H */

