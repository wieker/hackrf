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
	// Send startup message
	acia_tx_str("\n\n\rIcestick 6502 cc65 serial test\n\n\r");

    /*while(1) {
        cnt = 80;
        while(cnt--) {
            acia_tx_chr('0');
        }
        acia_tx_str("\n\r");
        cnt = 1024L;
        while(cnt--)
        {
        }
    }*/
	
	// test some C stuff
	for(i=0;i<26;i++)
		txt_buf[i] = 'A'+i;
	txt_buf[i] = 0;
	acia_tx_str(txt_buf);
	acia_tx_str("\n\r");
    SRAM_DATA = 'A';
    *(&SRAM_DATA + 1) = 'B';
	
	// enable ACIA IRQ for serial echo in background
	ACIA_CTRL = 0x80;
	asm("CLI");
	
    // Run forever with GPIO blink
    while(1)
    {
        acia_tx_str(txt_buf);
        acia_tx_str("\n\r");
        acia_tx_chr(*(&SRAM_DATA + 1));
        acia_tx_chr(SRAM_DATA);
        acia_tx_chr(*(&SRAM_DATA + 1));
        acia_tx_str("\n\r");
        SRAM_DATA = SRAM_DATA + 1;
        *(&SRAM_DATA + 1) = *(&SRAM_DATA + 1) + 1;
        acia_tx_chr('0' + ADC_DATA / 100);
        acia_tx_chr('0' + ADC_DATA / 10 % 10);
        acia_tx_chr('0' + ADC_DATA % 10);
        acia_tx_str("\n\r");

        // write counter msbyte to GPIO
        GPIO_DATA ^= 0xFF;
    }

    //  We should never get here!
    return (0);
}

void run_cmd() {
    acia_tx_str("\n\n\rIcestick 6502 cc65 serial test\n\n\r");
}
