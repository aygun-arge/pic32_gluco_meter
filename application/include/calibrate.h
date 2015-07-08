
#define CAL_REGIONS                     20

struct cal_coeff
{
    uint32_t                    boundary[CAL_REGIONS];
    float                       amplification[CAL_REGIONS];
    float                       offset;
};

