# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build

# Include any dependencies generated for this target.
include CMakeFiles/lvgl-app.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/lvgl-app.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/lvgl-app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lvgl-app.dir/flags.make

CMakeFiles/lvgl-app.dir/clock.c.o: CMakeFiles/lvgl-app.dir/flags.make
CMakeFiles/lvgl-app.dir/clock.c.o: ../clock.c
CMakeFiles/lvgl-app.dir/clock.c.o: CMakeFiles/lvgl-app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lvgl-app.dir/clock.c.o"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lvgl-app.dir/clock.c.o -MF CMakeFiles/lvgl-app.dir/clock.c.o.d -o CMakeFiles/lvgl-app.dir/clock.c.o -c /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/clock.c

CMakeFiles/lvgl-app.dir/clock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lvgl-app.dir/clock.c.i"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/clock.c > CMakeFiles/lvgl-app.dir/clock.c.i

CMakeFiles/lvgl-app.dir/clock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lvgl-app.dir/clock.c.s"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/clock.c -o CMakeFiles/lvgl-app.dir/clock.c.s

CMakeFiles/lvgl-app.dir/main.c.o: CMakeFiles/lvgl-app.dir/flags.make
CMakeFiles/lvgl-app.dir/main.c.o: ../main.c
CMakeFiles/lvgl-app.dir/main.c.o: CMakeFiles/lvgl-app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/lvgl-app.dir/main.c.o"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lvgl-app.dir/main.c.o -MF CMakeFiles/lvgl-app.dir/main.c.o.d -o CMakeFiles/lvgl-app.dir/main.c.o -c /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/main.c

CMakeFiles/lvgl-app.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lvgl-app.dir/main.c.i"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/main.c > CMakeFiles/lvgl-app.dir/main.c.i

CMakeFiles/lvgl-app.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lvgl-app.dir/main.c.s"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/main.c -o CMakeFiles/lvgl-app.dir/main.c.s

CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o: CMakeFiles/lvgl-app.dir/flags.make
CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o: ../mouse_cursor_icon.c
CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o: CMakeFiles/lvgl-app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o -MF CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o.d -o CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o -c /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/mouse_cursor_icon.c

CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.i"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/mouse_cursor_icon.c > CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.i

CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.s"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/mouse_cursor_icon.c -o CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.s

CMakeFiles/lvgl-app.dir/demo_app.c.o: CMakeFiles/lvgl-app.dir/flags.make
CMakeFiles/lvgl-app.dir/demo_app.c.o: ../demo_app.c
CMakeFiles/lvgl-app.dir/demo_app.c.o: CMakeFiles/lvgl-app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/lvgl-app.dir/demo_app.c.o"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lvgl-app.dir/demo_app.c.o -MF CMakeFiles/lvgl-app.dir/demo_app.c.o.d -o CMakeFiles/lvgl-app.dir/demo_app.c.o -c /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/demo_app.c

CMakeFiles/lvgl-app.dir/demo_app.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lvgl-app.dir/demo_app.c.i"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/demo_app.c > CMakeFiles/lvgl-app.dir/demo_app.c.i

CMakeFiles/lvgl-app.dir/demo_app.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lvgl-app.dir/demo_app.c.s"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/demo_app.c -o CMakeFiles/lvgl-app.dir/demo_app.c.s

CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o: CMakeFiles/lvgl-app.dir/flags.make
CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o: ../img/PartlyCloudy.c
CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o: CMakeFiles/lvgl-app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o -MF CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o.d -o CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o -c /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/img/PartlyCloudy.c

CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.i"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/img/PartlyCloudy.c > CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.i

CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.s"
	/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/img/PartlyCloudy.c -o CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.s

# Object files for target lvgl-app
lvgl__app_OBJECTS = \
"CMakeFiles/lvgl-app.dir/clock.c.o" \
"CMakeFiles/lvgl-app.dir/main.c.o" \
"CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o" \
"CMakeFiles/lvgl-app.dir/demo_app.c.o" \
"CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o"

# External object files for target lvgl-app
lvgl__app_EXTERNAL_OBJECTS =

../bin/lvgl-app: CMakeFiles/lvgl-app.dir/clock.c.o
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/main.c.o
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/mouse_cursor_icon.c.o
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/demo_app.c.o
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/img/PartlyCloudy.c.o
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/build.make
../bin/lvgl-app: lib/liblvgl.a
../bin/lvgl-app: lib/liblvgl_examples.a
../bin/lvgl-app: lib/liblvgl_demos.a
../bin/lvgl-app: lib/liblvgl_thorvg.a
../bin/lvgl-app: lib/liblvgl.a
../bin/lvgl-app: CMakeFiles/lvgl-app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable ../bin/lvgl-app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lvgl-app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lvgl-app.dir/build: ../bin/lvgl-app
.PHONY : CMakeFiles/lvgl-app.dir/build

CMakeFiles/lvgl-app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lvgl-app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lvgl-app.dir/clean

CMakeFiles/lvgl-app.dir/depend:
	cd /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/CMakeFiles/lvgl-app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lvgl-app.dir/depend

