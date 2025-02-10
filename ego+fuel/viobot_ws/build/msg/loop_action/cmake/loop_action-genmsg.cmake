# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "loop_action: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iloop_action:/home/uav1/viobot_ws/devel/share/loop_action/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(loop_action_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" "actionlib_msgs/GoalID:loop_action/KeyFrameHandleResult:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:loop_action/KeyFrameHandleFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" "actionlib_msgs/GoalID:loop_action/KeyFrameHandleGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" ""
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" ""
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" ""
)

get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_custom_target(_loop_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "loop_action" "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" "actionlib_msgs/GoalID:loop_action/KeyFrameHandleActionFeedback:actionlib_msgs/GoalStatus:loop_action/KeyFrameHandleActionResult:loop_action/KeyFrameHandleGoal:loop_action/KeyFrameHandleActionGoal:std_msgs/Header:loop_action/KeyFrameHandleResult:loop_action/KeyFrameHandleFeedback"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)
_generate_msg_cpp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
)

### Generating Services

### Generating Module File
_generate_module_cpp(loop_action
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(loop_action_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(loop_action_generate_messages loop_action_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_cpp _loop_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(loop_action_gencpp)
add_dependencies(loop_action_gencpp loop_action_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS loop_action_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)
_generate_msg_eus(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
)

### Generating Services

### Generating Module File
_generate_module_eus(loop_action
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(loop_action_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(loop_action_generate_messages loop_action_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_eus _loop_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(loop_action_geneus)
add_dependencies(loop_action_geneus loop_action_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS loop_action_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)
_generate_msg_lisp(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
)

### Generating Services

### Generating Module File
_generate_module_lisp(loop_action
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(loop_action_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(loop_action_generate_messages loop_action_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_lisp _loop_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(loop_action_genlisp)
add_dependencies(loop_action_genlisp loop_action_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS loop_action_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)
_generate_msg_nodejs(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
)

### Generating Services

### Generating Module File
_generate_module_nodejs(loop_action
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(loop_action_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(loop_action_generate_messages loop_action_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_nodejs _loop_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(loop_action_gennodejs)
add_dependencies(loop_action_gennodejs loop_action_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS loop_action_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)
_generate_msg_py(loop_action
  "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg;/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
)

### Generating Services

### Generating Module File
_generate_module_py(loop_action
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(loop_action_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(loop_action_generate_messages loop_action_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleActionGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleFeedback.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleResult.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleGoal.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uav1/viobot_ws/devel/share/loop_action/msg/KeyFrameHandleAction.msg" NAME_WE)
add_dependencies(loop_action_generate_messages_py _loop_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(loop_action_genpy)
add_dependencies(loop_action_genpy loop_action_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS loop_action_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/loop_action
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(loop_action_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/loop_action
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(loop_action_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/loop_action
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(loop_action_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/loop_action
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(loop_action_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/loop_action
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(loop_action_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
