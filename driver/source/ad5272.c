
#include <xc.h>
#include "driver/ad5272.h"
#include "base/error.h"
#include "bsp.h"
#include "TimeDelay.h"

#define AD5272_ID                       0x58
#define RETRY_COUNT                     10

/*
 * Disable port
 */
#if defined(AD_SHDN_PORT) && defined(AD_SHDN_PIN) && defined(AD_SHDN_TRIS)
#define AD5272_SHDN_TRIS                AD_SHDN_TRIS
#define AD5272_SHDN_PORT                AD_SHDN_PORT
#define AD5272_SHDN_PIN                 AD_SHDN_PIN
#endif

#define AD5272_CMD_WR_RDAC              0x01u
#define AD5272_CMD_WR_CONTROL           0x07u
#define AD5272_CMD_RD_CONTROL           0x08u
#define AD5272_CONTROL_WRP              0x02u

static struct i2c_slave_config g_ad5272_i2c_config =
{
    I2C_SLAVE_RD_START_STOP | I2C_SLAVE_RD_NACK | I2C_SLAVE_RD_REPEAT,
    AD5272_ID
};

static void shdn_init(void)
{
#if defined(AD5272_SHDN_PORT)
    /* NOTE:
     * Just reset the pot and be done with it.
     */
    AD5272_SHDN_PORT &= ~(0x1u << AD5272_SHDN_PIN);
    AD5272_SHDN_TRIS &= ~(0x1u << AD5272_SHDN_PIN);
    Delay10us(10);
    AD5272_SHDN_PORT |=  (0x1u << AD5272_SHDN_PIN);
#endif
}

static void shdn_term(void)
{
    /* NOTE:
     * The pot does not support shutdown.
     */
}

static void shdn_shutdown(void)
{
    /* NOTE:
     * The pot does not support shutdown.
     */
}

static void shdn_operate(void)
{
    /* NOTE:
     * The pot does not support shutdown.
     */
}

static esError ad5272_write(struct ad5272_handle * handle, const uint8_t * data, uint8_t size)
{
    bool                        is_successful;
    uint8_t                     count;

    i2c_bus_start(handle->comm.bus);
    is_successful = i2c_bus_write(handle->comm.bus, handle->comm.address);
    
    if (!is_successful) {
        i2c_bus_stop(handle->comm.bus);
        return (ES_ERROR_DEVICE_FAIL);
    }

    for (count = 0; count < size; count++) {
        is_successful = i2c_bus_write(handle->comm.bus, data[count]);

        if (!is_successful) {
            break;
        }
    }
    i2c_bus_stop(handle->comm.bus);

    return (is_successful ? ES_ERROR_NONE : ES_ERROR_DEVICE_FAIL);
}

/* NOTE:
 * Not used
 */
#if 0
static esError ad5272_read(struct ad5272_handle * handle, uint8_t * data, uint8_t size)
{
    esError                    is_succesful;
    uint8_t                     count;

    i2c_bus_start(handle->comm.bus);
    is_succesful = i2c_bus_write(handle->comm.bus, handle->comm.address | 0x1u);

    if (!is_succesful) {
        return (ES_ERROR_DEVICE_FAIL);
    }
    size--;
    for (count = 0; count < size; count++) {
        data[count] = i2c_bus_read(handle->comm.bus);
        i2c_bus_ack(handle->comm.bus);
    }
    data[count] = i2c_bus_read(handle->comm.bus);
    i2c_bus_nack(handle->comm.bus);
    i2c_bus_stop(handle->comm.bus);

    return (ES_ERROR_NONE);
}
#endif

esError ad5272_init_driver(struct ad5272_handle * handle, struct i2c_bus * bus, uint8_t id)
{
    esError                     error;
    uint8_t                     data[2];

    i2c_slave_open(&handle->comm, &g_ad5272_i2c_config, bus, id);
    shdn_init();
    DelayMs(10);

    /* NOTE:
     * Enable control of pot by removing write protection
     */
    data[0] = (uint8_t)AD5272_CMD_WR_CONTROL << 2u;
    data[1] = 0x03;
    
    error = ad5272_write(handle, data, 2);

    /* NOTE:
     * Set maximum resistance to get minimum voltage
     */
    if (!error) {
        error = ad5272_set_pot1(handle, 1023u);
    }
    
    return (error);
}

esError ad5272_term_driver(struct ad5272_handle * handle)
{
    shdn_term();
    i2c_slave_close(&handle->comm);

    return (ES_ERROR_NONE);
}

esError ad5272_set_pot1(struct ad5272_handle * handle, uint16_t val)
{
    bool                is_successful;
    uint32_t            retry;

    retry         = RETRY_COUNT;
    is_successful = false;

    while (retry--) {
        uint8_t         data[2];
        esError         error;

        data[0] = (AD5272_CMD_WR_RDAC << 2u) | ((val & 0x03ffu) >> 8u);
        data[1] = val & 0xffu;

        error = ad5272_write(handle, data, 2);
        
        if (!error) {
            is_successful = true;
            break;
        }
        DelayMs(1);
    }

    if (!is_successful) {
        return (ES_ERROR_DEVICE_FAIL);
    } else {
        return (ES_ERROR_NONE);
    }
}

esError ad5272_set_pot2(struct ad5272_handle * handle, uint16_t val)
{
    (void)handle;
    (void)val;
    
    return (ES_ERROR_NO_DEVICE);
}

esError ad5272_operate(struct ad5272_handle * handle)
{
    (void)handle;
    shdn_operate();

    return (ES_ERROR_NONE);
}

esError ad5272_shutdown(struct ad5272_handle * handle)
{
    (void)handle;
    shdn_shutdown();

    return (ES_ERROR_NONE);
}

