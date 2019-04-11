# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wangyilin/wyl/work/graphene

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangyilin/wyl/work/graphene/build

# Include any dependencies generated for this target.
include libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/depend.make

# Include the progress variables for this target.
include libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/progress.make

# Include the compile flags for this target's objects.
include libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/flags.make

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/flags.make
libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o: ../libraries/fc/secp256k1/upstream/src/secp256k1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wangyilin/wyl/work/graphene/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o"
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && /usr/bin/clang-4.0  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o   -c /home/wangyilin/wyl/work/graphene/libraries/fc/secp256k1/upstream/src/secp256k1.c

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.i"
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && /usr/bin/clang-4.0  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wangyilin/wyl/work/graphene/libraries/fc/secp256k1/upstream/src/secp256k1.c > CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.i

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.s"
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && /usr/bin/clang-4.0  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wangyilin/wyl/work/graphene/libraries/fc/secp256k1/upstream/src/secp256k1.c -o CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.s

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.requires:

.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.requires

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.provides: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.requires
	$(MAKE) -f libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/build.make libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.provides.build
.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.provides

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.provides.build: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o


# Object files for target secp256k1
secp256k1_OBJECTS = \
"CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o"

# External object files for target secp256k1
secp256k1_EXTERNAL_OBJECTS =

libraries/fc/secp256k1/libsecp256k1.a: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o
libraries/fc/secp256k1/libsecp256k1.a: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/build.make
libraries/fc/secp256k1/libsecp256k1.a: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wangyilin/wyl/work/graphene/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libsecp256k1.a"
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && $(CMAKE_COMMAND) -P CMakeFiles/secp256k1.dir/cmake_clean_target.cmake
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/secp256k1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/build: libraries/fc/secp256k1/libsecp256k1.a

.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/build

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/requires: libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/upstream/src/secp256k1.c.o.requires

.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/requires

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/clean:
	cd /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 && $(CMAKE_COMMAND) -P CMakeFiles/secp256k1.dir/cmake_clean.cmake
.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/clean

libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/depend:
	cd /home/wangyilin/wyl/work/graphene/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangyilin/wyl/work/graphene /home/wangyilin/wyl/work/graphene/libraries/fc/secp256k1 /home/wangyilin/wyl/work/graphene/build /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1 /home/wangyilin/wyl/work/graphene/build/libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libraries/fc/secp256k1/CMakeFiles/secp256k1.dir/depend

