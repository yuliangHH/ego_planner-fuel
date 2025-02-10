#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <ctime>
#include <gst/gst.h>
#include <gst/app/gstappsink.h>
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <signal.h>
#include <sensor_msgs/CameraInfo.h>

#define Height 424
#define Width 400

// #include "threadpool.hpp"

using namespace cv;
using namespace std;


ros::Time timestamp;
struct time_st{
    uint32_t nec;
    uint32_t snec;
};

time_st t;

bool should_exit = false;
void signalHandler(int signum)
{
    ROS_INFO("Received exit signal. Exiting the while loop.");
    should_exit = true;
}


uint8_t flag = 0;

std::queue<int> socketq;
struct time_st{                                     
    uint32_t nec;
    uint32_t snec;
};
time_st t;
#define SERVER_IP "127.0.0.1"     // 发送方IP

class ImageRev {
public:
    Mat image;
    ImageRev(uint16_t p);
    int init();
    int run();
    ~ImageRev() {
        // 关闭套接字
        std::cout << "detele imagerev successfully\n";
        close(newSocket);
        close(serverSock);
    }
private:
    uint16_t port; 
    int serverSock, newSocket;
    struct sockaddr_in serverAddr;
    struct sockaddr_storage serverStorage;
    socklen_t addr_size;
};

ImageRev::ImageRev(uint16_t p) {
    port = p;
}

int ImageRev::init() 
{
    // 创建 TCP 套接字
    serverSock = socket(AF_INET, SOCK_STREAM, 0);
    socketq.push(serverSock);

    // 设置服务器地址
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(port);
    serverAddr.sin_addr.s_addr = INADDR_ANY;

    // 绑定套接字
    bind(serverSock, (struct sockaddr *) &serverAddr, sizeof(serverAddr));
    // 监听传入的连接
    if (listen(serverSock, 10) == 0) {
        cout << "Listening for incoming connections..." << endl;
    } else {
        cout << "Failed to listen" << endl;
        return -1;
    }
    // 等待客户端连接
    addr_size = sizeof(serverStorage);
    newSocket = accept(serverSock, (struct sockaddr *) &serverStorage, &addr_size);
    socketq.push(newSocket);
    cout << "Client connected" << endl;
    return 0;
}

int ImageRev::run()
{
    uint32_t imgSize;
    int ret = 0;
    vector<uchar> head(16);
    for (int i = 0; i < 16; i++) {
        uchar s;
        ret = recv(newSocket, &s, 1, 0);
        head[i] = s;
    }
   
    std::cout << "rev head successfully\n";
    imgSize = (static_cast<uint16_t>(head[7]) << 24) | (static_cast<uint16_t>(head[6]) << 16) | (static_cast<uint16_t>(head[5]) << 8) | static_cast<uint16_t>(head[4]);
    t.nec = (static_cast<uint16_t>(head[11]) << 24) | (static_cast<uint16_t>(head[10]) << 16) | (static_cast<uint16_t>(head[9]) << 8) | static_cast<uint16_t>(head[8]);
    t.snec = (static_cast<uint16_t>(head[15]) << 24) | (static_cast<uint16_t>(head[14]) << 16) | (static_cast<uint16_t>(head[13]) << 8) | static_cast<uint16_t>(head[12]);
    vector<uchar> buffer(imgSize);
    for (int i = 0; i < imgSize; i++) {
        uchar s;
        // std::cout << "imagerev start\n";
        if (recv(newSocket, &s, 1, 0) <= 0) {
            std::cout << "imagerev in\n";
            while (!socketq.empty()) {
                int sock = socketq.front();
                socketq.pop();
                int i = close(sock);
                cout << i << '\n';
            }
            exit(1);
        }
        buffer[i] = s;
    }
    // 解码图像数据
    try {
        image = imdecode(buffer, IMREAD_GRAYSCALE);
        if (image.empty()) {
            cerr << "Error: Failed to decode image." << endl;
            close(newSocket);
            close(serverSock);
            return 1;
        }
    } catch (cv::Exception& e) {
        cerr << "OpenCV exception: " << e.what() << endl;
        close(newSocket);
        close(serverSock);
        return 1;
    }
    return 0;
}

class AskSend{
public:
    AskSend(const char *IP, uint16_t p);
    int init();
    int askSend(string &ask);
    ~AskSend() {
        std::cout << "detele asksend successfully\n";
        close(this->sock);
    }
private:
    const char* serverIP;
    uint16_t port;
    int sock;
    struct sockaddr_in serverAddr;
};

AskSend::AskSend(const char *IP, uint16_t p) :serverIP(IP) 
{
    port = p;
}

