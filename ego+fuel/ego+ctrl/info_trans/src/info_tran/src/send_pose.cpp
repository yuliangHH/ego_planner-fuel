// ros_to_tcp.cpp

#include "ros/ros.h"
#include "geometry_msgs/PoseStamped.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <sstream>

class ROS2TCP
{
public:
    ROS2TCP()
    {
        std::string ip = "192.168.3.9";  // 接收端的 IP 地址
        int port = 12349;  // 端口号

        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd < 0)
        {
            ROS_ERROR("Failed to create socket");
            exit(1);
        }

        server_addr.sin_family = AF_INET;
        server_addr.sin_port = htons(port);
        inet_pton(AF_INET, ip.c_str(), &server_addr.sin_addr);

        if (connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0)
        {
            ROS_ERROR("Connection to server at %s:%d failed", ip.c_str(), port);
            exit(1);
        }
        else
        {
            ROS_INFO("Successfully connected to server at %s:%d", ip.c_str(), port);
        }

        ros::NodeHandle n;
        sub = n.subscribe("/mavros/local_position/pose", 10, &ROS2TCP::poseStampedCallback, this);
    }

    ~ROS2TCP()
    {
        close(sockfd);
    }

    void poseStampedCallback(const geometry_msgs::PoseStamped::ConstPtr &msg)
    {
        std::stringstream ss;
        // ss << "Timestamp: " << msg->header.stamp << ", Frame: " << msg->header.frame_id << ", ";
        ss << "px: " << msg->pose.position.x << ", py: " << msg->pose.position.y << ", pz: " << msg->pose.position.z << ", ";
        ss << "ox: " << msg->pose.orientation.x << ", oy: " << msg->pose.orientation.y << ", oz: " << msg->pose.orientation.z << ", ow: " << msg->pose.orientation.w << ", ";

        std::string pose_str = ss.str();
        send(sockfd, pose_str.c_str(), pose_str.length(), 0);
        ROS_INFO("PoseStamped sent to TCP: %s", pose_str.c_str());
    }

private:
    int sockfd;
    struct sockaddr_in server_addr;
    ros::Subscriber sub;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "ros_to_tcp");
    ROS2TCP ros2tcp;
    ros::spin();

    return 0;
}
