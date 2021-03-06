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

#include <stddef.h>

#include <libopencm3/lpc43xx/m4/nvic.h>

#include <streaming.h>

#include "tuning.h"

#include "usb.h"
#include "usb_standard_request.h"

#include <rom_iap.h>
#include "usb_descriptor.h"

#include "usb_device.h"
#include "usb_endpoint.h"
#include "usb_api_board_info.h"
#include "usb_api_cpld.h"
#include "usb_api_register.h"
#include "usb_api_spiflash.h"
#include "usb_api_operacake.h"
#include "operacake.h"
#include "usb_api_sweep.h"
#include "usb_api_transceiver.h"
#include "usb_bulk_buffer.h"
#include "usb_api_wieker.h"
 
#include "hackrf-ui.h"

static const usb_request_handler_fn vendor_request_handler[] = {
        NULL,
        usb_vendor_request_set_transceiver_mode,
        usb_vendor_request_write_max2837,
        usb_vendor_request_read_max2837,
        usb_vendor_request_write_si5351c,
        usb_vendor_request_read_si5351c,
        usb_vendor_request_set_sample_rate_frac,
        usb_vendor_request_set_baseband_filter_bandwidth,
#ifdef RAD1O
	NULL, // write_rffc5071 not used
	NULL, // read_rffc5071 not used
#else
        usb_vendor_request_write_rffc5071,
        usb_vendor_request_read_rffc5071,
#endif
        usb_vendor_request_erase_spiflash,
        usb_vendor_request_write_spiflash,
        usb_vendor_request_read_spiflash,
        NULL, // used to be write_cpld
	usb_vendor_request_read_board_id,
        usb_vendor_request_read_version_string,
        usb_vendor_request_set_freq,
        usb_vendor_request_set_amp_enable,
        usb_vendor_request_read_partid_serialno,
        usb_vendor_request_set_lna_gain,
        usb_vendor_request_set_vga_gain,
        usb_vendor_request_set_txvga_gain,
        NULL, // was set_if_freq
#ifdef HACKRF_ONE
        usb_vendor_request_set_antenna_enable,
#else
	NULL,
#endif
        usb_vendor_request_set_freq_explicit,
        usb_vendor_request_read_wcid,  // USB_WCID_VENDOR_REQ
	usb_vendor_request_init_sweep,
        usb_vendor_request_operacake_get_boards,
        usb_vendor_request_operacake_set_ports,
        usb_vendor_request_set_hw_sync_mode,
        usb_vendor_request_reset,
        usb_vendor_request_operacake_set_ranges,
        usb_vendor_request_custom_wieker_spi_write,
        usb_vendor_request_custom_wieker_spi_read,
        usb_vendor_request_custom_wieker_spi_erase,
};

static const uint32_t vendor_request_handler_count =
	sizeof(vendor_request_handler) / sizeof(vendor_request_handler[0]);

usb_request_status_t usb_vendor_request(
	usb_endpoint_t* const endpoint,
	const usb_transfer_stage_t stage
) {
	usb_request_status_t status = USB_REQUEST_STATUS_STALL;
	
	if( endpoint->setup.request < vendor_request_handler_count ) {
		usb_request_handler_fn handler = vendor_request_handler[endpoint->setup.request];
		if( handler ) {
			status = handler(endpoint, stage);
		}
	}
	
	return status;
}

const usb_request_handlers_t usb_request_handlers = {
	.standard = usb_standard_request,
	.class = 0,
	.vendor = usb_vendor_request,
	.reserved = 0,
};

void usb_configuration_changed(
	usb_device_t* const device
) {
	/* Reset transceiver to idle state until other commands are received */
	set_transceiver_mode(TRANSCEIVER_MODE_OFF);
	if( device->configuration->number == 1 ) {
		// transceiver configuration
		cpu_clock_pll1_max_speed();
		led_on(LED1);
	} else {
		/* Configuration number equal 0 means usb bus reset. */
		cpu_clock_pll1_low_speed();
		led_off(LED1);
	}
}

void usb_set_descriptor_by_serial_number(void)
{
	iap_cmd_res_t iap_cmd_res;
	
	/* Read IAP Serial Number Identification */
	iap_cmd_res.cmd_param.command_code = IAP_CMD_READ_SERIAL_NO;
	iap_cmd_call(&iap_cmd_res);
	
	if (iap_cmd_res.status_res.status_ret == CMD_SUCCESS) {
		usb_descriptor_string_serial_number[0] = USB_DESCRIPTOR_STRING_SERIAL_BUF_LEN;
		usb_descriptor_string_serial_number[1] = USB_DESCRIPTOR_TYPE_STRING;
		
		/* 32 characters of serial number, convert to UTF-16LE */
		for (size_t i=0; i<USB_DESCRIPTOR_STRING_SERIAL_LEN; i++) {
			const uint_fast8_t nibble = (iap_cmd_res.status_res.iap_result[i >> 3] >> (28 - (i & 7) * 4)) & 0xf;
			const char c = (nibble > 9) ? ('a' + nibble - 10) : ('0' + nibble);
			usb_descriptor_string_serial_number[2 + i * 2] = c;
			usb_descriptor_string_serial_number[3 + i * 2] = 0x00;
		}
	} else {
		usb_descriptor_string_serial_number[0] = 2;
		usb_descriptor_string_serial_number[1] = USB_DESCRIPTOR_TYPE_STRING;
	}
}

