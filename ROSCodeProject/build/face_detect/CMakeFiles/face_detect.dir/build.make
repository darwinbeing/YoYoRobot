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
include face_detect/CMakeFiles/face_detect.dir/depend.make

# Include the progress variables for this target.
include face_detect/CMakeFiles/face_detect.dir/progress.make

# Include the compile flags for this target's objects.
include face_detect/CMakeFiles/face_detect.dir/flags.make

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o: /home/corvin/YoYoRobot/ROSCodeProject/src/face_detect/src/face_detect.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/corvin/YoYoRobot/ROSCodeProject/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/src/face_detect.cpp.o -c /home/corvin/YoYoRobot/ROSCodeProject/src/face_detect/src/face_detect.cpp

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/face_detect.dir/src/face_detect.cpp.i"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/corvin/YoYoRobot/ROSCodeProject/src/face_detect/src/face_detect.cpp > CMakeFiles/face_detect.dir/src/face_detect.cpp.i

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/face_detect.dir/src/face_detect.cpp.s"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/corvin/YoYoRobot/ROSCodeProject/src/face_detect/src/face_detect.cpp -o CMakeFiles/face_detect.dir/src/face_detect.cpp.s

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.requires:
.PHONY : face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.requires

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.provides: face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.requires
	$(MAKE) -f face_detect/CMakeFiles/face_detect.dir/build.make face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.provides.build
.PHONY : face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.provides

face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.provides.build: face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o

# Object files for target face_detect
face_detect_OBJECTS = \
"CMakeFiles/face_detect.dir/src/face_detect.cpp.o"

# External object files for target face_detect
face_detect_EXTERNAL_OBJECTS =

/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/build.make
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libcv_bridge.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libimage_transport.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libmessage_filters.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libclass_loader.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/libPocoFoundation.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libdl.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libroscpp.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/librosconsole.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/liblog4cxx.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libroslib.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/librostime.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /opt/ros/indigo/lib/libcpp_common.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect"
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/face_detect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
face_detect/CMakeFiles/face_detect.dir/build: /home/corvin/YoYoRobot/ROSCodeProject/devel/lib/face_detect/face_detect
.PHONY : face_detect/CMakeFiles/face_detect.dir/build

face_detect/CMakeFiles/face_detect.dir/requires: face_detect/CMakeFiles/face_detect.dir/src/face_detect.cpp.o.requires
.PHONY : face_detect/CMakeFiles/face_detect.dir/requires

face_detect/CMakeFiles/face_detect.dir/clean:
	cd /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect && $(CMAKE_COMMAND) -P CMakeFiles/face_detect.dir/cmake_clean.cmake
.PHONY : face_detect/CMakeFiles/face_detect.dir/clean

face_detect/CMakeFiles/face_detect.dir/depend:
	cd /home/corvin/YoYoRobot/ROSCodeProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/corvin/YoYoRobot/ROSCodeProject/src /home/corvin/YoYoRobot/ROSCodeProject/src/face_detect /home/corvin/YoYoRobot/ROSCodeProject/build /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect /home/corvin/YoYoRobot/ROSCodeProject/build/face_detect/CMakeFiles/face_detect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : face_detect/CMakeFiles/face_detect.dir/depend

