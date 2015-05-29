
#include "driver/s25fl.h"
#include "flash_log.h"
#include "base/error.h"

#define ALLOC_TABLE_ADDRESS             0

#define ALLOC_TABLE_SIGNATURE           0xdeadbeef

struct flash_alloc_table
{
    uint32_t                    signature;
    uint32_t                    num_of_logs;
};

static struct flash_alloc_table g_table;

esError flash_log_init(void)
{
    esError                     error;
    
    error = flashRead(ALLOC_TABLE_ADDRESS, &g_table, sizeof(g_table));

    if (error) {
        g_table.signature   = ALLOC_TABLE_SIGNATURE;
        g_table.num_of_logs = 0;
        return (error);
    }

    if (g_table.signature != ALLOC_TABLE_SIGNATURE) {
        flash_log_erase();
    }

    return (ES_ERROR_NONE);
}

uint32_t flash_log_num_of_logs(void)
{
    return (g_table.num_of_logs);
}

void flash_log_erase(void)
{
    g_table.signature   = ALLOC_TABLE_SIGNATURE;
    g_table.num_of_logs = 0;
    flashEraseAll();
    flashWrite(ALLOC_TABLE_ADDRESS, &g_table, sizeof(g_table));
}

esError flash_log_save(void * data, size_t size)
{
    esError                     error;
    uint32_t                    address;
    uint32_t                    slots;

    slots = flashGetNBigSector();

    if (g_table.num_of_logs >= slots) {
        return (ES_ERROR_NO_MEMORY);
    }
    address = flashGetBigSectorAddress() + (g_table.num_of_logs * flashGetBigSectorSize());

    flashEraseSector(address);
    error = flashWrite(address, data, size);

    if (error) {
        return (error);
    }
    g_table.num_of_logs++;
    flashEraseSector(ALLOC_TABLE_ADDRESS);
    error = flashWrite(ALLOC_TABLE_ADDRESS, &g_table, sizeof(g_table));

    return (error);
}

esError flash_log_restore(void * data, size_t size, uint32_t id)
{
    esError                     error;
    uint32_t                    address;

    address = flashGetBigSectorAddress() + (id * flashGetBigSectorSize());

    error = flashRead(address, data, size);

    return (error);
}
