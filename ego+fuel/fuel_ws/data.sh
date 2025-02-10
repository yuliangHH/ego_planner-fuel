#!/bin/bash

# 启动传输地图
#gnome-terminal -t "send_map" -x bash -c "cd ~/ego+ctrl/send_map && source devel/setup.bash &&  rosrun info_send Point_send; exec bash -i"
sleep 1

# 启动传输位置
#gnome-terminal -t "send_pose" -x bash -c "cd ~/ego+ctrl/info_trans && source devel/setup.bash &&  rosrun info_send send_pose; exec bash -i"
sleep 1

# 启动传输起飞命令
#gnome-terminal -t "takeoff_rev" -x bash -c "cd ~/ego+ctrl/info_trans && source devel/setup.bash &&  rosrun info_send takeoff_rev; exec bash -i"
sleep 1

# 启动传输视频
gnome-terminal -t "img_raw_send" -x bash -c "cd ~/ego+ctrl/info_trans && source devel/setup.bash &&  rosrun info_send img_raw_send; exec bash -i"
sleep 1

