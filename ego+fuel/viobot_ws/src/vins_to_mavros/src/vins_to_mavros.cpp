#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Range.h>
#include <nav_msgs/Odometry.h>
#include <Eigen/Eigen>
#include <thread>
#include <iostream>

#include <std_msgs/Bool.h>

#include <system_ctrl/algo_ctrl.h>
#include <system_ctrl/algo_status.h>
#include <system_ctrl/viobot_ctrl.h>
Eigen::Vector3d p_mav;
Eigen::Quaterniond q_mav;

geometry_msgs::PoseStamped camera_pose;
sensor_msgs::PointCloud2 pointcloud;

ros::Publisher vision_pub;
ros::Publisher camera_pose_pub;
ros::Publisher cloud_pub;

ros::Publisher pub_stereo2_ctrl;
bool get_vio_pose = false;
double distance = 0;

void vins_callback(const nav_msgs::Odometry::ConstPtr &msg)
{
    if(msg->header.frame_id == "world")
    {
        get_vio_pose = true;
        p_mav = Eigen::Vector3d(msg->pose.pose.position.x, msg->pose.pose.position.y, msg->pose.pose.position.z);
 
        q_mav = Eigen::Quaterniond(msg->pose.pose.orientation.w, msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z);
        Eigen::AngleAxisd roll(M_PI/2,Eigen::Vector3d::UnitX()); // 绕 x 轴旋转 pi / 2
        Eigen::AngleAxisd pitch(0,Eigen::Vector3d::UnitY());
        Eigen::AngleAxisd yaw(M_PI/2,Eigen::Vector3d::UnitZ());
 
        Eigen::Quaterniond _q_mav = roll * pitch * yaw;
        q_mav = q_mav * _q_mav;

        geometry_msgs::PoseStamped vision;
        vision.header.frame_id = "world";
        vision.pose.position.x = p_mav[0];
        vision.pose.position.y = p_mav[1];
        vision.pose.position.z = distance;

        vision.pose.orientation.x = q_mav.x();
        vision.pose.orientation.y = q_mav.y();
        vision.pose.orientation.z = q_mav.z();
        vision.pose.orientation.w = q_mav.w();

        vision.header.stamp = ros::Time::now();
        vision_pub.publish(vision);


        camera_pose.pose.position.x = msg->pose.pose.position.x;
        camera_pose.pose.position.y = msg->pose.pose.position.y;
        camera_pose.pose.position.z = distance;
        camera_pose.pose.orientation.x = msg->pose.pose.orientation.x;
        camera_pose.pose.orientation.y = msg->pose.pose.orientation.y;
        camera_pose.pose.orientation.z = msg->pose.pose.orientation.z;
        camera_pose.pose.orientation.w = msg->pose.pose.orientation.w;
        camera_pose.header.frame_id = "world";
        camera_pose.header.stamp = ros::Time::now();
        camera_pose_pub.publish(camera_pose);
    }
}

// void cloud_callback(const sensor_msgs::PointCloud2ConstPtr &msg) {
//     pointcloud = *msg;
//     pointcloud.header.frame_id = "world";
//     pointcloud.header.stamp = ros::Time::now();
//     cloud_pub.publish(pointcloud);
// }

 void distance_callback(const sensor_msgs::Range::ConstPtr &msg) {
    distance = msg->range;
 }
 
int main(int argc, char **argv)
{
    ros::init(argc, argv, "vins_to_mavros");
    ros::NodeHandle nh("~");
 
    ros::Subscriber slam_sub = nh.subscribe<nav_msgs::Odometry>("/viobot/pr_loop/odometry_rect", 100, vins_callback);
    ros::Subscriber distance_sub = nh.subscribe<sensor_msgs::Range>("/mavros/distance_sensor/hrlv_ez4_pub", 100, distance_callback);
    vision_pub = nh.advertise<geometry_msgs::PoseStamped>("vision_pose", 10);
    camera_pose_pub = nh.advertise<geometry_msgs::PoseStamped>("/viobot/camera_pose", 10);

    // ros::Subscriber cloud_sub = nh.subscribe<sensor_msgs::PointCloud2>("/pr_loop/points_rdf", 100, cloud_callback);
    // cloud_pub = nh.advertise<sensor_msgs::PointCloud2>("/viobot/points_cloud_rdf", 10);
 
    pub_stereo2_ctrl = nh.advertise<system_ctrl::algo_ctrl>("/viobot/stereo2_ctrl", 2);
    system_ctrl::algo_ctrl algo_set;
    algo_set.algo_enable = true;
    algo_set.algo_reboot = false;
    algo_set.algo_reset = true;
    int i=10;
    while(i>0)
    {
        i--;
        pub_stereo2_ctrl.publish(algo_set);
        ros::Rate rate(10);
        rate.sleep();
    }
    // the setpoint publishing rate MUST be faster than 2Hz
    // ros::Rate rate(20.0);
    ROS_INFO("start ================= ");

    ros::spin();
 
    // ros::Time last_request = ros::Time::now();
 
    // while(ros::ok()) {
    //     if (get_vio_pose) {
    //         geometry_msgs::PoseStamped vision;
    //         vision.header.frame_id = "world";
    //         vision.pose.position.x = p_mav[0];
    //         vision.pose.position.y = p_mav[1];
    //         vision.pose.position.z = p_mav[2];
    
    //         vision.pose.orientation.x = q_mav.x();
    //         vision.pose.orientation.y = q_mav.y();
    //         vision.pose.orientation.z = q_mav.z();
    //         vision.pose.orientation.w = q_mav.w();
    
    //         vision.header.stamp = ros::Time::now();
    //         vision_pub.publish(vision);

            

            

 
    //     ROS_INFO("\nposition:\n   x: %.18f\n   y: %.18f\n   z: %.18f\norientation:\n   x: %.18f\n   y: %.18f\n   z: %.18f\n   w: %.18f", \
    //     p_mav[0],p_mav[1],p_mav[2],q_mav.x(),q_mav.y(),q_mav.z(),q_mav.w());
    //     }
    //     else {
    //         ROS_INFO("waiting for vio");
    //     }
 
    //     ros::spinOnce();
    //     rate.sleep();
    // }
 
    return 0;
}


