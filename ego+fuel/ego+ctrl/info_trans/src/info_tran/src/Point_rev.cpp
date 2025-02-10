#include <ros/ros.h>
#include <cstring>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include "info_send.hpp"
#include "info_rev.hpp"
#include <vector>

int count = 0;
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
    ros::init(argc, argv, "pointcloud_publisher");
    ros::NodeHandle nh;

    ros::Publisher pointcloud_pub = nh.advertise<sensor_msgs::PointCloud2>("/pointcloud_topic", 10);    
    const char* ip = "127.0.0.1";
    InfoRev IR(12347);
    InfoSend IS(ip, 12348);
    IR.init();
    while (IS.init() != 0) {


    }
    std::cout << "connect successfully\n";
    std::vector<unsigned char> buffer;
    int count = 0;
    std::vector<unsigned char> reply(2);
    reply[0] = 'O';
    reply[1] = 'K';

    sensor_msgs::PointCloud2 output;

    ros::Time timeStamp;
    uint32_t width;
    uint32_t height;
    bool is_bigendian;
    uint32_t point_step;
    uint32_t row_step;
    bool is_dense;

    while (ros::ok()) {
        buffer = IR.run();
        IS.sendMsg(reply);
        timeStamp.sec = (uint32_t)buffer[0] | (((uint32_t)buffer[1]) << 8) | (((uint32_t)buffer[2]) << 16) | (((uint32_t)buffer[3]) << 24);
        timeStamp.nsec = (uint32_t)buffer[4] | (((uint32_t)buffer[5]) << 8) | (((uint32_t)buffer[6]) << 16) | (((uint32_t)buffer[7]) << 24);
        width = (uint32_t)buffer[8] | (((uint32_t)buffer[9]) << 8) | (((uint32_t)buffer[10]) << 16) | (((uint32_t)buffer[11]) << 24);
        height = (uint32_t)buffer[12] | (((uint32_t)buffer[13]) << 8) | (((uint32_t)buffer[14]) << 16) | (((uint32_t)buffer[15]) << 24);
        is_bigendian = buffer[16];
        point_step = (uint32_t)buffer[17] | (((uint32_t)buffer[18]) << 8) | (((uint32_t)buffer[19]) << 16) | (((uint32_t)buffer[20]) << 24);
        row_step = (uint32_t)buffer[21] | (((uint32_t)buffer[22]) << 8) | (((uint32_t)buffer[23]) << 16) | (((uint32_t)buffer[24]) << 24);
        is_dense = buffer[25];
        
        output.header.stamp = timeStamp;
        output.header.frame_id = "world"; // Set the frame id
        output.width = width;
        output.height = height;

        output.fields.resize(3);

        // x field
        output.fields[0].name = "x";
        output.fields[0].offset = 0;
        output.fields[0].datatype = sensor_msgs::PointField::FLOAT32;
        output.fields[0].count = 1;

        // y field
        output.fields[1].name = "y";
        output.fields[1].offset = 4;
        output.fields[1].datatype = sensor_msgs::PointField::FLOAT32;
        output.fields[1].count = 1;

        // z field
        output.fields[2].name = "z";
        output.fields[2].offset = 8;
        output.fields[2].datatype = sensor_msgs::PointField::FLOAT32;
        output.fields[2].count = 1;

        output.is_bigendian = is_bigendian;
        output.point_step = point_step;
        output.row_step = row_step;
        output.is_dense = is_dense;

        uint32_t len = buffer.size();
        output.data.resize(len - 26);
        for (int i = 0; i < output.data.size(); i++) {
            output.data[i] = buffer[i + 26];
        }
        /* test */
        // if (count == 0) {
        //     for (int i = 0; i < output.data.size(); i++) {
        //         std::cout << (int)(output.data[i]) << '\n';
        //     }
        //     count = 1;
        // }
        pointcloud_pub.publish(output);
        std::cout << "pub succeffully\n";

        // 等待下一次循环
        ros::spinOnce();
    }
}