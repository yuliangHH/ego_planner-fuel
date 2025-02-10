#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <cstring>
#include "info_send.hpp"
#include "info_rev.hpp"
#include <vector>


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
int main(int argc, char** argv)
{
    ros::init(argc, argv, "occupancy_grid_publisher");
    ros::NodeHandle nh;

    ros::Publisher map_pub = nh.advertise<nav_msgs::OccupancyGrid>("map", 1);
    const char* ip = "127.0.0.1";
    InfoRev IR(12345);
    InfoSend IS(ip, 12346);
    IR.init();
    while (IS.init() != 0) {


    }
    std::cout << "connect successfully\n";
    std::vector<unsigned char> buffer;
    int count = 0;
    std::vector<unsigned char> reply(2);
    reply[0] = 'O';
    reply[1] = 'K';

    ros::Time timeStamp;
    ros::Time mapLoadTime;
    uint32_t width;
    uint32_t height;
    double resolution;
    double x;
    double y;
    double z;
    double xx;
    double yy;
    double zz;
    double w;

    while (1) {
        buffer = IR.run();
        IS.sendMsg(reply);
        timeStamp.sec = (uint32_t)buffer[0] | (((uint32_t)buffer[1]) << 8) | (((uint32_t)buffer[2]) << 16) | (((uint32_t)buffer[3]) << 24);
        timeStamp.nsec = (uint32_t)buffer[4] | (((uint32_t)buffer[5]) << 8) | (((uint32_t)buffer[6]) << 16) | (((uint32_t)buffer[7]) << 24);
        mapLoadTime.sec = (uint32_t)buffer[8] | (((uint32_t)buffer[9]) << 8) | (((uint32_t)buffer[10]) << 16) | (((uint32_t)buffer[11]) << 24);
        mapLoadTime.nsec = (uint32_t)buffer[12] | (((uint32_t)buffer[13]) << 8) | (((uint32_t)buffer[14]) << 16) | (((uint32_t)buffer[15]) << 24);
        width = (uint32_t)buffer[16] | (((uint32_t)buffer[17]) << 8) | (((uint32_t)buffer[18]) << 16) | (((uint32_t)buffer[19]) << 24);
        height = (uint32_t)buffer[20] | (((uint32_t)buffer[21]) << 8) | (((uint32_t)buffer[22]) << 16) | (((uint32_t)buffer[23]) << 24);
        // std::cout << width << ' ' << height << '\n';
        resolution = decode(buffer, 24);
        x = decode(buffer, 32);
        y = decode(buffer, 40);
        z = decode(buffer, 48);
        xx = decode(buffer, 56);
        yy = decode(buffer, 64);
        zz = decode(buffer, 72);
        w = decode(buffer, 80);
        nav_msgs::OccupancyGrid msg; 
        msg.header.stamp = timeStamp;
        msg.info.map_load_time = mapLoadTime;
        msg.info.width = width;
        msg.info.height = height;
        msg.info.resolution = resolution;
        msg.info.origin.position.x = x;
        msg.info.origin.position.y = y;
        msg.info.origin.position.z = z;
        msg.info.origin.orientation.x = xx;
        msg.info.origin.orientation.y = yy;
        msg.info.origin.orientation.z = zz;
        msg.info.origin.orientation.w = w;
        msg.data.resize(width * height);
        for (int i = 0; i < msg.data.size(); i++) {
            msg.data[i] = buffer[i + 88];
        }
        count++;
        map_pub.publish(msg);

        // 等待下一次循环
        ros::spinOnce();
    }
}