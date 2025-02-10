#! /bin/sh
sleep 2
user_name=uav1
ros_version=melodic
code_path=viobot_ws
cd /home/${user_name}/${code_path}

rosclean purge -y

source /opt/ros/${ros_version}/setup.bash
source /home/${user_name}/${code_path}/devel/setup.bash

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/${user_name}/${code_path}/
export ROS_HOME=/home/${user_name}/${code_path}/logfiles

# enable serial ports
sudo chmod 777 /dev/px4_01
sudo chmod 777 /dev/ttyUSB0
sudo chmod 777 /dev/ttyACM0

echo "The system is booting..."

# 1. mavros
gnome-terminal -t "mavros" -x bash -c "sudo chmod 777 /dev/ttyACM0; roslaunch mavros px4.launch; exec bash -i"
sleep 10
echo "mavros ready."

##reboot
gnome-terminal -t "reboot" -x bash -c "source /home/${user_name}/${code_path}/devel/setup.bash; rostopic pub -1 /stereo2_ctrl system_ctrl/algo_ctrl '{header: {seq: 0, stamp: {secs: 0, nsecs: 0}, frame_id: ''}, algo_enable: true, algo_reboot: true, algo_reset: false}'; exec bash -i"
sleep 4
echo "viobot ready."


# 2. uav_vio
gnome-terminal -t "uav_vio" -x bash -c "source /home/${user_name}/${code_path}/devel/setup.bash; roslaunch vins_to_mavros vins_to_mavros.launch; exec bash -i"
sleep 5
echo "uav_vio ready."

# 3. depth_camera
gnome-terminal -t "uav_vio" -x bash -c "source /home/${user_name}/fuel_ws/devel/setup.bash; roslaunch realsense2_camera rs_camera_d435i.launch; exec bash -i"
sleep 5
echo "uav_vio ready."

# dat_file=$(date +"%y%m%d_%H%M%S")
# mkdir -p /home/${user_name}/${code_path}/log/${dat_file}
# log_path=/home/${user_name}/${code_path}/log/${dat_file}

# nohup rostopic echo -p /mavros/local_position/pose                   >${log_path}/own_local_pose.txt 2>&1 &
# nohup rostopic echo -p /mavros/local_position/velocity_local         >${log_path}/own_local_vel.txt 2>&1 &
# nohup rostopic echo -p /mavros/imu/data                  >${log_path}/own_imu_data.txt 2>&1 &
# nohup rostopic echo -p /mavros/imu/data_raw         >${log_path}/own_imu_data_raw.txt 2>&1 &
# nohup rostopic echo -p /tag_detections         >${log_path}/own_tag_detections.txt 2>&1 &

echo "System is started."
