#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <vector>
#include <cstring>
#include "info_send.hpp"
#include "info_rev.hpp"
// 回调函数

std::vector<unsigned char> mapInfo;
bool flag = 0;
int count = 0;
int imcode(std::vector<unsigned char> &map, int &p, uint32_t num, double dnum, int sam)
{
    if (sam == 0) {    // uint32
        map[p++] = static_cast<unsigned char>((num) & 0xFF);
        map[p++] = static_cast<unsigned char>((num >> 8) & 0xFF);
        map[p++] = static_cast<unsigned char>((num >> 16) & 0xFF);
        map[p++] = static_cast<unsigned char>((num >> 24) & 0xFF);
    } else {           // double
        unsigned char buffer[sizeof(double)];
        memcpy(buffer, &dnum, sizeof(double));
        for (int i = 0; i < 8; i++) {
            map[p++] = buffer[i];
        }
    }
    return 0;
}
int getInfo(const nav_msgs::OccupancyGrid::ConstPtr& msg)
{
    ros::Time timeStamp = msg->header.stamp;
    ros::Time mapLoadTime = msg->info.map_load_time;
    uint32_t width = msg->info.width;
    uint32_t height = msg->info.height;
    double resolution = msg->info.resolution;
    double x = msg->info.origin.position.x;
    double y = msg->info.origin.position.y;
    double z = msg->info.origin.position.z;
    double xx = msg->info.origin.orientation.x;
    double yy = msg->info.origin.orientation.y;
    double zz = msg->info.origin.orientation.z;
    double w = msg->info.origin.orientation.w;
    const std::vector<int8_t>& data = msg->data;
    int len = data.size();
    mapInfo.resize(len + 88);
    int pos = 0;
    imcode(mapInfo, pos, timeStamp.sec, 0, 0);
    imcode(mapInfo, pos, timeStamp.nsec, 0, 0);
    imcode(mapInfo, pos, mapLoadTime.sec, 0, 0);
    imcode(mapInfo, pos, mapLoadTime.nsec, 0, 0);
    imcode(mapInfo, pos, width, 0, 0);
    imcode(mapInfo, pos, height, 0, 0);
    imcode(mapInfo, pos, 0, resolution, 1);
    imcode(mapInfo, pos, 0, x, 1);
    imcode(mapInfo, pos, 0, y, 1);
    imcode(mapInfo, pos, 0, z, 1);
    imcode(mapInfo, pos, 0, xx, 1);
    imcode(mapInfo, pos, 0, yy, 1);
    imcode(mapInfo, pos, 0, zz, 1);
    imcode(mapInfo, pos, 0, w, 1);
    // std::cout << pos << '\n';
    for (; pos < mapInfo.size(); pos++) {
        mapInfo[pos] = data[pos - 88];
    }
    // for (int i = 0; i < 88; i++) std::cout << mapInfo[i] << ' ';
    // std::cout << '\n';
    // std::cout << width <<  ' ' << height << '\n';
    // std::cout << x << ' ' << y << ' ' << z << '\n';
    // std::cout << xx << ' ' << yy << ' ' << zz << ' ' << w << '\n';
    // std::cout << resolution << '\n';
    // std::cout << "successfully\n";
    // if (count == 0) {
    //     for (int i = 0; i < mapInfo.size(); i++) {
    //         std::cout << mapInfo[i] << '\n';
    //     }
    //     count = 1;
    // }
    return 0;

}

void occupancyGridCallback(const nav_msgs::OccupancyGrid::ConstPtr& msg) {
    // std::cout << "in\n";
    if (flag == 0) {
        // ROS_INFO("Received an OccupancyGrid message");
        getInfo(msg);
        flag = 1;
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "occupancy_grid_subscriber"); // 初始化ROS节点
    ros::NodeHandle nh; // 创建节点句柄

    // 订阅 "occupancy_grid" 话题
    ros::Subscriber sub = nh.subscribe("/occupancy_grid", 10, occupancyGridCallback);
    const char* ip = "192.168.3.9";
    InfoSend IS(ip, 12345);
    InfoRev IR(12346);
    while (IS.init() != 0) {

    }
    IR.init();
    std::cout << "connect successfully\n";

    std::vector<unsigned char> reply;
    while (ros::ok()) {
        ros::spinOnce();
        // std::cout << "flag: " << flag << '\n';
        if (flag == 1) {
            // std::cout << "send\n";
            // std::cout << mapInfo.size() << '\n';
            IS.sendMsg(mapInfo);
            reply = IR.run();
            if (reply.size() != 2 && reply[0] != 'O' && reply[1] != 'K') {
                std::cout << "msg error";
            }
            flag = 0;

        }
    }
    return 0;
}
