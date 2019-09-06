//
// Created by wieker on 9/1/19.
//

#ifndef HACKRF_FIRMWARE_ALL_MAIN_MAIN_H
#define HACKRF_FIRMWARE_ALL_MAIN_MAIN_H


#include "adc.h"

extern void main_main();

extern int main_ssp();

extern int main_i2c(void);

extern int init_i2c();

#endif //HACKRF_FIRMWARE_ALL_MAIN_MAIN_H
