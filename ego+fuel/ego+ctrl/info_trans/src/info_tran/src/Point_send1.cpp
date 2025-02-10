#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include "info_rev.hpp"
#include "info_send.hpp"

std::vector<unsigned char> info;
bool flag = 0;

struct field
{
    std::string name;
    uint32_t offset;
    uint8_t datatype;
    uint32_t count;

};
int count = 0;

int imcode(std::vector<unsigned char> &info, int &p, uint32_t num, bool dnum, int sam)
{
    if (sam == 0) {    // uint32
        info[p++] = static_cast<unsigned char>((num) & 0xFF);
        info[p++] = static_cast<unsigned char>((num >> 8) & 0xFF);
        info[p++] = static_cast<unsigned char>((num >> 16) & 0xFF);
        info[p++] = static_cast<unsigned char>((num >> 24) & 0xFF);
    } else {           // bool
        info[p++] = dnum;
    }
    return 0;
}infosgs::PointCloud2ConstPtr& msg)
{
    ros::Time timeStamp = msg->header.stamp;
    uint32_t width = msg->width;
    uint32_t height = msg->height;
    bool is_bigendian = msg->is_bigendian;
    uint32_t point_step = msg->point_step;
    uint32_t row_step = msg->row_step;
    bool is_dense = msg->is_dense;
    // const std::vector<signed char>& data = msg->data;
    uint32_t dataLen = msg->data.size();
    uint32_t len = dataLen + 26;
    info.resize(len);
    int pos = 0;
    imcode(info, pos, timeStamp.sec, 0, 0);
    imcode(info, pos, timeStamp.nsec, 0, 0);
    imcode(info, pos, width, 0, 0);
    imcode(info, pos, height, 0, 0);
    imcode(info, pos, 0, is_bigendian, 1);
    imcode(info, pos,point_step, 0, 0);
    imcode(info, pos, row_step, 0, 0);
    imcode(info, pos, 0, is_dense, 1);
    for(; pos < info.size(); pos++) {
        info[pos] = msg->data[pos - 26];
    }
    /* test */
    // if (count == 0) {
    //     for (int i = 0; i < msg->data.size(); i++) {
    //         std::cout << (int)(msg->data[i]) << '\n';
    //     }
    //     count = 1;
    // }
    return 0;

}

void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& msg)
{
    // ROS_INFO("Received PointCloud2 message with points");

    if (flag == 0) {
        getInfo(msg);
        flag = 1;
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "point_cloud_subscriber");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/sdf_map/occupancy_all", 10, pointCloudCallback);

    const char* ip = "192.168.168.51";
    // const char* ip = "127.0.0.1";
    InfoSend IS(ip, 12347);
    InfoRev IR(12348);
    while (IS.init() != 0) {

    }
    IR.init();
    std::vector<unsigned char> reply;
    while (ros::ok()) {
        ros::spinOnce();
        if (flag == 1) {
            IS.sendMsg(info);
            reply = IR.run();
            if (reply.size() != 2 && reply[0] != 'O' && reply[1] != 'K') {
                std::cout << "msg error";
            }
            flag = 0;
        }
    }
    return 0;
}
