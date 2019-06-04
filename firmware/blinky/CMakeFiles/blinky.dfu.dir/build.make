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

# Utility rule file for blinky.dfu.

# Include the progress variables for this target.
include blinky/CMakeFiles/blinky.dfu.dir/progress.make

blinky/CMakeFiles/blinky.dfu:
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && rm -f _tmp.dfu _header.bin
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && cp blinky_dfu.bin _tmp.dfu
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && dfu-suffix --vid=0x1fc9 --pid=0x000c --did=0x0 -a _tmp.dfu && dfu-prefix -s 0 -a _tmp.dfu
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && python ../dfu.py blinky
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && cat _header.bin _tmp.dfu >blinky.dfu
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && rm -f _tmp.dfu _header.bin

blinky.dfu: blinky/CMakeFiles/blinky.dfu
blinky.dfu: blinky/CMakeFiles/blinky.dfu.dir/build.make

.PHONY : blinky.dfu

# Rule to build all files generated by this target.
blinky/CMakeFiles/blinky.dfu.dir/build: blinky.dfu

.PHONY : blinky/CMakeFiles/blinky.dfu.dir/build

blinky/CMakeFiles/blinky.dfu.dir/clean:
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky && $(CMAKE_COMMAND) -P CMakeFiles/blinky.dfu.dir/cmake_clean.cmake
.PHONY : blinky/CMakeFiles/blinky.dfu.dir/clean

blinky/CMakeFiles/blinky.dfu.dir/depend:
	cd /home/wieker/Projects/linux/hackrf/hackrf/firmware && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wieker/Projects/linux/hackrf/hackrf/firmware /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky /home/wieker/Projects/linux/hackrf/hackrf/firmware /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky /home/wieker/Projects/linux/hackrf/hackrf/firmware/blinky/CMakeFiles/blinky.dfu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : blinky/CMakeFiles/blinky.dfu.dir/depend

