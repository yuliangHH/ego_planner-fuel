#!/bin/bash


# 启动探索管理器
gnome-terminal -t "exploration_test" -x bash -c "cd ~/fuel_ws && source devel/setup.bash && roslaunch exploration_manager exploration_test.launch; exec bash -i"
sleep 3

# 启动 RViz
gnome-terminal -t "exploration_manager rviz" -x bash -c "cd ~/fuel_ws && source devel/setup.bash && roslaunch exploration_manager rviz.launch; exec bash -i"
sleep 3

# 启动快速无人机规划
gnome-terminal -t "single_run_in_exp" -x bash -c "cd ~/ego+ctrl/ego_planner/Fast-Drone-250 && source devel/setup.bash && roslaunch ego_planner single_run_in_exp.launch; exec bash -i"
sleep 3

# 启动 RViz 规划
gnome-terminal -t "ego_planner rviz" -x bash -c "cd ~/ego+ctrl/ego_planner/Fast-Drone-250 && source devel/setup.bash && roslaunch ego_planner rviz.launch; exec bash -i"
sleep 3

# 启动控制节点
gnome-terminal -t "cxr_egoctrl_v1" -x bash -c "cd ~/ego+ctrl/ctrl_rgo_ws/cxr_ego_ctrl && source devel/setup.bash &&  roslaunch cxr_egoctrl_v1 ego_ctrl.launch; exec bash -i"
#gnome-terminal -t "cxr_egoctrl_v1" -x bash -c "cd ~/ego+ctrl/ctrl_rgo_ws/cxr_ego_ctrl && source devel/setup.bash &&  rosrun cxr_egoctrl_v1 cxr_egoctrl_v1; exec bash -i"
sleep 3

#录制rosbag

#gnome-terminal -t "record_rosbag" -x bash -c "cd ~/bag && rosbag record /sdf_map/occupancy_all /sdf_map/occupancy_local /mavros/local_position/pose /mavros/local_position/odom /camera/color/image_raw/compressed /viobot/stereo2/#feature_img; exec bash -i"

gnome-terminal -t "record_rosbag" -x bash -c "cd ~/bag && rosbag record /sdf_map/occupancy_all /mavros/setpoint_raw/local /mavros/local_position/pose /mavros/local_position/odom /viobot/stereo2/feature_img /camera/depth/image_rect_raw; exec bash -i"


#>> ~/bag/output.txt 2>&1
