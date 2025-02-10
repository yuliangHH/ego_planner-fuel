#include <iostream>
#include <cstring>
#include <arpa/inet.h>
#include <unistd.h>
#include <ros/ros.h>
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Vector3.h>

#define SERVER_PORT 9999

// 结构体定义
struct MyStruct{
    double data[6];
    uint32_t sec;
    uint32_t nsec;
};

int main(int argc, char **argv) {
   ros::init(argc, argv, "imu_publisher");

    // 创建节点句柄
    ros::NodeHandle nh;

    // 创建一个ROS里程计发布者
    ros::Publisher imu_pub = nh.advertise<sensor_msgs::Imu>("imu/data", 10);
    // 定义一个ROS里程计消息
    sensor_msgs::Imu imu_msg;
    imu_msg.header.frame_id = "imu_frame";   // 设置坐标系

    // 填充姿态信息（假设没有旋转）
    imu_msg.orientation.x = 0.0;
    imu_msg.orientation.y = 0.0;
    imu_msg.orientation.z = 0.0;
    imu_msg.orientation.w = 1.0;  // 四元数表示单位旋转（无旋转）

    imu_msg.orientation_covariance[0] = -1.0;  // 设置姿态协方差矩阵
    // imu_msg.orientation_covariance[4] = 0.01;
    // imu_msg.orientation_covariance[8] = 0.01;

    imu_msg.angular_velocity_covariance[0] = 0.01;  // 设置角速度协方差矩阵
    imu_msg.angular_velocity_covariance[4] = 0.01;
    imu_msg.angular_velocity_covariance[8] = 0.01;

    imu_msg.linear_acceleration_covariance[0] = 0.01;  // 设置线性加速度协方差矩阵
    imu_msg.linear_acceleration_covariance[4] = 0.01;
    imu_msg.linear_acceleration_covariance[8] = 0.01;


    // 设定消息的帧ID
    // odom_msg.header.frame_id = "odom";add_executable (revtest revtest)
    // odom_msg.child_frame_id = "base_link";
    // 创建UDP套接字
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }

    // 设置服务器地址
    struct sockaddr_in server_addr, client_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    memset(&client_addr, 0, sizeof(client_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(SERVER_PORT);

    // 绑定套接字
    if (bind(sockfd, (const struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // 接收数据
    ros::Rate loop_rate(10); 
    int i = 0;
    while (ros::ok()) {
        std::cout << "Waiting for data..." << std::endl;
        char buffer[sizeof(MyStruct)];
        socklen_t len = sizeof(client_addr);
        int n = recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr *)&client_addr, &len);

        if (n < 0) {
            perror("recvfrom failed");
            exit(EXIT_FAILURE);
        }

        // 将接收到的字节流转换回结构体
        MyStruct received_struct;
        memcpy(&received_struct, buffer, sizeof(MyStruct));

        // 打印接收到的数据
        std::cout << "Received data:\n";
        for (int i = 0; i < 6; ++i) {
            std::cout << received_struct.data[i] << '\n';
        }
        std::cout << received_struct.sec << ' ' << received_struct.nsec << '\n';
        imu_msg.header.seq = i;
        imu_msg.header.stamp = ros::Time::now();
        
        imu_msg.angular_velocity.x = received_struct.data[0];
        imu_msg.angular_velocity.y = received_struct.data[1];
        imu_msg.angular_velocity.z = received_struct.data[2];

        imu_msg.linear_acceleration.x = received_struct.data[3];
        imu_msg.linear_acceleration.y = received_struct.data[4];
        imu_msg.linear_acceleration.z = received_struct.data[5];

        imu_pub.publish(imu_msg);
        ros::spinOnce();
        // loop_rate.sleep();
        i++;
    }

    // 关闭套接字
    close(sockfd);

    return 0;
}
