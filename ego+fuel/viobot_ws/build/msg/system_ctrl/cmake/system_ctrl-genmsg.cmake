# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "system_ctrl: 3 messages, 0 services")

set(MSG_I_FLAGS "-Isystem_ctrl:/home/uav1/viobot_ws/src/msg/system_ctrl/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(system_ctrl_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_custom_target(_system_ctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "system_ctrl" "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_custom_target(_system_ctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "system_ctrl" "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_custom_target(_system_ctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "system_ctrl" "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl
)
_generate_msg_cpp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl
)
_generate_msg_cpp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl
)

### Generating Services

### Generating Module File
_generate_module_cpp(system_ctrl
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(system_ctrl_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(system_ctrl_generate_messages system_ctrl_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_cpp _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_cpp _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_cpp _system_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(system_ctrl_gencpp)
add_dependencies(system_ctrl_gencpp system_ctrl_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS system_ctrl_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl
)
_generate_msg_eus(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl
)
_generate_msg_eus(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl
)

### Generating Services

### Generating Module File
_generate_module_eus(system_ctrl
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(system_ctrl_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(system_ctrl_generate_messages system_ctrl_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_eus _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_eus _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_eus _system_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(system_ctrl_geneus)
add_dependencies(system_ctrl_geneus system_ctrl_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS system_ctrl_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl
)
_generate_msg_lisp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl
)
_generate_msg_lisp(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl
)

### Generating Services

### Generating Module File
_generate_module_lisp(system_ctrl
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(system_ctrl_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(system_ctrl_generate_messages system_ctrl_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_lisp _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_lisp _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_lisp _system_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(system_ctrl_genlisp)
add_dependencies(system_ctrl_genlisp system_ctrl_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS system_ctrl_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl
)
_generate_msg_nodejs(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl
)
_generate_msg_nodejs(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl
)

### Generating Services

### Generating Module File
_generate_module_nodejs(system_ctrl
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(system_ctrl_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(system_ctrl_generate_messages system_ctrl_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_nodejs _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_nodejs _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_nodejs _system_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(system_ctrl_gennodejs)
add_dependencies(system_ctrl_gennodejs system_ctrl_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS system_ctrl_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl
)
_generate_msg_py(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl
)
_generate_msg_py(system_ctrl
  "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl
)

### Generating Services

### Generating Module File
_generate_module_py(system_ctrl
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(system_ctrl_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(system_ctrl_generate_messages system_ctrl_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/viobot_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_py _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_ctrl.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_py _system_ctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/src/msg/system_ctrl/msg/algo_status.msg" NAME_WE)
add_dependencies(system_ctrl_generate_messages_py _system_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(system_ctrl_genpy)
add_dependencies(system_ctrl_genpy system_ctrl_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS system_ctrl_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/system_ctrl
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(system_ctrl_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/system_ctrl
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(system_ctrl_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/system_ctrl
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(system_ctrl_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/system_ctrl
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(system_ctrl_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/system_ctrl
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(system_ctrl_generate_messages_py std_msgs_generate_messages_py)
endif()
