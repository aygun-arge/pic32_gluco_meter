/* 
 * File:   ad5272.h
 * Author: nenad
 *
 * Created on June 29, 2014, 5:08 PM
 */

#ifndef AD5272_H
#define	AD5272_H

#include "base/error.h"
#include "driver/i2c.h"

#ifdef	__cplusplus
extern "C" {
#endif

struct ad5272_handle
{
    struct i2c_slave            comm;
};

esError ad5272_init_driver(struct ad5272_handle * handle, struct i2c_bus * bus, uint8_t id);
esError ad5272_term_driver(struct ad5272_handle * handle);
esError ad5272_set_pot1(struct ad5272_handle * handle, uint16_t val);
esError ad5272_set_pot2(struct ad5272_handle * handle, uint16_t val);
esError ad5272_operate(struct ad5272_handle * handle);
esError ad5272_shutdown(struct ad5272_handle * handle);

#ifdef	__cplusplus
}
#endif

#endif	/* AD5272_H */

