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
CMAKE_SOURCE_DIR = /home/riki/Test/pcs_library_image_modification/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/riki/Test/pcs_library_image_modification/test/build

# Include any dependencies generated for this target.
include publish_test/CMakeFiles/publishTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include publish_test/CMakeFiles/publishTest.dir/compiler_depend.make

# Include the progress variables for this target.
include publish_test/CMakeFiles/publishTest.dir/progress.make

# Include the compile flags for this target's objects.
include publish_test/CMakeFiles/publishTest.dir/flags.make

publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o: publish_test/CMakeFiles/publishTest.dir/flags.make
publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o: ../publish_test/publish_test.cpp
publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o: publish_test/CMakeFiles/publishTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riki/Test/pcs_library_image_modification/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o"
	cd /home/riki/Test/pcs_library_image_modification/test/build/publish_test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o -MF CMakeFiles/publishTest.dir/publish_test.cpp.o.d -o CMakeFiles/publishTest.dir/publish_test.cpp.o -c /home/riki/Test/pcs_library_image_modification/test/publish_test/publish_test.cpp

publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/publishTest.dir/publish_test.cpp.i"
	cd /home/riki/Test/pcs_library_image_modification/test/build/publish_test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riki/Test/pcs_library_image_modification/test/publish_test/publish_test.cpp > CMakeFiles/publishTest.dir/publish_test.cpp.i

publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/publishTest.dir/publish_test.cpp.s"
	cd /home/riki/Test/pcs_library_image_modification/test/build/publish_test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riki/Test/pcs_library_image_modification/test/publish_test/publish_test.cpp -o CMakeFiles/publishTest.dir/publish_test.cpp.s

# Object files for target publishTest
publishTest_OBJECTS = \
"CMakeFiles/publishTest.dir/publish_test.cpp.o"

# External object files for target publishTest
publishTest_EXTERNAL_OBJECTS =

bin/publishTest: publish_test/CMakeFiles/publishTest.dir/publish_test.cpp.o
bin/publishTest: publish_test/CMakeFiles/publishTest.dir/build.make
bin/publishTest: publish_test/CMakeFiles/publishTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/riki/Test/pcs_library_image_modification/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/publishTest"
	cd /home/riki/Test/pcs_library_image_modification/test/build/publish_test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/publishTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
publish_test/CMakeFiles/publishTest.dir/build: bin/publishTest
.PHONY : publish_test/CMakeFiles/publishTest.dir/build

publish_test/CMakeFiles/publishTest.dir/clean:
	cd /home/riki/Test/pcs_library_image_modification/test/build/publish_test && $(CMAKE_COMMAND) -P CMakeFiles/publishTest.dir/cmake_clean.cmake
.PHONY : publish_test/CMakeFiles/publishTest.dir/clean

publish_test/CMakeFiles/publishTest.dir/depend:
	cd /home/riki/Test/pcs_library_image_modification/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/riki/Test/pcs_library_image_modification/test /home/riki/Test/pcs_library_image_modification/test/publish_test /home/riki/Test/pcs_library_image_modification/test/build /home/riki/Test/pcs_library_image_modification/test/build/publish_test /home/riki/Test/pcs_library_image_modification/test/build/publish_test/CMakeFiles/publishTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : publish_test/CMakeFiles/publishTest.dir/depend

