#include <ros/ros.h>
#include <geometry_msgs/Pose.h>
#include "info_rev_udp.hpp"

double decode(std::vector<unsigned char> &buffer, int pos)
{
    unsigned char bytes[8];
    double dnum;
    for (int i = pos; i < pos + 8; i++) {
        bytes[i - pos] = buffer[i];
    }
    memcpy(&dnum, bytes, sizeof(double));
    return dnum;
}

int main(int argc, char** argv) {
    // 初始化ROS节点
    ros::init(argc, argv, "pose_publisher");
    ros::NodeHandle n;

    // 创建一个Publisher，发布到"/pose"话
    ros::Publisher pose_pub = n.advertise<geometry_msgs::Pose>("/pose", 10);
    // ros::Rate loop_rate(10); // 10Hz

    UDPRev UR(22233);
    UR.init();
    std::vector<unsigned char> res;
    geometry_msgs::Pose pose_msg;

    while (ros::ok()) {
        res = UR.run();

        // 设置位姿信息
        pose_msg.position.x = decode(res, 0);
        pose_msg.position.y = decode(res, 8);
        pose_msg.position.z = decode(res, 16);
        pose_msg.orientation.x = decode(res, 24);
        pose_msg.orientation.y = decode(res, 32);
        pose_msg.orientation.z = decode(res, 40);
        pose_msg.orientation.w = decode(res, 48);
        // pose_msg.header.stamp = ros::Time::now();
        // pose_msg.header.frame_id = "base_link"; // 可以根据实际情况修改

        // 发布消息
        pose_pub.publish(pose_msg);
        ROS_INFO("Published Pose: [%f, %f, %f]", pose_msg.position.x, pose_msg.position.y, pose_msg.position.z);

        ros::spinOnce();
        // loop_rate.sleep();
    }

    return 0;
}
