#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <unistd.h> // 包含 usleep 函数
#define SERVER_IP "192.168.168.101"
#define SERVER_PORT 9999

struct Data{
    double d[6];
    uint32_t sec;
    uint32_t nsec;
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
// 回调函数，用于处理接收到的 IMU 数据
void imuCallback(const sensor_msgs::Imu::ConstPtr& msg) {
    std::cout << "in\n";
    ds.d[0] = msg->angular_velocity.x;
    ds.d[1] = msg->angular_velocity.y;
    ds.d[2] = msg->angular_velocity.z;
    ds.d[3] = msg->linear_acceleration.x;
    ds.d[4] = msg->linear_acceleration.y;
    ds.d[5] = msg->linear_acceleration.z;
    ros::Time timestamp = msg->header.stamp;
    ds.sec = timestamp.sec;
    ds.nsec = timestamp.nsec;
    US.sendMsg(ds);
    // usleep(10000);
    std::cout << "send successfully\n";
    
}

int main(int argc, char** argv) {
    // 初始化 ROS 节点
    ros::init(argc, argv, "imu_subscriber");

    // 创建节点句柄
    ros::NodeHandle nh;


    // 订阅 IMU 话题
    ros::Subscriber imu_sub = nh.subscribe("/camera/imu", 1, imuCallback);
    
    US.init();

    // 进入 ROS 循环
    // while (ros::ok()) {
        // usleep(2000000);
        ros::spin();
    // }

    return 0;
}
