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
#include <getopt.h>

#ifndef bool
typedef int bool;
#define true 1
#define false 0
#endif

#define REGISTER_INVALID 32767

int parse_int(char* s, uint16_t* const value) {
    uint_fast8_t base = 10;
    char* s_end;
    long long_value;

    if( strlen(s) > 2 ) {
        if( s[0] == '0' ) {
            if( (s[1] == 'x') || (s[1] == 'X') ) {
                base = 16;
                s += 2;
            } else if( (s[1] == 'b') || (s[1] == 'B') ) {
                base = 2;
                s += 2;
            }
        }
    }

    s_end = s;
    long_value = strtol(s, &s_end, base);
    if( (s != s_end) && (*s_end == 0) ) {
        *value = (uint16_t)long_value;
        return HACKRF_SUCCESS;
    } else {
        return HACKRF_ERROR_INVALID_PARAM;
    }
}

int read_register(hackrf_device* device,
                  const uint16_t register_number) {
    uint16_t register_value;
    printf("enter usb\n");
    int result = hackrf_i2c_read(device, register_number, &register_value);
    printf("value = %x\n", register_value);
    return result;
}

int write_register(hackrf_device* device,
                   const uint16_t register_number,
                   const uint16_t register_value) {
    return hackrf_i2c_write(device, register_number, register_value);
}

static void usage() {
    printf("\nUsage:\n");
    printf("\t-h, --help: this help\n");
    printf("\t-n, --register <n>: set register number for read/write operations\n");
    printf("\t-r, --read: read register specified by last -n argument, or all registers\n");
    printf("\t-w, --write <v>: write register specified by last -n argument with value <v>\n");
    printf("\t-c, --config: print SI5351C multisynth configuration information\n");
    printf("\t-d, --device <s>: specify a particular device by serial number\n");
    printf("\t-m, --max2837: target MAX2837\n");
    printf("\t-s, --si5351c: target SI5351C\n");
    printf("\t-f, --rffc5072: target RFFC5072\n");
    printf("\nExamples:\n");
    printf("\thackrf_debug --si5351c -n 0 -r     # reads from si5351c register 0\n");
    printf("\thackrf_debug --si5351c -c          # displays si5351c multisynth configuration\n");
    printf("\thackrf_debug --rffc5072 -r         # reads all rffc5072 registers\n");
    printf("\thackrf_debug --max2837 -n 10 -w 22 # writes max2837 register 10 with 22 decimal\n");
}

static struct option long_options[] = {
        { "config", no_argument, 0, 'c' },
        { "register", required_argument, 0, 'n' },
        { "write", required_argument, 0, 'w' },
        { "read", no_argument, 0, 'r' },
        { "device", no_argument, 0, 'd' },
        { "help", no_argument, 0, 'h' },
        { "max2837", no_argument, 0, 'm' },
        { "si5351c", no_argument, 0, 's' },
        { "rffc5072", no_argument, 0, 'f' },
        { 0, 0, 0, 0 },
};

int main(int argc, char** argv) {
    int opt;
    uint16_t register_number = REGISTER_INVALID;
    hackrf_device* device = NULL;
    int option_index = 0;
    bool read = false;
    bool write = false;
    uint8_t board_id = BOARD_ID_INVALID;
    const char* serial_number = NULL;

    int result = hackrf_init();
    if(result) {
        printf("hackrf_init() failed: %s (%d)\n", hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }

    while( (opt = getopt_long(argc, argv, "rw", long_options, &option_index)) != EOF ) {
        switch( opt ) {
            case 'w':
                write = true;
                //result = parse_int(optarg, &register_value);
                break;

            case 'r':
                read = true;
                break;
            default:
                fprintf(stderr, "unknown argument '-%c %s'\n", opt, optarg);
                usage();
                return EXIT_FAILURE;
        }

        if(result != HACKRF_SUCCESS) {
            printf("argument error: %s (%d)\n", hackrf_error_name(result), result);
            usage();
            return EXIT_FAILURE;
        }
    }

    if(write && read) {
        fprintf(stderr, "Read and write options are mutually exclusive.\n");
        usage();
        return EXIT_FAILURE;
    }

    if(!(write || read)) {
        fprintf(stderr, "Specify read, write, or config option.\n");
        usage();
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


    result = hackrf_board_id_read(device, &board_id);
    if (result != HACKRF_SUCCESS) {
        fprintf(stderr, "hackrf_board_id_read() failed: %s (%d)\n",
                hackrf_error_name(result), result);
        return EXIT_FAILURE;
    }
    printf("Board ID Number: %d (%s)\n", board_id,
           hackrf_board_id_name(board_id));

    if (read) {
        result = read_register(device, register_number);
    }

    if (write) {
        printf("here\n");
        result = write_register(device, 1, 1);
    }


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
