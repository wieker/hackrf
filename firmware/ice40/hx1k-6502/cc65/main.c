/*
 * main.c - top level 6502 C code for icestick_6502
 * 03-04-19 E. Brombaugh
 * based on example code from https://cc65.github.io/doc/customizing.html
 */
 
#include <stdio.h>
#include <string.h>
#include "fpga.h"
#include "acia.h"

unsigned long cnt;
unsigned char x = 0;
char txt_buf[32];
unsigned long i;

int main()
{
    int s = 0;

	// Send startup message
	acia_tx_str("\n\n\rIcestick 6502 cc65 serial test\n\n\r");
	
	// enable ACIA IRQ for serial echo in background
	ACIA_CTRL = 0x80;
	asm("CLI");

    // Run forever with GPIO blink
    while(1) {

        if (s == 0) {
            acia_tx_str("hello\n");
            GPIO_DATA = 0xFF;
            s = 1;
        } else {
            acia_tx_str("world\r");
            GPIO_DATA = 0x00;
            s = 0;
        }
    }

    //  We should never get here!
    return (0);
}

void run_cmd() {
    acia_tx_str("\n\n\rIcestick 6502 cc65 serial test\n\n\r");
}
