//
// Created by wieker on 8/25/19.
//

#ifndef HACKRF_FIRMWARE_ALL_SGPIO_H
#define HACKRF_FIRMWARE_ALL_SGPIO_H

extern uint8_t sgpio_buffer[256];

extern const uint32_t sgpio_buffer_mask;

extern volatile uint32_t sgpio_buffer_offset;

extern void sgpio_main();
extern void sgpio_isr_custom();

#endif //HACKRF_FIRMWARE_ALL_SGPIO_H
