/*
 * Copyright 2012 Jared Boone
 * Copyright 2013 Benjamin Vernoux
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

#include "usb_api_board_info.h"

#include <hackrf_core.h>
#include <rom_iap.h>
#include <usb_queue.h>
#include <libopencm3/lpc43xx/wwdt.h>

#include <stddef.h>
#include <string.h>
#include <libopencm3/lpc43xx/rgu.h>
#include <libopencm3/lpc43xx/scu.h>
#include <libopencm3/lpc43xx/i2c.h>
#include <libopencm3/dispatch/nvic.h>

char version_string[] = VERSION_STRING;
uint16_t some_value = 9;

usb_request_status_t usb_vendor_request_read_board_id(
		usb_endpoint_t* const endpoint, const usb_transfer_stage_t stage)
{
	if (stage == USB_TRANSFER_STAGE_SETUP) {
		endpoint->buffer[0] = BOARD_ID;
		usb_transfer_schedule_block(endpoint->in, &endpoint->buffer, 1, NULL, NULL);
		usb_transfer_schedule_ack(endpoint->out);
	}
	return USB_REQUEST_STATUS_OK;
}

usb_request_status_t usb_vendor_request_read_version_string(
	usb_endpoint_t* const endpoint, const usb_transfer_stage_t stage)
{
	uint8_t length;

	if (stage == USB_TRANSFER_STAGE_SETUP) {
		length = (uint8_t)strlen(version_string);
		usb_transfer_schedule_block(endpoint->in, version_string, length, NULL, NULL);
		usb_transfer_schedule_ack(endpoint->out);
	}
	return USB_REQUEST_STATUS_OK;
}

usb_request_status_t usb_vendor_request_read_partid_serialno(
	usb_endpoint_t* const endpoint, const usb_transfer_stage_t stage)
{
	uint8_t length;
	read_partid_serialno_t read_partid_serialno;
	iap_cmd_res_t iap_cmd_res;

    RESET_CTRL0 = 1;

	if (stage == USB_TRANSFER_STAGE_SETUP) 
	{
		/* Read IAP Part Number Identification */
		iap_cmd_res.cmd_param.command_code = IAP_CMD_READ_PART_ID_NO;
		iap_cmd_call(&iap_cmd_res);
		if(iap_cmd_res.status_res.status_ret != CMD_SUCCESS)
			return USB_REQUEST_STATUS_STALL;

		read_partid_serialno.part_id[0] = iap_cmd_res.status_res.iap_result[0];
		read_partid_serialno.part_id[1] = iap_cmd_res.status_res.iap_result[1];
		
		/* Read IAP Serial Number Identification */
		iap_cmd_res.cmd_param.command_code = IAP_CMD_READ_SERIAL_NO;
		iap_cmd_call(&iap_cmd_res);
		if(iap_cmd_res.status_res.status_ret != CMD_SUCCESS)
			return USB_REQUEST_STATUS_STALL;

		read_partid_serialno.serial_no[0] = iap_cmd_res.status_res.iap_result[0];
		read_partid_serialno.serial_no[1] = iap_cmd_res.status_res.iap_result[1];
		read_partid_serialno.serial_no[2] = iap_cmd_res.status_res.iap_result[2];
		read_partid_serialno.serial_no[3] = iap_cmd_res.status_res.iap_result[3];
		
		length = (uint8_t)sizeof(read_partid_serialno_t);
		usb_transfer_schedule_block(endpoint->in, &read_partid_serialno, length,
					    NULL, NULL);
		usb_transfer_schedule_ack(endpoint->out);
	}
	return USB_REQUEST_STATUS_OK;
}

usb_request_status_t usb_vendor_request_reset(
	usb_endpoint_t* const endpoint, const usb_transfer_stage_t stage)
{
	if (stage == USB_TRANSFER_STAGE_SETUP) {
		wwdt_reset(100000);
		usb_transfer_schedule_ack(endpoint->in);
	}
	return USB_REQUEST_STATUS_OK;
}


