//
// Created by wieker on 9/1/19.
//

#include <board.h>
#include "main_main.h"


void main_main() {
    DEBUGINIT();
    DEBUGOUT("Main enter\r\n");
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 0);

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
            case 'q':
                return;
            default:
                continue;
        }
    }
}
