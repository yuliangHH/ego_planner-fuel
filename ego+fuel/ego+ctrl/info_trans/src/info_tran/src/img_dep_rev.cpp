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


using namespace cv;
using namespace std;

ros::Time timestamp;         // 发送图片时间戳

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
   
    // std::cout << "rev head successfully\n";
    imgSize = (static_cast<uint16_t>(head[7]) << 24) | (static_cast<uint16_t>(head[6]) << 16) | (static_cast<uint16_t>(head[5]) << 8) | static_cast<uint16_t>(head[4]);
    t.nec = (static_cast<uint16_t>(head[11]) << 24) | (static_cast<uint16_t>(head[10]) << 16) | (static_cast<uint16_t>(head[9]) << 8) | static_cast<uint16_t>(head[8]);
    t.snec = (static_cast<uint16_t>(head[15]) << 24) | (static_cast<uint16_t>(head[14]) << 16) | (static_cast<uint16_t>(head[13]) << 8) | static_cast<uint16_t>(head[12]);
    // std::cout << "dddd\n";
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
        image = imdecode(buffer, IMREAD_UNCHANGED);
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
    ros::init(argc, argv, "image_publisher_dep");
    ros::NodeHandle nh;
    ros::Publisher image_pub_right = nh.advertise<sensor_msgs::Image>("/camera/depth/image", 10);

    {
        ImageRev imgrev1(8885);
        ImageRev imgrev2(8886);
        ImageRev imgrev3(8887);
        ImageRev imgrev4(8888);


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

        std::cout << "d1\n";
        usleep(2000000);
        AskSend asksend1(SERVER_IP, 9995);
        AskSend asksend2(SERVER_IP, 9996);
        AskSend asksend3(SERVER_IP, 9997);
        AskSend asksend4(SERVER_IP, 9998);
        std::cout << "successfully\n";

        while (asksend1.init() != 0) {

        }
        std::cout << "asksend1 successfully\n";
        // usleep(1000000);
        while (asksend2.init() != 0) {

        }
        std::cout << "asksend2 successfully\n";
        // usleep(1000000);
        while (asksend3.init() != 0) {

        }
        std::cout << "asksend3 successfully\n";
        // usleep(1000000);
        while (asksend4.init() != 0) {

        }
        std::cout << "asksend4 successfully\n";

        string s = "OK";
        
        cv::Mat img1;
        cv::Mat img2;
        cv::Mat img3;
        cv::Mat img4;
        cv::Mat img;
        // 接收图像大小
        int count = 0;
        time_t timestamp1 = time(nullptr);
        while (ros::ok()) {
            if (imgrev1.run() != 0 ||
                imgrev2.run() != 0 ||
                imgrev3.run() != 0 ||
                imgrev4.run() != 0
                ) {
                std::cout << "error exit\n";
                break;
            }

            if (asksend1.askSend(s) != 0 ||
                asksend2.askSend(s) != 0 ||
                asksend3.askSend(s) != 0 ||
                asksend4.askSend(s) != 0
                ) {
                std::cout << "error1 exit\n";
                break;
            }
            cv::hconcat(imgrev1.image, imgrev2.image, img1);
            cv::hconcat(imgrev3.image, imgrev4.image, img2);
            cv::vconcat(img1, img2, img);

            timestamp.sec = t.nec;
            timestamp.nsec = t.snec;

            // cout << "timestamp:" << timestamp.sec << ' ' << timestamp.nsec << '\n';

            ros::Time time_now = timestamp;

            cv_bridge::CvImage cv_image_rgb;
            cv_image_rgb.image = img;
            cv_image_rgb.encoding = "mono16";
            sensor_msgs::Image ros_image_rgb;
            cv_image_rgb.toImageMsg(ros_image_rgb);
            ros_image_rgb.header.frame_id = "camera_color_optical_frame_right";
            ros_image_rgb.header.seq = count;
            ros_image_rgb.header.stamp = time_now; 
            // if (count == 0) {
            //     for (int y = 0; y < img.rows; ++y) {
            //         for (int x = 0; x < img.cols; ++x) {
            //             // 获取每个像素的值
            //             uint16_t value = img.at<uint16_t>(y, x);
            //             if (value > 1000) std::cout << "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy\n";
            //             std::cout << "Pixel (" << x << ", " << y << "): " << value << '\n';
            //         }
            //     }
            // }

            
            image_pub_right.publish(ros_image_rgb);

            if (cv::waitKey(1) == 27) {
                break;
            }
            count++;
        }
        time_t timestamp2 = time(nullptr);
    }
    return 0;
}