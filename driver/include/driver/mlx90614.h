/* 
 * File:   mlx90614.h
 * Author: nenad
 *
 * Created on February 24, 2015, 1:56 PM
 */

#ifndef MLX90614_H
#define	MLX90614_H

#include <stdint.h>
#include "base/error.h"
#include "driver/i2c.h"

#ifdef	__cplusplus
extern "C" {
#endif

struct mlx90614_handle
{
    struct i2c_slave    comm;
};

esError mlx_init_driver(
    struct mlx90614_handle *    handle,
    struct i2c_bus *            bus,
    uint8_t                     id);
esError mlx_read_temp(
    struct mlx90614_handle *    handle,
    float *                     temp);

#ifdef	__cplusplus
}
#endif

#endif	/* MLX90614_H */

