/*
 * Copyright 2012 Jared Boone <jared@sharebrained.com>
 * Copyright 2013 Benjamin Vernoux <titanmkd@gmail.com>
 * Copyright 2017 Dominic Spill <dominicgs@gmail.com>
 *
 * This file is part of HackRF.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#include <hackrf.h>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <zconf.h>

int main(int argc, char** argv) {
    hackrf_device* device = NULL;
    uint8_t board_id = BOARD_ID_INVALID;
    const char* serial_number = NULL;

    int result = hackrf_init();
    if(result) {
        printf("hackrf_init() failed: %s (%d)\n", hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }

    result = hackrf_open_by_serial(serial_number, &device);
    if(result) {
        printf("hackrf_open() failed: %s (%d)\n", hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }


    result = hackrf_board_id_read(device, &board_id);
    if (result != HACKRF_SUCCESS) {
        fprintf(stderr, "hackrf_board_id_read() failed: %s (%d)\n",
                hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }
    printf("Board ID Number: %d (%s)\n", board_id,
           hackrf_board_id_name(board_id));


    uint8_t buf[256];
    custom_wieker_spi_read(device, 0x00, 0x10, buf);
    custom_wieker_spi_read(device, 0x10, 0x10, buf);
    custom_wieker_spi_read(device, 0x08, 0x10, buf);

    FILE *f = fopen("spidump-erased", "wb");
    int read_size = 32220;
    int addr;
    for (addr = 0; addr < read_size; addr += 100) {
        uint8_t buffer[256];
        custom_wieker_spi_read(device, addr, 100, buffer);
        usleep(1000);
        fwrite(buffer, read_size - addr > 100 ? 100 : read_size - addr, 1, f);
    }
    fclose(f);

    custom_wieker_spi_erase(device);

    f = fopen("spidump", "rb");
    read_size = 32220;
    for (addr = 0; addr < read_size; addr += 16) {
        int new_len = read_size - addr > 16 ? 16 : read_size - addr;
        fread(buf, new_len, 1, f);
        custom_wieker_spi_write(device, addr, new_len, buf);
        usleep(1000);
    }
    fclose(f);

    result = hackrf_board_id_read(device, &board_id);
    if (result != HACKRF_SUCCESS) {
        fprintf(stderr, "hackrf_board_id_read() failed: %s (%d)\n",
                hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }
    printf("Board ID Number: %d (%s)\n", board_id,
           hackrf_board_id_name(board_id));

    result = hackrf_close(device);
    if(result) {
        printf("hackrf_close() failed: %s (%d)\n", hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }

    hackrf_exit();
    return EXIT_SUCCESS;
}
