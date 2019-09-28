//
// Created by wieker on 9/29/19.
//

#include <usb_queue.h>
#include <stddef.h>
#include "usb_api_wieker.h"

#include "ssp_general.h"


extern uint8_t *read_data(int slaveAddr, unsigned int addr);
extern void write_data(uint8_t slaveAddr, uint8_t addr, uint8_t data);

uint8_t bufA1[128];
uint32_t addr;
uint16_t len;

usb_request_status_t usb_vendor_request_custom_wieker_spi_write(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        addr = (endpoint->setup.value << 16) | endpoint->setup.index;
        len = endpoint->setup.length;
        usb_transfer_schedule_block(endpoint->out, bufA1, len,
                                    NULL, NULL);
        return USB_REQUEST_STATUS_OK;
    } else if (stage == USB_TRANSFER_STAGE_DATA) {
        spi_flash_we();
        spi_flash_wait();
        spi_flash_write(addr, len, bufA1);
        spi_flash_wait();
        usb_transfer_schedule_ack(endpoint->in);
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}

usb_request_status_t usb_vendor_request_custom_wieker_spi_read(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
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
    } else {
        return USB_REQUEST_STATUS_OK;
    }
}

usb_request_status_t usb_vendor_request_custom_wieker_spi_erase(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
) {
    if( stage == USB_TRANSFER_STAGE_SETUP ) {
        spi_flash_we();
        spi_flash_wait();
        spi_flash_erase_all();
        spi_flash_wait();
        usb_transfer_schedule_ack(endpoint->in);
    }
    return USB_REQUEST_STATUS_OK;
}
