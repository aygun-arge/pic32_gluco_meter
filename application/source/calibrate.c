
#include "calibrate.h"

static struct cal_coeff g_cal_coeff;

void cal_init(void)
{
}

void cal_load_coeff(const struct cal_coeff * coeff)
{
    g_cal_coeff = *coeff;
}

float cal_calculate(uint32_t raw_value)
{
    uint32_t                    region;

    for (region = 0u; region < CAL_REGIONS; region++) {
        if (raw_value < g_cal_coeff.boundary[region]) {
            return ((raw_value - g_cal_coeff.offset) * g_cal_coeff.amplification[region]);
        }
    }

    return (raw_value);
}
            
