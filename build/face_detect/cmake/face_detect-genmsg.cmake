# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "face_detect: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iface_detect:/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(face_detect_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_custom_target(_face_detect_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detect" "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" ""
)

get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_custom_target(_face_detect_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detect" "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" "face_detect/facebox"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detect
)
_generate_msg_cpp(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg"
  "${MSG_I_FLAGS}"
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detect
)

### Generating Services

### Generating Module File
_generate_module_cpp(face_detect
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detect
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(face_detect_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(face_detect_generate_messages face_detect_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_cpp _face_detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_cpp _face_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detect_gencpp)
add_dependencies(face_detect_gencpp face_detect_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detect_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/face_detect
)
_generate_msg_eus(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg"
  "${MSG_I_FLAGS}"
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/face_detect
)

### Generating Services

### Generating Module File
_generate_module_eus(face_detect
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/face_detect
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(face_detect_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(face_detect_generate_messages face_detect_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_eus _face_detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_eus _face_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detect_geneus)
add_dependencies(face_detect_geneus face_detect_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detect_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detect
)
_generate_msg_lisp(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg"
  "${MSG_I_FLAGS}"
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detect
)

### Generating Services

### Generating Module File
_generate_module_lisp(face_detect
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detect
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(face_detect_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(face_detect_generate_messages face_detect_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_lisp _face_detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_lisp _face_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detect_genlisp)
add_dependencies(face_detect_genlisp face_detect_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detect_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/face_detect
)
_generate_msg_nodejs(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg"
  "${MSG_I_FLAGS}"
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/face_detect
)

### Generating Services

### Generating Module File
_generate_module_nodejs(face_detect
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/face_detect
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(face_detect_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(face_detect_generate_messages face_detect_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_nodejs _face_detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_nodejs _face_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detect_gennodejs)
add_dependencies(face_detect_gennodejs face_detect_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detect_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect
)
_generate_msg_py(face_detect
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg"
  "${MSG_I_FLAGS}"
  "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect
)

### Generating Services

### Generating Module File
_generate_module_py(face_detect
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(face_detect_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(face_detect_generate_messages face_detect_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/facebox.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_py _face_detect_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/YoYoRobot/YoYoRobot/src/face_detect/msg/faces.msg" NAME_WE)
add_dependencies(face_detect_generate_messages_py _face_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detect_genpy)
add_dependencies(face_detect_genpy face_detect_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detect_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detect
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(face_detect_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(face_detect_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/face_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/face_detect
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(face_detect_generate_messages_eus std_msgs_generate_messages_eus)
add_dependencies(face_detect_generate_messages_eus geometry_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detect
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(face_detect_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(face_detect_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/face_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/face_detect
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
add_dependencies(face_detect_generate_messages_nodejs std_msgs_generate_messages_nodejs)
add_dependencies(face_detect_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detect
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(face_detect_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(face_detect_generate_messages_py geometry_msgs_generate_messages_py)
