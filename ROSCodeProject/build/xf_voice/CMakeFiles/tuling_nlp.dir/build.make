# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/corvin/YoYoRobot/ROSCodeProject/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/corvin/YoYoRobot/ROSCodeProject/build

# Include any dependencies generated for this target.
include xf_voice/CMakeFiles/tuling_nlp.dir/depend.make

# Include the progress variables for this target.
include xf_voice/CMakeFiles/tuling_nlp.dir/progress.make

# Include the compile flags for this target's objects.
include xf_voice/CMakeFiles/tuling_nlp.dir/flags.make

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o: xf_voice/CMakeFiles/tuling_nlp.dir/flags.make
xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o: /home/corvin/YoYoRobot/ROSCodeProject/src/xf_voice/src/tuling_nlp.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/corvin/YoYoRobot/ROSCodeProject/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o -c /home/corvin/YoYoRobot/ROSCodeProject/src/xf_voice/src/tuling_nlp.cpp

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.i"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/corvin/YoYoRobot/ROSCodeProject/src/xf_voice/src/tuling_nlp.cpp > CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.i

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.s"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/corvin/YoYoRobot/ROSCodeProject/src/xf_voice/src/tuling_nlp.cpp -o CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.s

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.requires:
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.requires

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.provides: xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.requires
	$(MAKE) -f xf_voice/CMakeFiles/tuling_nlp.dir/build.make xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.provides.build
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.provides

xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.provides.build: xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o

# Object files for target tuling_nlp
tuling_nlp_OBJECTS = \
"CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o"

# External object files for target tuling_nlp
tuling_nlp_EXTERNAL_OBJECTS =

/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: xf_voice/CMakeFiles/tuling_nlp.dir/build.make
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/libroscpp.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/librosconsole.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/liblog4cxx.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/librostime.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /opt/ros/indigo/lib/libcpp_common.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp: xf_voice/CMakeFiles/tuling_nlp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tuling_nlp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xf_voice/CMakeFiles/tuling_nlp.dir/build: /home/corvin/YoYoRobot/ROSCodeProject/devel/lib/xf_voice/tuling_nlp
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/build

xf_voice/CMakeFiles/tuling_nlp.dir/requires: xf_voice/CMakeFiles/tuling_nlp.dir/src/tuling_nlp.cpp.o.requires
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/requires

xf_voice/CMakeFiles/tuling_nlp.dir/clean:
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice && $(CMAKE_COMMAND) -P CMakeFiles/tuling_nlp.dir/cmake_clean.cmake
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/clean

xf_voice/CMakeFiles/tuling_nlp.dir/depend:
	cd /home/corvin/YoYoRobot/ROSCodeProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/corvin/YoYoRobot/ROSCodeProject/src /home/corvin/YoYoRobot/ROSCodeProject/src/xf_voice /home/corvin/YoYoRobot/ROSCodeProject/build /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice /home/corvin/YoYoRobot/ROSCodeProject/build/xf_voice/CMakeFiles/tuling_nlp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xf_voice/CMakeFiles/tuling_nlp.dir/depend

