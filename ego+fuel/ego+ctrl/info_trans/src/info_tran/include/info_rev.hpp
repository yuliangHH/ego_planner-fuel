#ifndef INFO_REV
#define INFO_REV

#include <iostream>
#include <dirent.h>
#include <vector>
#include <algorithm>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <cstring>
#include <string>


// template <typename T>
class InfoRev
{
public:
    InfoRev(uint16_t p);
    int init();
    std::vector<unsigned char> run();
    ~InfoRev();
private:
    uint16_t port;
    int serverSock, newSocket;
    struct sockaddr_in serverAddr;
    struct sockaddr_storage serverStorage;
    socklen_t addr_size;
};

// template <typename T>
InfoRev::InfoRev(uint16_t p) 
{
    port = p;
}

// template <typename T>
int InfoRev::init()
{
    // 创建 TCP 套接字
    serverSock = socket(AF_INET, SOCK_STREAM, 0);

    // 设置服务器地址
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(port);
    serverAddr.sin_addr.s_addr = INADDR_ANY;

    // 绑定套接字
    bind(serverSock, (struct sockaddr *) &serverAddr, sizeof(serverAddr));
    // 监听传入的连接
    if (listen(serverSock, 10) == 0) {
        std::cout << "Listening for incoming connections..." << '\n';
    } else {
        std::cout << "Failed to listen" << '\n';
        return -1;
    }
    // 等待客户端连接
    addr_size = sizeof(serverStorage);
    newSocket = accept(serverSock, (struct sockaddr *) &serverStorage, &addr_size);
    std::cout << "Client connected" << '\n';
    return 0;
}

// template <typename T>
std::vector<unsigned char> InfoRev::run()
{
    uint32_t len;
    int ret = 0;
    std::vector<char> head(8);
    for (int i = 0; i < 8; ++i) {
        char s;
        ret = recv(newSocket, &s, 1, 0);
        if (ret <= 0) {
            std::cout << "rev head failed\n";
        }
        head[i] = s;
    }
    std::cout << "rev head successfully\n";
    len = (static_cast<uint16_t>(head[7]) << 24) | (static_cast<uint16_t>(head[6]) << 16) | (static_cast<uint16_t>(head[5]) << 8) | static_cast<uint16_t>(head[4]);
    // char buffer[len];
    std::vector<unsigned char> buffer(len);
    std::cout << "rev len: " << len << '\n';
    for (int i = 0; i < len; ++i) {
        char s;
        ret = recv(newSocket, &s, 1, 0);
        if (ret <= 0) {
            std::cout << "rev content failed\n";
        }
        buffer[i] = s;
    }
    // T msg;
    // memcpy(&msg, buffer, sizeof(T));
    return buffer;

}

// template <typename T>
InfoRev::~InfoRev()
{
    close(newSocket);
    close(serverSock);
}


#endif