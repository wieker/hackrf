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
CMAKE_SOURCE_DIR = /home/wieker/Projects/linux/hackrf/hackrf/host

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug

# Include any dependencies generated for this target.
include hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/depend.make

# Include the progress variables for this target.
include hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/progress.make

# Include the compile flags for this target's objects.
include hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/flags.make

hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o: hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/flags.make
hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o: ../hackrf-tools/src/hackrf_sweep.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o"
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o   -c /home/wieker/Projects/linux/hackrf/hackrf/host/hackrf-tools/src/hackrf_sweep.c

hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.i"
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wieker/Projects/linux/hackrf/hackrf/host/hackrf-tools/src/hackrf_sweep.c > CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.i

hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.s"
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wieker/Projects/linux/hackrf/hackrf/host/hackrf-tools/src/hackrf_sweep.c -o CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.s

# Object files for target hackrf_sweep
hackrf_sweep_OBJECTS = \
"CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o"

# External object files for target hackrf_sweep
hackrf_sweep_EXTERNAL_OBJECTS =

hackrf-tools/src/hackrf_sweep: hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/hackrf_sweep.c.o
hackrf-tools/src/hackrf_sweep: hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/build.make
hackrf-tools/src/hackrf_sweep: libhackrf/src/libhackrf.so.0.5.0
hackrf-tools/src/hackrf_sweep: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
hackrf-tools/src/hackrf_sweep: hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable hackrf_sweep"
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hackrf_sweep.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/build: hackrf-tools/src/hackrf_sweep

.PHONY : hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/build

hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/clean:
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src && $(CMAKE_COMMAND) -P CMakeFiles/hackrf_sweep.dir/cmake_clean.cmake
.PHONY : hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/clean

hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/depend:
	cd /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wieker/Projects/linux/hackrf/hackrf/host /home/wieker/Projects/linux/hackrf/hackrf/host/hackrf-tools/src /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src /home/wieker/Projects/linux/hackrf/hackrf/host/cmake-build-debug/hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hackrf-tools/src/CMakeFiles/hackrf_sweep.dir/depend

