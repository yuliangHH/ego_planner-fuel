// tcp_to_ros.cpp

#include "ros/ros.h"
#include "geometry_msgs/PoseStamped.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <sstream>

class TCP2ROS
{
public:
    TCP2ROS()
    {
        int port = 12349;  // 监听端口号

        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd < 0)
        {
            ROS_ERROR("Failed to create socket");
            exit(1);
        }

        server_addr.sin_family = AF_INET;
        server_addr.sin_addr.s_addr = INADDR_ANY;  // 监听所有可用接口
        server_addr.sin_port = htons(port);

        if (bind(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0)
        {
            ROS_ERROR("Failed to bind socket on port %d", port);
            exit(1);
        }
        else
        {
            ROS_INFO("Successfully bound to port %d", port);
        }

        listen(sockfd, 5);
        ROS_INFO("Listening for incoming connections on port %d...", port);

        clientfd = accept(sockfd, (struct sockaddr *)&client_addr, &client_len);

        if (clientfd < 0)
        {
            ROS_ERROR("Failed to accept client connection");
            exit(1);
        }
        else
        {
            char client_ip[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, &(client_addr.sin_addr), client_ip, INET_ADDRSTRLEN);
            ROS_INFO("Successfully accepted connection from client %s:%d", client_ip, ntohs(client_addr.sin_port));
        }

        ros::NodeHandle n;
        pub = n.advertise<geometry_msgs::PoseStamped>("/robot/pose", 10);
    }

    ~TCP2ROS()
    {
        close(clientfd);
        close(sockfd);
    }

    void spin()
    {
        char buffer[1024];
        while (ros::ok())
        {
            int len = recv(clientfd, buffer, sizeof(buffer) - 1, 0);
            if (len > 0)
            {
                buffer[len] = '\0';
                // ROS_INFO("Received PoseStamped: %s", buffer);

                geometry_msgs::PoseStamped pose_stamped;
                if (parsePoseStamped(buffer, pose_stamped))
                {
                    pub.publish(pose_stamped);
                    ROS_INFO("Published PoseStamped to ROS");
                }else{
                    ROS_INFO("Published PoseStamped to ROS Failed");
                }
            }
        }
    }

private:
    int sockfd, clientfd;
    struct sockaddr_in server_addr, client_addr;
    socklen_t client_len = sizeof(client_addr);
    ros::Publisher pub;

    bool parsePoseStamped(const std::string &data, geometry_msgs::PoseStamped &pose_stamped)
    {
        char frame_id[20];
        double timestamp;
        float pos_x, pos_y, pos_z;
        float ori_x, ori_y, ori_z, ori_w;

        // 使用 sscanf 提取数据
        if (sscanf(data.c_str(), "px: %f, py: %f, pz: %f, ox: %f, oy: %f, oz: %f, ow: %f, ", &pos_x, &pos_y, &pos_z, &ori_x, &ori_y, &ori_z, &ori_w) == 7) {
            
            // 填充 PoseStamped 数据
            pose_stamped.pose.position.x = pos_x;
            pose_stamped.pose.position.y = pos_y;
            pose_stamped.pose.position.z = pos_z;
            pose_stamped.pose.orientation.x = ori_x;
            pose_stamped.pose.orientation.y = ori_y;
            pose_stamped.pose.orientation.z = ori_z;
            pose_stamped.pose.orientation.w = ori_w;

            // 设置 ROS 时间戳
            pose_stamped.header.stamp = ros::Time::now();
            pose_stamped.header.frame_id = "world";

            return true;
        } else {
            ROS_WARN("Failed to parse PoseStamped data from: %s", data.c_str());
        }
        return false;
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "tcp_to_ros");
    TCP2ROS tcp2ros;
    tcp2ros.spin();

    return 0;
}
