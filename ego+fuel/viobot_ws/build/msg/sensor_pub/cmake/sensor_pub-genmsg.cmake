# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sensor_pub: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isensor_pub:/home/uav1/viobot_ws/src/msg/sensor_pub/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sensor_pub_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_custom_target(_sensor_pub_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_pub" "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sensor_pub
  "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_pub
)

### Generating Services

### Generating Module File
_generate_module_cpp(sensor_pub
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_pub
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sensor_pub_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sensor_pub_generate_messages sensor_pub_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_dependencies(sensor_pub_generate_messages_cpp _sensor_pub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_pub_gencpp)
add_dependencies(sensor_pub_gencpp sensor_pub_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_pub_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sensor_pub
  "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_pub
)

### Generating Services

### Generating Module File
_generate_module_eus(sensor_pub
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_pub
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sensor_pub_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sensor_pub_generate_messages sensor_pub_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_dependencies(sensor_pub_generate_messages_eus _sensor_pub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_pub_geneus)
add_dependencies(sensor_pub_geneus sensor_pub_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_pub_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sensor_pub
  "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_pub
)

### Generating Services

### Generating Module File
_generate_module_lisp(sensor_pub
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_pub
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sensor_pub_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sensor_pub_generate_messages sensor_pub_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_dependencies(sensor_pub_generate_messages_lisp _sensor_pub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_pub_genlisp)
add_dependencies(sensor_pub_genlisp sensor_pub_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_pub_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sensor_pub
  "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_pub
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sensor_pub
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_pub
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sensor_pub_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sensor_pub_generate_messages sensor_pub_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_dependencies(sensor_pub_generate_messages_nodejs _sensor_pub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_pub_gennodejs)
add_dependencies(sensor_pub_gennodejs sensor_pub_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_pub_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sensor_pub
  "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_pub
)

### Generating Services

### Generating Module File
_generate_module_py(sensor_pub
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_pub
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sensor_pub_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sensor_pub_generate_messages sensor_pub_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/sensor_pub/msg/ImageInfo.msg" NAME_WE)
add_dependencies(sensor_pub_generate_messages_py _sensor_pub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_pub_genpy)
add_dependencies(sensor_pub_genpy sensor_pub_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_pub_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_pub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_pub
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sensor_pub_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_pub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_pub
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sensor_pub_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_pub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_pub
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sensor_pub_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_pub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_pub
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sensor_pub_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_pub)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_pub\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_pub
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sensor_pub_generate_messages_py std_msgs_generate_messages_py)
endif()
