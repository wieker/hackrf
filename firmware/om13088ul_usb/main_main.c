//
// Created by wieker on 9/1/19.
//

#include <board.h>
#include "main_main.h"

void gpio_main();
void sram_main();

void probe_lpc51u68_i2c0();

void probe_lpc51u68_i2c0_repeat();

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

uint8_t xferbuf[10];


void main_main() {
    DEBUGINIT();
    while (1) {
        DEBUGOUT("Main enter\r\n");
        DEBUGOUT("Select option:\r\n");
        DEBUGOUT("1: GPIO:\r\n");
        DEBUGOUT("2: SPI:\r\n");
        DEBUGOUT("3: I2C:\r\n");
        DEBUGOUT("4: I2C LPC51u probe on I2C0:\r\n");
        DEBUGOUT("5: I2C LPC51u probe on I2C0: rep\r\n");
        DEBUGOUT("6: SGPIO\r\n");
        DEBUGOUT("7: enable timers\r\n");
        DEBUGOUT("8: UART read\r\n");
        DEBUGOUT("9: UART write\r\n");
        DEBUGOUT("G: SRAM write\r\n");
        int key = 0xFF;
        do {
            key = DEBUGIN();
        } while ((key & 0xFF) == 0xFF);

        switch (key) {
            case '1': {
                gpio_main();
                break;
            }
            case '2': {
                main_ssp();
                break;
            }
            case '3': {
                main_i2c();
                break;
            }
            case '4': {
                probe_lpc51u68_i2c0();
                continue;
            }
            case '5': {
                probe_lpc51u68_i2c0_repeat();
                continue;
            }
            case '6': {
                sgpio_main();
                continue;
            }
            case '7': {
                main_timer();
                continue;
            }
            case '8': {
                uart_main_read();
                continue;
            }
            case '9': {
                uart_main_write();
                continue;
            }
            case 'G': {
                sram_main();
                continue;
            }
            case 'q':
                return;
            default:
                continue;
        }
    }
}

void probe_lpc51u68_i2c0() {
    DEBUGOUT("LPCprobe enter\r\n");
    init_i2c();

    static I2C_XFER_T xfer;
    I2C_ID_T i2cDev = I2C0;
    xfer.slaveAddr = 0x18;
    xfer.txBuff = xferbuf;
    xfer.txSz = 8;
    xferbuf[0] = 0xA5;
    xferbuf[1] = 0x00;
    xferbuf[2] = 0x00;
    xferbuf[3] = 0x00;
    xferbuf[4] = 0x00;
    xferbuf[5] = 0x00;
    xferbuf[6] = 0x00;
    xferbuf[7] = 0xA5;
    int tmp = Chip_I2C_MasterSend(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    DEBUGOUT("Written %d bytes of data to slave 0x%02X.\r\n", tmp, xfer.slaveAddr);
    con_print_data(xfer.txBuff, xfer.txSz);
    tmp = Chip_I2C_MasterRead(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    con_print_data(xfer.txBuff, xfer.txSz);
}

void probe_lpc51u68_i2c0_repeat() {
    DEBUGOUT("LPCprobe enter Rep\r\n");
    init_i2c();
    Chip_GPIO_SetPinDIRInput(LPC_GPIO_PORT, 1, 13);
    Chip_SCU_PinMuxSet(2, 13, SCU_MODE_FUNC0 | SCU_MODE_INBUFF_EN);

    static I2C_XFER_T xfer;
    I2C_ID_T i2cDev = I2C0;
    xfer.slaveAddr = 0x30;
    xfer.txBuff = xferbuf;
    xfer.txSz = 8;
    xferbuf[0] = 0xA5;
    xferbuf[1] = 0x01;
    xferbuf[2] = 0x00;
    xferbuf[3] = 0x00;
    xferbuf[4] = 0x00;
    xferbuf[5] = 0x00;
    xferbuf[6] = 0x00;
    xferbuf[7] = 0xA4;
    int tmp = Chip_I2C_MasterSend(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    DEBUGOUT("Written %d bytes of data to slave 0x%02X.\r\n", tmp, xfer.slaveAddr);
    con_print_data(xfer.txBuff, xfer.txSz);
    if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 13)) {
        DEBUGOUT("Read ON\r\n");
    } else {
        DEBUGOUT("Read OFF\r\n");
    }
    tmp = Chip_I2C_MasterRead(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    con_print_data(xfer.txBuff, xfer.txSz);
    if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 13)) {
        DEBUGOUT("Read ON\r\n");
    } else {
        DEBUGOUT("Read OFF\r\n");
    }
    xfer.txSz = 1;
    xferbuf[0] = 0xA1;
    Chip_I2C_MasterSend(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    DEBUGOUT("Written %d bytes of data to slave 0x%02X.\r\n", tmp, xfer.slaveAddr);
    con_print_data(xfer.txBuff, xfer.txSz);
    if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 13)) {
        DEBUGOUT("Read ON\r\n");
    } else {
        DEBUGOUT("Read OFF\r\n");
    }
    xfer.txSz = 5;
    tmp = Chip_I2C_MasterRead(i2cDev, xfer.slaveAddr, xfer.txBuff, xfer.txSz);
    con_print_data(xfer.txBuff, xfer.txSz);
    if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 13)) {
        DEBUGOUT("Read ON\r\n");
    } else {
        DEBUGOUT("Read OFF\r\n");
    }
}

void gpio_main() {
    DEBUGOUT("Main GPIO enter\r\n");
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

void delay(uint32_t duration);

void sram_main() {
    DEBUGOUT("Main SRAM enter\r\n");
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 12); //2[12]
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 10); //P2[10]
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) true);
    Chip_GPIO_SetPinDIRInput(LPC_GPIO_PORT, 1, 0); //P1[7]
    Chip_SCU_PinMuxSet(2, 13, SCU_MODE_FUNC0 | SCU_MODE_INBUFF_EN);
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 1); //CS
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) true);

    while (1) {
        int key = 0xFF;
        do {
            key = DEBUGIN();
        } while ((key & 0xFF) == 0xFF);

        switch (key) {
            case '1': {
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) false);
                Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 0); //2[12]
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 0, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) false);
                DEBUGOUT("Toggled ON\r\n");

                delay(20);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
                Chip_GPIO_SetPinDIRInput(LPC_GPIO_PORT, 1, 0); //P1[7]
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) true);
                break;
            }
            case '2': {
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) false);
                Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 0); //2[12]
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 0, (bool) false);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) false);
                DEBUGOUT("Toggled OFF\r\n");

                delay(20);

                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) true);
                Chip_GPIO_SetPinDIRInput(LPC_GPIO_PORT, 1, 0); //P1[7]
                break;
            }
            case 'r': {
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) false);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) false);

                delay(20);
                if (Chip_GPIO_GetPinState(LPC_GPIO_PORT, 1, 0)) {
                    DEBUGOUT("Read ON\r\n");
                } else {
                    DEBUGOUT("Read OFF\r\n");
                }
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 10, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, (bool) true);
                Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 1, (bool) true);
                break;
            }
            case 'q':
                return;
            default:
                continue;
        }
    }
}
