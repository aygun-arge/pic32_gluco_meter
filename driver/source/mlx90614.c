
#include "driver/mlx90614.h"

#define MLX90614_ADDRESS                (0x5a << 1)
#define MLX90614_RD                     (MLX90614_ADDRESS |  0x1u)
#define MLX90614_WR                     (MLX90614_ADDRESS)

static struct i2c_slave_config g_mlx90614_i2c_config =
{
    I2C_SLAVE_RD_NACK | I2C_SLAVE_RD_REPEAT,
    MLX90614_ADDRESS
};

esError mlx_init_driver(
    struct mlx90614_handle *    handle,
    struct i2c_bus *            bus,
    uint8_t                     id)
{
    i2c_slave_open(&handle->comm, &g_mlx90614_i2c_config, bus, id);

    return (ES_ERROR_NONE);
}

esError mlx_read_temp(
    struct mlx90614_handle *    handle,
    float *                     temp)
{
    uint8_t                     buff[2];
    uint16_t                    value;

    if (i2c_slave_read(&handle->comm, 0x07, buff, sizeof(buff))) {
        value = ((uint16_t)buff[1] << 8u) | (uint16_t)buff[0];

        *temp = (value * 0.02) - 273.15;
        
        return (ES_ERROR_NONE);
    } else {
        *temp = 0.0;

        return (ES_ERROR_DEVICE_FAIL);
    }
}