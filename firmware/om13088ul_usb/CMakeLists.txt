# Copyright 2012 Michael Ossmann <mike@ossmann.com>
# Copyright 2012 Jared Boone <jared@sharebrained.com>
#
# This file is part of HackRF.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
#

cmake_minimum_required(VERSION 2.8.9)
set(CMAKE_TOOLCHAIN_FILE ../toolchain-arm-cortex-m.cmake)

project(blinky)

enable_language(C CXX ASM)

SET(PATH_HACKRF ../..)
SET(PATH_HACKRF_FIRMWARE ${PATH_HACKRF}/firmware)
SET(PATH_HACKRF_FIRMWARE_COMMON ${PATH_HACKRF_FIRMWARE}/common)
SET(LIBOPENCM3 ${PATH_HACKRF_FIRMWARE}/libopencm3)

	set(MCU_PARTNO LPC4320)

if(NOT DEFINED SRC_M0)
	set(SRC_M0 "${PATH_HACKRF_FIRMWARE_COMMON}/m0_sleep.c")
endif()

SET(LDSCRIPT_M4 "-T${PATH_HACKRF_FIRMWARE_COMMON}/${MCU_PARTNO}_M4_memory.ld -Tlibopencm3_lpc43xx_rom_to_ram.ld -T${PATH_HACKRF_FIRMWARE_COMMON}/LPC43xx_M4_M0_image_from_text.ld")

SET(LDSCRIPT_M4_DFU "-T${PATH_HACKRF_FIRMWARE_COMMON}/${MCU_PARTNO}_M4_memory.ld -Tlibopencm3_lpc43xx.ld -T${PATH_HACKRF_FIRMWARE_COMMON}/LPC43xx_M4_M0_image_from_text.ld")

SET(LDSCRIPT_M0 "-T${PATH_HACKRF_FIRMWARE_COMMON}/LPC43xx_M0_memory.ld -Tlibopencm3_lpc43xx_m0.ld")

SET(CFLAGS_COMMON "-Os -g3 -Wall -Wextra ${HACKRF_OPTS} ${COMMON_FLAGS} -fno-common -MD")
SET(LDFLAGS_COMMON "-nostartfiles -Wl,--gc-sections")

if(V STREQUAL "1")
	SET(LDFLAGS_COMMON "${LDFLAGS_COMMON} -Wl,--print-gc-sections")
endif()

SET(CPUFLAGS_M0 "-mthumb -mcpu=cortex-m0 -mfloat-abi=soft")
SET(CFLAGS_M0 "-std=gnu99 ${CFLAGS_COMMON} ${CPUFLAGS_M0} -DLPC43XX_M0")
SET(CXXFLAGS_M0 "-std=gnu++0x ${CFLAGS_COMMON} ${CPUFLAGS_M0} -DLPC43XX_M0")
SET(LDFLAGS_M0 "${LDFLAGS_COMMON} ${CPUFLAGS_M0} ${LDSCRIPT_M0} -Xlinker -Map=m0.map --specs=nano.specs")

SET(CPUFLAGS_M4 "-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16")
SET(CFLAGS_M4 "-std=gnu99 ${CFLAGS_COMMON} ${CPUFLAGS_M4} -DLPC43XX_M4")
SET(CXXFLAGS_M4 "-std=gnu++0x ${CFLAGS_COMMON} ${CPUFLAGS_M4} -DLPC43XX_M4")
SET(LDFLAGS_M4 "${LDFLAGS_COMMON} ${CPUFLAGS_M4} ${LDSCRIPT_M4} -Xlinker -Map=m4.map")
SET(LDFLAGS_M4_DFU "${LDFLAGS_COMMON} ${CPUFLAGS_M4} ${LDSCRIPT_M4_DFU} -Xlinker -Map=m4.map")

set(BUILD_SHARED_LIBS OFF)

include_directories("${LIBOPENCM3}/include/")
include_directories("${PATH_HACKRF_FIRMWARE_COMMON}")

macro(DeclareTargets)
	SET(SRC_M4
		${SRC_M4}
		${PATH_HACKRF_FIRMWARE_COMMON}/gpio_lpc.c
	)

	configure_file(
		${PATH_HACKRF_FIRMWARE_COMMON}/m0_bin.s.cmake
		m0_bin.s
	)

	link_directories(
		"${PATH_HACKRF_FIRMWARE_COMMON}"
		"${LIBOPENCM3}/lib"
		"${LIBOPENCM3}/lib/lpc43xx"
		"${CMAKE_INSTALL_PREFIX}/lib/armv7e-m/fpu"
	)

	add_executable(${PROJECT_NAME}_m0.elf ${SRC_M0})

	target_link_libraries(
		${PROJECT_NAME}_m0.elf
		c
		nosys
		opencm3_lpc43xx_m0
	)

	set_target_properties(${PROJECT_NAME}_m0.elf PROPERTIES COMPILE_FLAGS "${CFLAGS_M0}")
	set_target_properties(${PROJECT_NAME}_m0.elf PROPERTIES LINK_FLAGS "${LDFLAGS_M0}")

	add_custom_target(
		${PROJECT_NAME}_m0.bin
		DEPENDS ${PROJECT_NAME}_m0.elf
		COMMAND ${CMAKE_OBJCOPY} -Obinary ${PROJECT_NAME}_m0.elf ${PROJECT_NAME}_m0.bin
	)

	# Object files to be linked for both DFU and SPI flash versions
	add_library(${PROJECT_NAME}_objects OBJECT ${SRC_M4} m0_bin.s)
	set_target_properties(${PROJECT_NAME}_objects PROPERTIES COMPILE_FLAGS "${CFLAGS_M4}")
	add_dependencies(${PROJECT_NAME}_objects ${PROJECT_NAME}_m0.bin)

	# SPI flash version
	add_executable(${PROJECT_NAME}.elf $<TARGET_OBJECTS:${PROJECT_NAME}_objects>)

	target_link_libraries(
		${PROJECT_NAME}.elf
		c
		nosys
		opencm3_lpc43xx
		m
	)

	set_target_properties(${PROJECT_NAME}.elf PROPERTIES LINK_FLAGS "${LDFLAGS_M4}")

	# DFU - using a differnet LD script to run directly from RAM
	add_executable(${PROJECT_NAME}_dfu.elf $<TARGET_OBJECTS:${PROJECT_NAME}_objects>)

	target_link_libraries(
		${PROJECT_NAME}_dfu.elf
		c
		nosys
		opencm3_lpc43xx
		m
	)

	set_target_properties(${PROJECT_NAME}_dfu.elf PROPERTIES LINK_FLAGS "${LDFLAGS_M4_DFU}")
endmacro()

set(SRC_M4
	hackrf_usb.c
)

DeclareTargets()
