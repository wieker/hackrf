# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/source/intellij/clion-2019.1.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/source/intellij/clion-2019.1.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wieker/Projects/linux/hackrf/hackrf/firmware

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wieker/Projects/linux/hackrf/hackrf/firmware

# Include any dependencies generated for this target.
include hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/depend.make

# Include the progress variables for this target.
include hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/progress.make

# Include the compile flags for this target's objects.
include hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/flags.make

# Object files for target hackrf_usb.elf
hackrf_usb_elf_OBJECTS =

# External object files for target hackrf_usb.elf
hackrf_usb_elf_EXTERNAL_OBJECTS = \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/hackrf_usb.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/tuning.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/streaming.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/sgpio_isr.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_bulk_buffer.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_request.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_standard_request.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_descriptor.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_device.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_endpoint.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_board_info.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_cpld.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_register.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_spiflash.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_transceiver.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/operacake.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_operacake.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_sweep.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_queue.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/fault_handler.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/cpld_jtag.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/lenval.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/micro.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/ports.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rom_iap.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/hackrf_core.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/sgpio.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rf_path.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/si5351c.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max2837.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max2837_target.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max5864.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max5864_target.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/mixer.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/i2c_bus.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/i2c_lpc.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/w25q80bv.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/w25q80bv_target.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/spi_bus.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/spi_ssp.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/gpio_lpc.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rffc5071.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rffc5071_spi.c.obj" \
"/home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/m0_bin.s.obj"

hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/hackrf_usb.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/tuning.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/streaming.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/sgpio_isr.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_bulk_buffer.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_request.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_standard_request.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_descriptor.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_device.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_endpoint.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_board_info.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_cpld.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_register.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_spiflash.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_transceiver.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/operacake.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_operacake.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/usb_api_sweep.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/usb_queue.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/fault_handler.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/cpld_jtag.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/lenval.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/micro.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/xapp058/ports.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rom_iap.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/hackrf_core.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/sgpio.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rf_path.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/si5351c.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max2837.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max2837_target.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max5864.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/max5864_target.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/mixer.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/i2c_bus.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/i2c_lpc.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/w25q80bv.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/w25q80bv_target.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/spi_bus.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/spi_ssp.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/gpio_lpc.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rffc5071.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/__/common/rffc5071_spi.c.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb_objects.dir/m0_bin.s.obj
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/build.make
hackrf_usb/hackrf_usb.elf: hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wieker/Projects/linux/hackrf/hackrf/firmware/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C executable hackrf_usb.elf"
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hackrf_usb.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/build: hackrf_usb/hackrf_usb.elf

.PHONY : hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/build

hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/clean:
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb && $(CMAKE_COMMAND) -P CMakeFiles/hackrf_usb.elf.dir/cmake_clean.cmake
.PHONY : hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/clean

hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/depend:
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wieker/Projects/linux/hackrf/hackrf/firmware /home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb /home/wieker/Projects/linux/hackrf/hackrf/firmware /home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb /home/wieker/Projects/linux/hackrf/hackrf/firmware/hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hackrf_usb/CMakeFiles/hackrf_usb.elf.dir/depend

