//
// Created by wieker on 9/29/19.
//

#ifndef HACKRF_FIRMWARE_ALL_USB_API_WIEKER_H
#define HACKRF_FIRMWARE_ALL_USB_API_WIEKER_H

#include <stdint.h>

#include <usb_type.h>
#include <usb_request.h>

usb_request_status_t usb_vendor_request_custom_wieker_spi_write(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
);
usb_request_status_t usb_vendor_request_custom_wieker_spi_read(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
);
usb_request_status_t usb_vendor_request_custom_wieker_spi_erase(
        usb_endpoint_t* const endpoint,
        const usb_transfer_stage_t stage
);

#endif //HACKRF_FIRMWARE_ALL_USB_API_WIEKER_H
