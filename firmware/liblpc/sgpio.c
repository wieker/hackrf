//
// Created by wieker on 8/25/19.
//

#define DEBUG_ENABLE

#include <stdint-gcc.h>
#include "cmsis.h"
#include "core_cm4.h"
#include "sgpio.h"
#include "chip_lpc43xx.h"
#include "board_api.h"

uint8_t sgpio_buffer[256];

const uint32_t sgpio_buffer_mask = 256 - 1;

volatile uint32_t sgpio_buffer_offset = 0;

void sgpio_main() {
    DEBUGOUT("SGPIO init entry\r\n");
    Chip_SCU_PinMuxSet(1, 3, (SCU_PINIO_FAST |  SCU_MODE_FUNC2));
    Chip_SCU_PinMuxSet(1, 4, (SCU_PINIO_FAST |  SCU_MODE_FUNC2));

    Chip_Clock_Enable(CLK_BASE_PERIPH);
    Chip_Clock_Enable(CLK_PERIPH_SGPIO);

    NVIC_EnableIRQ(SGPIO_INT_IRQn);
    NVIC_ClearPendingIRQ(SGPIO_INT_IRQn);

// SGPIO pin 0 outputs slice A bit 0.
    ((LPC_SGPIO_T *)LPC_SGPIO)->SLICE_MUX_CFG[10] =
            (1L <<  2);

// SGPIO pin 12 outputs slice D bit 0.
    LPC_SGPIO->SLICE_MUX_CFG[12] =
            (0L <<  4) |    // P_OE_CFG = X
            (0L <<  0);     // P_OUT_CFG = 0, dout_doutm1 (1-bit mode)

// Slice A
    LPC_SGPIO->SGPIO_MUX_CFG[10] =
            (0L << 12) |    // CONCAT_ORDER = 0 (self-loop)
            (0L << 11) |    // CONCAT_ENABLE = 1 (concatenate data)
            (0L <<  9) |    // QUALIFIER_SLICE_MODE = X
            (0L <<  7) |    // QUALIFIER_PIN_MODE = X
            (0L <<  5) |    // QUALIFIER_MODE = 0 (enable)
            (0L <<  3) |    // CLK_SOURCE_SLICE_MODE = 0, slice D
            (1L <<  2) |    // CLK_SOURCE_PIN_MODE = X
            (1L <<  1) |    // CLK_SOURCE_PIN_MODE = X
            (1L <<  0);     // EXT_CLK_ENABLE = 0, internal clock signal (slice)

    LPC_SGPIO->SLICE_MUX_CFG[10] =
            (0L <<  8) |    // INV_QUALIFIER = 0 (use normal qualifier)
            (0L <<  6) |    // PARALLEL_MODE = 0 (shift 1 bit per clock)
            (0L <<  4) |    // DATA_CAPTURE_MODE = 0 (detect rising edge)
            (0L <<  3) |    // INV_OUT_CLK = 0 (normal clock)
            (1L <<  2) |    // CLKGEN_MODE = 0 (use clock from COUNTER)
            (0L <<  1) |    // CLK_CAPTURE_MODE = 0 (use rising clock edge)
            (0L <<  0);     // MATCH_MODE = 0 (do not match data)

    LPC_SGPIO->PRESET[10] = 0;
    LPC_SGPIO->COUNT[10] = 0;
    LPC_SGPIO->POS[10] = (7 << 8) + 7;
    LPC_SGPIO->REG[10] = 0x0A1656FB;     // Primary output data register
    LPC_SGPIO->REG_SS[10] = 0x0A1656FB;  // Shadow output data register

// Start SGPIO operation by enabling slice clocks.
    LPC_SGPIO->CTRL_ENABLED =
            (1L <<  10);     // Slice A
    LPC_SGPIO->SET_EN_1 = 0x01 << 10;
    DEBUGOUT("SGPIO init done\r\n");
}

void sgpio_isr() {
    DEBUGOUT("SGPIO isr\r\n");
    sgpio_isr_custom();
}

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

void sgpio_isr_custom() {
    LPC_SGPIO->CTR_STATUS_1 = (1 << 10);

    uint32_t* const p = (uint32_t*)&sgpio_buffer[sgpio_buffer_offset];
    __asm__(
    "ldr r0, [%[SGPIO_REG_SS], #0]\n\t"
    "str r0, [%[p], #0]\n\t"
    :
    : [SGPIO_REG_SS] "l" (&LPC_SGPIO->REG_SS[10]),
    [p] "l" (p)
    : "r0"
    );
    sgpio_buffer_offset = (sgpio_buffer_offset + 4) & sgpio_buffer_mask;
    con_print_data((uint32_t*)&sgpio_buffer[sgpio_buffer_offset], 4);
}
