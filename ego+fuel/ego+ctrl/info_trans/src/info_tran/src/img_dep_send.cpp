#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <queue>
#include <vector>
#include <iostream>
#include "threadpool.hpp"

#define SERVER_IP "127.0.0.1"
ros::Time timestamp;

std::queue<int> socketq;
using namespace std;
using namespace cv;
class ImageTCPSend {
public:
    cv::Mat img;
    uint32_t sec;
    uint32_t nsec;
    ImageTCPSend(const char *IP, uint16_t p);
    int init();
    int process();
    ~ImageTCPSend() {
        std::cout << "detele imagesend successfully\n";
        close(this->sock);
    }
private:
    const char *serverIP;
    uint16_t port;
    int sock;
    struct sockaddr_in serverAddr;
};

ImageTCPSend::ImageTCPSend(const char *IP, uint16_t p) : serverIP(IP) 
{
    port = p;
}

int ImageTCPSend::init() {
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
    return 0;
}

int ImageTCPSend::process() 
{
    vector<uchar> decode;
    std::vector<int> params = {cv::IMWRITE_PNG_COMPRESSION, 3};
    imencode(".png", img, decode, params);
    uint32_t len = decode.size();
    vector<uchar> buffer(len + 16);
    buffer[0] = 'B';
    buffer[1] = 'F';
    buffer[2] = 'B';
    buffer[3] = 'F';
    buffer[4] = static_cast<unsigned char>((len) & 0xFF);
    buffer[5] = static_cast<unsigned char>((len >> 8) & 0xFF);
    buffer[6] = static_cast<unsigned char>((len >> 16) & 0xFF);
    buffer[7] = static_cast<unsigned char>((len >> 24) & 0xFF);
    buffer[8] = static_cast<unsigned char>((sec) & 0xFF);
    buffer[9] = static_cast<unsigned char>((sec >> 8) & 0xFF);
    buffer[10] = static_cast<unsigned char>((sec >> 16) & 0xFF);
    buffer[11] = static_cast<unsigned char>((sec >> 24) & 0xFF);
    buffer[12] = static_cast<unsigned char>((nsec) & 0xFF);
    buffer[13] = static_cast<unsigned char>((nsec >> 8) & 0xFF);
    buffer[14] = static_cast<unsigned char>((nsec >> 16) & 0xFF);
    buffer[15] = static_cast<unsigned char>((nsec >> 24) & 0xFF);

    for (int i = 0; i < len; i++) {
        buffer[i + 16] = decode[i];
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

class AskRev {
public:
    AskRev(uint16_t);
    int init();
    int run();
    ~AskRev() {
        std::cout << "detele askrev successfully\n";
        // 关闭套接字
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

AskRev::AskRev(uint16_t p) 
{
    port = p;
}

int AskRev::init()
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

int AskRev::run()
{
    int ret;
    vector<uchar> rev(2);
    for (int i = 0; i < 2; i++) {
        uchar s;
        ret = recv(newSocket, &s, 1, 0);
        if (ret <= 0) {
             while (!socketq.empty()) {
                int sock = socketq.front();
                socketq.pop();
                int i = close(sock);
                cout << i << '\n';
            }
            exit(0);
        }
        rev[i] = s;
    }
    if (rev[0] == 'O' && rev[1] == 'K') return 0;
    return 0;
}


cv::Mat image;
int flag = 0;
// 图像回调函数
void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    try
    {
        if (flag == 0) {
            timestamp = msg->header.stamp;
            // std::cout << "timestamp:" << timestamp.sec << ' ' << timestamp.nsec << '\n';
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_16UC1);
            image = cv_ptr->image;
            flag = 1;
        }
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
    }
}



int main(int argc, char** argv)
{
    ros::init(argc, argv, "image_subscriber_dep");
    ros::NodeHandle nh;

    {
        ImageTCPSend imgSend1(SERVER_IP, 8885);
        ImageTCPSend imgSend2(SERVER_IP, 8886);
        ImageTCPSend imgSend3(SERVER_IP, 8887);
        ImageTCPSend imgSend4(SERVER_IP, 8888);
        std::cout << "start init socket\n";

        while(imgSend1.init() != 0) {

        } 
        std::cout << "imgSend1 successfully\n";

        while (imgSend2.init() != 0) {

        }
        std::cout << "imgSend2 successfully\n";
        while (imgSend3.init() != 0) {
    
        }
        std::cout << "imgSend3 successfully\n";
        while (imgSend4.init() != 0) {
        
        }
        std::cout << "imgSend4 successfully\n";

        AskRev askrev1(9995);
        AskRev askrev2(9996);
        AskRev askrev3(9997);
        AskRev askrev4(9998);


        if (askrev1.init() != 0) {
            std::cout << "askrev1 failed\n";
            return 1;
        } else {
            std::cout << "askrev1 successfully\n";
        }

        if (askrev2.init() != 0) {
            std::cout << "askrev2 failed\n";
            return 1;
        } else {
            std::cout << "askrev2 successfully\n";
        }

        if (askrev3.init() != 0) {
            std::cout << "askrev3 failed\n";
            return 1;
        } else {
            std::cout << "askrev3 successfully\n";
        }

        if (askrev4.init() != 0) {
            std::cout << "askrev4 failed\n";
            return 1;
        } else {
            std::cout << "askrev4 successfully\n";
        }

        //创建线程池
        threadpool<ImageTCPSend> *pool = NULL;
        try
        {
            pool = new threadpool<ImageTCPSend>(8, 8);
        }
        catch (...)
        {
            return 1;
        }

        ros::Subscriber sub_left = nh.subscribe("/camera/depth/image_rect_raw", 10, imageCallback);
        int count = 0;
        while (ros::ok()) {
            ros::spinOnce();

            if (flag == 1) {
                int height = image.rows;
                int width = image.cols;
                int halfHeight = height / 2;
                int halfWidth = width / 2;
                imgSend1.img = image(Rect(0, 0, halfWidth, halfHeight));
                imgSend2.img = image(Rect(halfWidth, 0, width - halfWidth, halfHeight));
                imgSend3.img = image(Rect(0, halfHeight, halfWidth, height - halfHeight));
                imgSend4.img = image(Rect(halfWidth, halfHeight, width - halfWidth, height - halfHeight));
              
                imgSend1.sec = timestamp.sec;
                imgSend1.nsec = timestamp.nsec;
                imgSend2.sec = timestamp.sec;
                imgSend2.nsec = timestamp.nsec;
                imgSend3.sec = timestamp.sec;
                imgSend3.nsec = timestamp.nsec;
                imgSend4.sec = timestamp.sec;
                imgSend4.nsec = timestamp.nsec;

                pool->append(&imgSend1);
                pool->append(&imgSend2);
                pool->append(&imgSend3);
                pool->append(&imgSend4);
                // if (count == 0) {
                //     for (int y = 0; y < image.rows; ++y) {
                //         for (int x = 0; x < image.cols; ++x) {
                //             // 获取每个像素的值
                //             uint16_t value = image.at<uint16_t>(y, x);
                //             if (value > 1000) std::cout << "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy\n";
                //             std::cout << "Pixel (" << x << ", " << y << "): " << value << '\n';
                //         }
                //     }
                // }


                if (askrev1.run() != 0 ||
                    askrev2.run() != 0 ||
                    askrev3.run() != 0 ||
                    askrev4.run() != 0
                    ) {
                    std::cout << "rev ask failded\n";
                }
                flag = 0;
                count++;
            } 
        }

    }
    return 0;
}