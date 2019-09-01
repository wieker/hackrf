//
// Created by wieker on 9/1/19.
//

#include <board.h>
#include "main_main.h"

/* Print data to console */
static void con_print_data(const uint8_t *dat, int sz)
{
    int i;
    if (!sz) {
        return;
    }
    for (i = 0; i < sz; i++) {
        if (!(i & 0xF)) {
            DEBUGOUT("\r\n%02X: ", i);
        }
        DEBUGOUT(" %02X", dat[i]);
    }
    DEBUGOUT("\r\n");
}


void main_main() {
    DEBUGINIT();
    DEBUGOUT("Main enter\r\n");
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 0);
    Chip_GPIO_SetPinDIRInput(LPC_GPIO_PORT, 1, 13);
    Chip_SCU_PinMuxSet(2, 13, SCU_MODE_FUNC0 | SCU_MODE_INBUFF_EN);

    while (1) {
        int key = 0xFF;
        do {
            key = DEBUGIN();
        } while ((key & 0xFF) == 0xFF);

        switch (key) {
            case '1': {
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 0, (bool) true);
                DEBUGOUT("Toggled ON\r\n");
                break;
            }
            case '2': {
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 0, (bool) false);
                DEBUGOUT("Toggled OFF\r\n");
                break;
            }
            case 'r': {
                if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 13)) {
                    DEBUGOUT("Read ON\r\n");
                } else {
                    DEBUGOUT("Read OFF\r\n");
                }
                break;
            }
            case 'q':
                return;
            default:
                continue;
        }
    }
}