extern uint8_t *read_data(int slaveAddr, unsigned int addr);
extern void write_data(uint8_t slaveAddr, uint8_t addr, uint8_t data);

usb_request_status_t usb_vendor_request_write_i2c(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        if( endpoint->setup.index < 256 ) {
            if( endpoint->setup.value < 256 ) {
                usb_transfer_schedule_ack(endpoint->in);
                return USB_REQUEST_STATUS_OK;
            }
        }
        return USB_REQUEST_STATUS_STALL;
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}

uint8_t *spi_flash_read(uint32_t addr, uint32_t len);

usb_request_status_t usb_vendor_request_read_i2c(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        if( endpoint->setup.index < 256 ) {
            /*//MSNA_P1
            uint32_t p1 = 128 * 24 -512;
            uint32_t p2 = 0;
            uint32_t p3 = 1;
            write_data(0x60, 28, p1 >> 16);
            endpoint->buffer[1] = *read_data(0x60, 28);
            write_data(0x60, 29, (p1 >> 8) & (uint32_t) 0xff);
            endpoint->buffer[1] = *read_data(0x60, 29);
            write_data(0x60, 30, p1 & (uint32_t) 0xff);
            endpoint->buffer[1] = *read_data(0x60, 30);
            //MSNA_P2
            write_data(0x60, 31, 0);
            endpoint->buffer[1] = *read_data(0x60, 31);
            write_data(0x60, 32, 0);
            endpoint->buffer[1] = *read_data(0x60, 32);
            write_data(0x60, 33, 0);
            endpoint->buffer[1] = *read_data(0x60, 33);
            //MSNA_P3
            write_data(0x60, 31, 0);
            endpoint->buffer[1] = *read_data(0x60, 31);
            write_data(0x60, 26, 0);
            endpoint->buffer[1] = *read_data(0x60, 26);
            write_data(0x60, 27, 1);
            endpoint->buffer[1] = *read_data(0x60, 27);

            //MS2_P1
            uint32_t ms = 128 * 900 -512;
            write_data(0x60, 60, 0x50 | (ms >> 16));
            endpoint->buffer[1] = *read_data(0x60, 60);
            write_data(0x60, 61, (ms >> 8) & (uint32_t) 0xff);
            endpoint->buffer[1] = *read_data(0x60, 61);
            write_data(0x60, 62, ms & (uint32_t) 0xff);
            endpoint->buffer[1] = *read_data(0x60, 62);
            //MSNA_P2
            write_data(0x60, 63, 0);
            endpoint->buffer[1] = *read_data(0x60, 63);
            write_data(0x60, 64, 0);
            endpoint->buffer[1] = *read_data(0x60, 64);
            write_data(0x60, 65, 0);
            endpoint->buffer[1] = *read_data(0x60, 65);
            //MSNA_P3
            write_data(0x60, 63, 0);
            endpoint->buffer[1] = *read_data(0x60, 63);
            write_data(0x60, 58, 0);
            endpoint->buffer[1] = *read_data(0x60, 58);
            write_data(0x60, 59, 1);
            endpoint->buffer[1] = *read_data(0x60, 59);

            // enable clk2
            endpoint->buffer[1] = *read_data(0x60, 18);
            write_data(0x60, 18, 0x0c);
            endpoint->buffer[1] = *read_data(0x60, 18);
            usb_transfer_schedule_block(endpoint->in, &endpoint->buffer, 1,
                                        NULL, NULL);
            usb_transfer_schedule_ack(endpoint->out);*/

            uint32_t addr;
            uint16_t len;

            addr = (endpoint->setup.value << 16) | endpoint->setup.index;
            len = endpoint->setup.length;
            //w25q80bv_read(&spi_flash, addr, len, &spiflash_buffer[0]);
            uint8_t *buf = spi_flash_read(addr, len);
            usb_transfer_schedule_block(endpoint->in, buf, len,
                                        NULL, NULL);
            usb_transfer_schedule_ack(endpoint->out);

            return USB_REQUEST_STATUS_OK;
        }
        return USB_REQUEST_STATUS_STALL;
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}