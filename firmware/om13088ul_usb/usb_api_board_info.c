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

void i2c0_init_master(const uint16_t duty_cycle_count)
{
    /* enable input on SCL and SDA pins */
    SCU_SFSI2C0 = SCU_I2C0_NOMINAL;

    I2C0_SCLH = duty_cycle_count;
    I2C0_SCLL = duty_cycle_count;

    /* clear the control bits */
    I2C0_CONCLR = (I2C_CONCLR_AAC | I2C_CONCLR_SIC
                   | I2C_CONCLR_STAC | I2C_CONCLR_I2ENC);

    /* enable I2C0 */
    I2C0_CONSET = I2C_CONSET_I2EN;
}

/* transmit start bit */
void i2c0_tx_bit_master(void)
{
    I2C0_CONCLR = I2C_CONCLR_SIC;
    I2C0_CONSET = I2C_CONSET_STA;
    while (!(I2C0_CONSET & I2C_CONSET_SI));
    I2C0_CONCLR = I2C_CONCLR_STAC;
}

/* transmit data byte */
void i2c0_tx_byte_master(uint8_t byte)
{
    if (I2C0_CONSET & I2C_CONSET_STA) {
        I2C0_CONCLR = I2C_CONCLR_STAC;
    }
    I2C0_DAT = byte;
    I2C0_CONCLR = I2C_CONCLR_SIC;
    while (!(I2C0_CONSET & I2C_CONSET_SI));
}

/* transmit stop bit */
void i2c0_stop_master(void)
{
    if (I2C0_CONSET & I2C_CONSET_STA) {
        I2C0_CONCLR = I2C_CONCLR_STAC;
    }
    I2C0_CONSET = I2C_CONSET_STO;
    I2C0_CONCLR = I2C_CONCLR_SIC;
}

void i2c1_init_a(const uint16_t duty_cycle_count)
{
    /* enable input on SCL and SDA pins */
    SCU_SFSI2C0 = SCU_I2C0_NOMINAL;

    I2C1_SCLH = duty_cycle_count;
    I2C1_SCLL = duty_cycle_count;

    /* clear the control bits */
    I2C1_CONCLR = (I2C_CONCLR_AAC | I2C_CONCLR_SIC
                   | I2C_CONCLR_STAC | I2C_CONCLR_I2ENC);

    /* enable I2C0 */
    I2C1_CONSET = I2C_CONSET_I2EN | I2C_CONSET_AA;

    nvic_enable_irq(NVIC_I2C1_IRQ);

    I2C1_ADR0 = 1;

    SCU_SFSP2_3 = 0x01;
    SCU_SFSP2_4 = 0x01;
}

/* transmit start bit */
void i2c1_tx_start_a(void)
{
    I2C1_CONCLR = I2C_CONCLR_SIC;
    I2C1_CONSET = I2C_CONSET_STA;
    while (!(I2C1_CONSET & I2C_CONSET_SI));
    I2C1_CONCLR = I2C_CONCLR_STAC;
}

/* transmit data byte */
void i2c1_tx_byte_a(uint8_t byte)
{
    if (I2C1_CONSET & I2C_CONSET_STA) {
        I2C1_CONCLR = I2C_CONCLR_STAC;
    }
    I2C1_DAT = byte;
    I2C1_CONCLR = I2C_CONCLR_SIC;
    while (!(I2C1_CONSET & I2C_CONSET_SI));
}

/* receive data byte */
uint8_t i2c0_rx_byte_a(void)
{
    if (I2C0_CONSET & I2C_CONSET_STA) {
        I2C0_CONCLR = I2C_CONCLR_STAC;
    }
    I2C0_CONCLR = I2C_CONCLR_SIC;
    while (!(I2C0_CONSET & I2C_CONSET_SI));
    return I2C0_DAT;
}

/* receive data byte */
uint8_t i2c1_rx_byte_a(void)
{
    while (!(I2C1_CONSET & I2C_CONSET_SI));
    I2C1_CONCLR = I2C_CONCLR_SIC;
    while (!(I2C1_CONSET & I2C_CONSET_SI));
    return I2C1_DAT;
}

usb_request_status_t usb_vendor_request_write_i2c(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        if( endpoint->setup.index < 256 ) {
            if( endpoint->setup.value < 256 ) {
                //si5351c_write_single(&clock_gen, endpoint->setup.index, endpoint->setup.value);
                some_value = endpoint->setup.value;
                i2c0_init_master(255);
                i2c0_tx_bit_master();
                i2c0_tx_byte_master(0);
                i2c0_tx_byte_master(some_value);
                i2c0_stop_master();
                usb_transfer_schedule_ack(endpoint->in);
                return USB_REQUEST_STATUS_OK;
            }
        }
        return USB_REQUEST_STATUS_STALL;
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}

usb_request_status_t usb_vendor_request_read_i2c(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        if( endpoint->setup.index < 256 ) {
            //const uint8_t value = si5351c_read_single(&clock_gen, endpoint->setup.index);
            //i2c0_init_slave(15);
            //i2c1_tx_start_a();
            //endpoint->buffer[0] = * (uint32_t *) (0x400A1004);

            //endpoint->buffer[0] = i2c0_rx_byte_slave();
            endpoint->buffer[0] = * (uint32_t *) (0x400E0004);


            //endpoint->buffer[0] = some_value;
            usb_transfer_schedule_block(endpoint->in, &endpoint->buffer, 1,
                                        NULL, NULL);
            usb_transfer_schedule_ack(endpoint->out);
            return USB_REQUEST_STATUS_OK;
        }
        return USB_REQUEST_STATUS_STALL;
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}

void i2c1_isr(void) {
    some_value = 18;
}