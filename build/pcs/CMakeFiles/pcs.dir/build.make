# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/riki/Test/pcs_library_image_modification

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/riki/Test/pcs_library_image_modification/build

# Include any dependencies generated for this target.
include pcs/CMakeFiles/pcs.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include pcs/CMakeFiles/pcs.dir/compiler_depend.make

# Include the progress variables for this target.
include pcs/CMakeFiles/pcs.dir/progress.make

# Include the compile flags for this target's objects.
include pcs/CMakeFiles/pcs.dir/flags.make

pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o: ../pcs/src/EpollEvent.cpp
pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o -MF CMakeFiles/pcs.dir/src/EpollEvent.cpp.o.d -o CMakeFiles/pcs.dir/src/EpollEvent.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/EpollEvent.cpp

pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/EpollEvent.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/EpollEvent.cpp > CMakeFiles/pcs.dir/src/EpollEvent.cpp.i

pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/EpollEvent.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/EpollEvent.cpp -o CMakeFiles/pcs.dir/src/EpollEvent.cpp.s

pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o: ../pcs/src/pcs.cpp
pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o -MF CMakeFiles/pcs.dir/src/pcs.cpp.o.d -o CMakeFiles/pcs.dir/src/pcs.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/pcs.cpp

pcs/CMakeFiles/pcs.dir/src/pcs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/pcs.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/pcs.cpp > CMakeFiles/pcs.dir/src/pcs.cpp.i

pcs/CMakeFiles/pcs.dir/src/pcs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/pcs.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/pcs.cpp -o CMakeFiles/pcs.dir/src/pcs.cpp.s

pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o: ../pcs/src/publisher.cpp
pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o -MF CMakeFiles/pcs.dir/src/publisher.cpp.o.d -o CMakeFiles/pcs.dir/src/publisher.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/publisher.cpp

pcs/CMakeFiles/pcs.dir/src/publisher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/publisher.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/publisher.cpp > CMakeFiles/pcs.dir/src/publisher.cpp.i

pcs/CMakeFiles/pcs.dir/src/publisher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/publisher.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/publisher.cpp -o CMakeFiles/pcs.dir/src/publisher.cpp.s

pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o: ../pcs/src/subscriber.cpp
pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o -MF CMakeFiles/pcs.dir/src/subscriber.cpp.o.d -o CMakeFiles/pcs.dir/src/subscriber.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/subscriber.cpp

pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/subscriber.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/subscriber.cpp > CMakeFiles/pcs.dir/src/subscriber.cpp.i

pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/subscriber.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/subscriber.cpp -o CMakeFiles/pcs.dir/src/subscriber.cpp.s

pcs/CMakeFiles/pcs.dir/src/timer.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/timer.cpp.o: ../pcs/src/timer.cpp
pcs/CMakeFiles/pcs.dir/src/timer.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object pcs/CMakeFiles/pcs.dir/src/timer.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/timer.cpp.o -MF CMakeFiles/pcs.dir/src/timer.cpp.o.d -o CMakeFiles/pcs.dir/src/timer.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/timer.cpp

pcs/CMakeFiles/pcs.dir/src/timer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/timer.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/timer.cpp > CMakeFiles/pcs.dir/src/timer.cpp.i

pcs/CMakeFiles/pcs.dir/src/timer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/timer.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/timer.cpp -o CMakeFiles/pcs.dir/src/timer.cpp.s

pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o: pcs/CMakeFiles/pcs.dir/flags.make
pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o: ../pcs/src/transport_udp.cpp
pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o: pcs/CMakeFiles/pcs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o -MF CMakeFiles/pcs.dir/src/transport_udp.cpp.o.d -o CMakeFiles/pcs.dir/src/transport_udp.cpp.o -c /home/riki/Test/pcs_library_image_modification/pcs/src/transport_udp.cpp

pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcs.dir/src/transport_udp.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/pcs/src/transport_udp.cpp > CMakeFiles/pcs.dir/src/transport_udp.cpp.i

pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcs.dir/src/transport_udp.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/pcs/src/transport_udp.cpp -o CMakeFiles/pcs.dir/src/transport_udp.cpp.s

# Object files for target pcs
pcs_OBJECTS = \
"CMakeFiles/pcs.dir/src/EpollEvent.cpp.o" \
"CMakeFiles/pcs.dir/src/pcs.cpp.o" \
"CMakeFiles/pcs.dir/src/publisher.cpp.o" \
"CMakeFiles/pcs.dir/src/subscriber.cpp.o" \
"CMakeFiles/pcs.dir/src/timer.cpp.o" \
"CMakeFiles/pcs.dir/src/transport_udp.cpp.o"

# External object files for target pcs
pcs_EXTERNAL_OBJECTS =

lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/EpollEvent.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/pcs.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/publisher.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/subscriber.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/timer.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/src/transport_udp.cpp.o
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/build.make
lib/libpcs.so: pcs/CMakeFiles/pcs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/riki/Test/pcs_library_image_modification/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX shared library ../lib/libpcs.so"
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pcs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pcs/CMakeFiles/pcs.dir/build: lib/libpcs.so
.PHONY : pcs/CMakeFiles/pcs.dir/build

pcs/CMakeFiles/pcs.dir/clean:
	cd /home/riki/Test/pcs_library_image_modification/build/pcs && $(CMAKE_COMMAND) -P CMakeFiles/pcs.dir/cmake_clean.cmake
.PHONY : pcs/CMakeFiles/pcs.dir/clean

pcs/CMakeFiles/pcs.dir/depend:
	cd /home/riki/Test/pcs_library_image_modification/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/riki/Test/pcs_library_image_modification /home/riki/Test/pcs_library_image_modification/pcs /home/riki/Test/pcs_library_image_modification/build /home/riki/Test/pcs_library_image_modification/build/pcs /home/riki/Test/pcs_library_image_modification/build/pcs/CMakeFiles/pcs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pcs/CMakeFiles/pcs.dir/depend
