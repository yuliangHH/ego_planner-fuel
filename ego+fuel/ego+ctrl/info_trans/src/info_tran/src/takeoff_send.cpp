#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <unistd.h> // 包含 usleep 函数
#define SERVER_IP "192.168.164.85"
#define SERVER_PORT 9999

struct Data{
    bool command;
};

class UDPSend
{
public:
    UDPSend();
    int init();
    int sendMsg(Data &MyStruct);
    ~UDPSend();
private:
    int sockfd;
    struct sockaddr_in server_addr;

    // const char* serverIP;
    // uint16_t port;
};

UDPSend::UDPSend()
{  
}

int UDPSend::init()
{
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(SERVER_PORT);
    if (inet_pton(AF_INET, SERVER_IP, &server_addr.sin_addr) <= 0) {
        perror("inet_pton failed");
        exit(EXIT_FAILURE);
    }
    return 0;
}

int UDPSend::sendMsg(Data &MyStruct)
{
    char buffer[sizeof(MyStruct)];
    memcpy(buffer, &MyStruct, sizeof(MyStruct));

    sendto(sockfd, buffer, sizeof(buffer), 0, (const struct sockaddr *)&server_addr, sizeof(server_addr));
    std::cout << "Data sent successfully." << std::endl;
    return 0;
}

UDPSend::~UDPSend()
{
    close(this->sockfd);
}

UDPSend US;
Data ds;

void timerCallback(const ros::TimerEvent&) {
        std::cout << "in\n";
    ds.command = 1;
    US.sendMsg(ds);
    // usleep(10000);
    std::cout << "send successfully\n";
}


int main(int argc, char** argv) {
    // 初始化 ROS 节点
    ros::init(argc, argv, "imu_subscriber");

    // 创建节点句柄
    ros::NodeHandle nh;

    ros::Timer timer = nh.createTimer(ros::Duration(1.0), timerCallback);

    US.init();

    // 进入 ROS 循环
    // while (ros::ok()) {
        // usleep(2000000);
        ros::spin();
    // }

    return 0;
}