int AskSend::init()
{
    sock = socket(AF_INET, SOCK_STREAM, 0);
    socketq.push(sock);
    if (sock == -1) {
        std::cout << "sock failded\n";
    }
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(port);
    if (inet_pton(AF_INET, serverIP, &serverAddr.sin_addr) <= 0) {
        std::cout << "Error: inet_pton failed.\n";
        return 1;
    }

    if (connect(sock, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) == -1) {
        // std::cout << "Error: Connection failed.\n";
        close(sock);
        return 1;
    }
    std::cout << "Connect successfully\n";
    return 0;
}

int AskSend::askSend(string &ask)
{
    vector<uchar> buffer(ask.size());
    for (int i = 0; i < ask.size(); i++) {
        buffer[i] = ask[i];
    }
    if (send(sock, buffer.data(), buffer.size(), 0) < 0) {
        std::cout << "Error: Failed to send image data.\n";
         while (!socketq.empty()) {
            int sock = socketq.front();
            socketq.pop();
            int i = close(sock);
            cout << i << '\n';
        }
        exit(0);
    }
    return 0;
}



int main(int argc, char **argv) {
    ros::init(argc, argv, "image_publisher");
    ros::NodeHandle nh;
    ros::Publisher image_pub_left = nh.advertise<sensor_msgs::Image>("/camera/color/image_left", 10);
    ros::Publisher image_pub_right = nh.advertise<sensor_msgs::Image>("/camera/color/image_right", 10);
    ros::Publisher info_pub_left = nh.advertise<sensor_msgs::CameraInfo>("/camera/color/camera_info_left", 10);
    ros::Publisher info_pub_right = nh.advertise<sensor_msgs::CameraInfo>("/camera/color/camera_info_right", 10);
    sensor_msgs::CameraInfo msg_left;
    msg_left.header.frame_id = "camera_color_optical_frame_left";
    msg_left.height = 480;
    msg_left.width = 640;
    msg_left.distortion_model = "plumb_bob";
    msg_left.D = {-0.03779914893886373, 0.05546950063789187, -0.012819767132557822, -0.03628447875708958};
    msg_left.K = {573.0174253017995, 0.0, 314.5910840863157, 0.0, 573.5133136815856, 205.82437077598747, 0.0, 0.0, 1.0};
    msg_left.R = {1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0};
    msg_left.P = {573.0174253017995, 0.0, 314.5910840863157, 0.0, 0.0, 573.5133136815856, 205.82437077598747, 0.0, 0.0, 0.0, 1.0, 0.0};
    msg_left.binning_x = 0;
    msg_left.binning_y = 0;
    msg_left.roi.x_offset = 0;
    msg_left.roi.y_offset = 0;
    msg_left.roi.height = 0;
    msg_left.roi.width = 0;
    msg_left.roi.do_rectify = false;

    sensor_msgs::CameraInfo msg_right;
    msg_right.header.frame_id = "camera_color_optical_frame_right";
    msg_right.height = 480;
    msg_right.width = 640;
    msg_right.distortion_model = "plumb_bob";
    msg_right.D = {-0.03634641163886052, 0.10049735628860443, -0.1462257190159955, 0.02954221408815644};
    msg_right.K = {566.7199132371355, 0.0, 321.1093720306264, 0.0, 566.7707989303709, 206.99489498455774, 0.0, 0.0, 1.0};
    msg_right.R = {1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0};
    msg_right.P = {566.7199132371355, 0.0, 321.10937203062645, 0.0, 0.0, 566.7707989303709, 206.99489498455774, 0.0, 0.0, 0.0, 1.0, 0.0};
    msg_right.binning_x = 0;
    msg_right.binning_y = 0;
    msg_right.roi.x_offset = 0;
    msg_right.roi.y_offset = 0;
    msg_right.roi.height = 0;
    msg_right.roi.width = 0;
    msg_right.roi.do_rectify = false;
    {
        ImageRev imgrev1(8881);
        ImageRev imgrev2(8882);
        ImageRev imgrev3(8883);
        ImageRev imgrev4(8884);
        ImageRev imgrev5(8885);
        ImageRev imgrev6(8886);
        ImageRev imgrev7(8887);
        ImageRev imgrev8(8888);

        if (imgrev1.init() != 0) {
            std::cout << "imgrev1 failed\n";
            return 1;
        } else {
            std::cout << "imgrev1 successfully\n";
        }

        if (imgrev2.init() != 0) {
            std::cout << "imgrev2 failed\n";
            return 1;
        } else {
            std::cout << "imgrev2 successfully\n";
        }

        if (imgrev3.init() != 0) {
            std::cout << "imgrev3 failed\n";
            return 1;
        } else {
            std::cout << "imgrev3 successfully\n";
        }

        if (imgrev4.init() != 0) {
            std::cout << "imgrev4 failed\n";
            return 1;
        } else {
            std::cout << "imgrev4 successfully\n";
        }

        if (imgrev5.init() != 0) {
            std::cout << "imgrev5 failed\n";
            return 1;
        } else {
            std::cout << "imgrev5 successfully\n";
        }

        if (imgrev6.init() != 0) {
            std::cout << "imgrev6 failed\n";
            return 1;
        } else {
            std::cout << "imgrev6 successfully\n";
        }

        if (imgrev7.init() != 0) {
            std::cout << "imgrev7 failed\n";
            return 1;
        } else {
            std::cout << "imgrev7 successfully\n";
        }

        if (imgrev8.init() != 0) {
            std::cout << "imgrev8 failed\n";
            return 1;
        } else {
            std::cout << "imgrev48 successfully\n";
        }
        std::cout << "d1\n";
        usleep(2000000);
        AskSend asksend1(SERVER_IP, 9991);
        AskSend asksend2(SERVER_IP, 9992);
        AskSend asksend3(SERVER_IP, 9993);
        AskSend asksend4(SERVER_IP, 9994);
        AskSend asksend5(SERVER_IP, 9995);
        AskSend asksend6(SERVER_IP, 9996);
        AskSend asksend7(SERVER_IP, 9997);
        AskSend asksend8(SERVER_IP, 9998);
        std::cout << "successfully\n";

        while (asksend1.init() != 0) {

    if (imgrev8.init() != 0) {
        std::cout << "imgrev8 failed\n";
        return 1;
    } else {
        std::cout << "imgrev48 successfully\n";
    }
    std::cout << "d1\n";
    usleep(2000000);
    AskSend asksend1(SERVER_IP, 9991);
    AskSend asksend2(SERVER_IP, 9992);
    AskSend asksend3(SERVER_IP, 9993);
    AskSend asksend4(SERVER_IP, 9994);
    AskSend asksend5(SERVER_IP, 9995);
    AskSend asksend6(SERVER_IP, 9996);
    AskSend asksend7(SERVER_IP, 9997);
    AskSend asksend8(SERVER_IP, 9998);
    std::cout << "successfully\n";
    while (asksend1.init() != 0) {
        // std::cout << "asksend1 failed\n";
        // return 1;
    }
    std::cout << "asksend1 successfully\n";
    // usleep(1000000);
    while (asksend2.init() != 0) {
        // std::cout << "asksend2 failed\n";
        // return 1;
    }
    std::cout << "asksend2 successfully\n";
    // usleep(1000000);
    while (asksend3.init() != 0) {
        // std::cout << "asksend3 failed\n";
        // return 1;
    }
    std::cout << "asksend3 successfully\n";
    // usleep(1000000);
    while (asksend4.init() != 0) {
        // std::cout << "asksend4 failed\n";
        // return 1;
    }
    std::cout << "asksend4 successfully\n";
    // usleep(1000000);
    while (asksend5.init() != 0) {
        // std::cout << "asksend5 failed\n";
        // return 1;
    }
    std::cout << "asksend5 successfully\n";
    // usleep(1000000);
    while (asksend6.init() != 0) {
        // std::cout << "asksend6 failed\n";
        // return 1;
    }
    std::cout << "asksend6 successfully\n";
    // usleep(1000000);
    while (asksend7.init() != 0) {
        // std::cout << "asksend7 failed\n";
        // return 1;
    }
    std::cout << "asksend7 successfully\n";
    // usleep(1000000);
    while (asksend8.init() != 0) {
        // std::cout << "asksend8 failed\n";
        // return 1;
    }
    std::cout << "asksend8 successfully\n";

        }
        std::cout << "asksend6 successfully\n";
        // usleep(1000000);
        while (asksend7.init() != 0) {
    
        }
        std::cout << "asksend7 successfully\n";
        // usleep(1000000);
        while (asksend8.init() != 0) {
    
        }
        cv::hconcat(imgrev1.image, imgrev2.image, img1);
        cv::hconcat(imgrev3.image, imgrev4.image, img2);
        cv::hconcat(imgrev5.image, imgrev6.image, img3);
        cv::hconcat(imgrev7.image, imgrev8.image, img4);
        cv::vconcat(img1, img2, img_right);
        cv::vconcat(img3, img4, img_left);

        timestamp.sec = t.nec;
        timestamp.nsec = t.snec;

        cout << "timestamp:" << timestamp.sec << ' ' << timestamp.nsec << '\n';

        ros::Time time_now = timestamp;
        cv_bridge::CvImage cv_image_rgb_left;
        cv_image_rgb_left.image = img_left;
        cv_image_rgb_left.encoding = "mono8";
        sensor_msgs::Image ros_image_rgb_left;
        cv_image_rgb_left.toImageMsg(ros_image_rgb_left);
        ros_image_rgb_left.header.frame_id = "camera_color_optical_frame_left";
        ros_image_rgb_left.header.seq = count;
        ros_image_rgb_left.header.stamp = time_now; 

        cv_bridge::CvImage cv_image_rgb_right;
        cv_image_rgb_right.image = img_right;
        cv_image_rgb_right.encoding = "mono8";
        sensor_msgs::Image ros_image_rgb_right;
        cv_image_rgb_right.toImageMsg(ros_image_rgb_right);
        ros_image_rgb_right.header.frame_id = "camera_color_optical_frame_right";
        ros_image_rgb_right.header.seq = count;
        ros_image_rgb_right.header.stamp = time_now; 

        msg_left.header.seq = count;
        msg_left.header.stamp = time_now;

        msg_right.header.seq = count;
        msg_right.header.stamp = time_now;
        
        image_pub_left.publish(ros_image_rgb_left);
        image_pub_right.publish(ros_image_rgb_right);
        info_pub_left.publish(msg_left);
        info_pub_right.publish(msg_right);


        string s = "OK";
        
        cv::Mat img1;
        cv::Mat img2;
        cv::Mat img3;
        cv::Mat img4;
        cv::Mat img_left;
        cv::Mat img_right;
        // 接收图像大小
        int count = 0;
        time_t timestamp1 = time(nullptr);
        while (ros::ok()) {
            if (imgrev1.run() != 0 ||
                imgrev2.run() != 0 ||
                imgrev3.run() != 0 ||
                imgrev4.run() != 0 ||
                imgrev5.run() != 0 ||
                imgrev6.run() != 0 ||
                imgrev7.run() != 0 ||
                imgrev8.run() != 0 ) {
                std::cout << "error exit\n";
                break;
            }

            if (asksend1.askSend(s) != 0 ||
                asksend2.askSend(s) != 0 ||
                asksend3.askSend(s) != 0 ||
                asksend4.askSend(s) != 0 ||
                asksend5.askSend(s) != 0 ||
                asksend6.askSend(s) != 0 ||
                asksend7.askSend(s) != 0 ||
                asksend8.askSend(s) != 0 ) {
                std::cout << "error1 exit\n";
                break;
            }
            cv::hconcat(imgrev1.image, imgrev2.image, img1);
            cv::hconcat(imgrev3.image, imgrev4.image, img2);
            cv::hconcat(imgrev5.image, imgrev6.image, img3);
            cv::hconcat(imgrev7.image, imgrev8.image, img4);
            cv::vconcat(img1, img2, img_right);
            cv::vconcat(img3, img4, img_left);

            timestamp.sec = t.nec;
            timestamp.nsec = t.snec;

            cout << "timestamp:" << timestamp.sec << ' ' << timestamp.nsec << '\n';

            ros::Time time_now = timestamp;
            cv_bridge::CvImage cv_image_rgb_left;
            cv_image_rgb_left.image = img_left;
            cv_image_rgb_left.encoding = "mono8";
            sensor_msgs::Image ros_image_rgb_left;
            cv_image_rgb_left.toImageMsg(ros_image_rgb_left);
            ros_image_rgb_left.header.frame_id = "camera_color_optical_frame_left";
            ros_image_rgb_left.header.seq = count;
            ros_image_rgb_left.header.stamp = time_now; 

            cv_bridge::CvImage cv_image_rgb_right;
            cv_image_rgb_right.image = img_right;
            cv_image_rgb_right.encoding = "mono8";
            sensor_msgs::Image ros_image_rgb_right;
            cv_image_rgb_right.toImageMsg(ros_image_rgb_right);
            ros_image_rgb_right.header.frame_id = "camera_color_optical_frame_right";
            ros_image_rgb_right.header.seq = count;
            ros_image_rgb_right.header.stamp = time_now; 

            msg_left.header.seq = count;
            msg_left.header.stamp = time_now;

            msg_right.header.seq = count;
            msg_right.header.stamp = time_now;
            
            image_pub_left.publish(ros_image_rgb_left);
            image_pub_right.publish(ros_image_rgb_right);
            info_pub_left.publish(msg_left);
            info_pub_right.publish(msg_right);

            if (cv::waitKey(1) == 27) {
                break;
            }
            count++;
        }
        time_t timestamp2 = time(nullptr);
    }
    return 0;
}