#include "hackrf_core.h"
#include "gpio_lpc.h"
#include <libopencm3/lpc43xx/cgu.h>
#include <libopencm3/lpc43xx/ccu.h>
#include <libopencm3/lpc43xx/scu.h>
#include <libopencm3/lpc43xx/i2c.h>
#include "../liblpc/sgpio.h"

static struct gpio_t gpio_led[] = {
        GPIO(3,  7),
        GPIO(0,  7),
        GPIO(3,  5),
};

void i2c0_init_slave(const uint16_t duty_cycle_count)
{
    /* enable input on SCL and SDA pins */
    SCU_SFSI2C0 = SCU_I2C0_NOMINAL;

    I2C0_SCLH = duty_cycle_count;
    I2C0_SCLL = duty_cycle_count;

    /* clear the control bits */
    I2C0_CONCLR = (I2C_CONCLR_AAC | I2C_CONCLR_SIC
                   | I2C_CONCLR_STAC | I2C_CONCLR_I2ENC);

    /* enable I2C0 */
    I2C0_CONSET = I2C_CONSET_I2EN | I2C_CONSET_AA;
    I2C0_ADR0 = 1;
}

/* receive data byte */
uint8_t i2c0_rx_byte_slave(void)
{
    while (!(I2C0_CONSET & I2C_CONSET_SI));
    I2C0_CONCLR = I2C_CONCLR_SIC;
    while (!(I2C0_CONSET & I2C_CONSET_SI));
    return I2C0_DAT;
}

extern void I2C1_IRQHandler(void);
extern void I2C0_IRQHandler(void);

void i2c1_isr(void) {
    I2C1_IRQHandler();
}

void i2c0_isr(void) {
    I2C0_IRQHandler();
}

#include "main_main.h"

int main(void) {
    main_main();
    init_i2c();
    //sgpio_main();
    main_ssp();
    //main_i2c();
    //main_adc();
    //main_timer();

    //gpio_init();
    usb_main();


    //spi_main();

    /* Blink LED1/2/3 on the board. */

    while (1) {
        __asm volatile ("wfi");
    }

	return 0;
}

void usb_main() {// Enable USB

    /* use XTAL_OSC as clock source for PLL0USB */
    CGU_PLL0USB_CTRL = CGU_PLL0USB_CTRL_PD(1)
                       | CGU_PLL0USB_CTRL_AUTOBLOCK(1)
                       | CGU_PLL0USB_CTRL_CLK_SEL(CGU_SRC_XTAL);
    while (CGU_PLL0USB_STAT & CGU_PLL0USB_STAT_LOCK_MASK);

    /* configure PLL0USB to produce 480 MHz clock from 12 MHz XTAL_OSC */
    /* Values from User Manual v1.4 Table 94, for 12MHz oscillator. */
    CGU_PLL0USB_MDIV = 0x06167FFA;
    CGU_PLL0USB_NP_DIV = 0x00302062;
    CGU_PLL0USB_CTRL |= (CGU_PLL0USB_CTRL_PD(1)
                         | CGU_PLL0USB_CTRL_DIRECTI(1)
                         | CGU_PLL0USB_CTRL_DIRECTO(1)
                         | CGU_PLL0USB_CTRL_CLKEN(1));

    /* power on PLL0USB and wait until stable */
    CGU_PLL0USB_CTRL &= ~CGU_PLL0USB_CTRL_PD_MASK;
    while (!(CGU_PLL0USB_STAT & CGU_PLL0USB_STAT_LOCK_MASK));

    /* use PLL0USB as clock source for USB0 */
    CGU_BASE_USB0_CLK = CGU_BASE_USB0_CLK_AUTOBLOCK(1)
                        | CGU_BASE_USB0_CLK_CLK_SEL(CGU_SRC_PLL0USB);

    usb_set_descriptor_by_serial_number();

    //usb_set_configuration_changed_cb(usb_configuration_changed);
    usb_peripheral_reset();

    usb_device_init(0, &usb_device);

    usb_queue_init(&usb_endpoint_control_out_queue);
    usb_queue_init(&usb_endpoint_control_in_queue);
    usb_queue_init(&usb_endpoint_bulk_out_queue);
    usb_queue_init(&usb_endpoint_bulk_in_queue);

    usb_endpoint_init(&usb_endpoint_control_out);
    usb_endpoint_init(&usb_endpoint_control_in);

    usb_run(&usb_device);
}
