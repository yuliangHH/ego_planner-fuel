#ifndef INFO_SEND
#define INFO_SEND

#include <iostream>
#include <dirent.h>
#include <vector>
#include <algorithm>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <cstring>
#include <string>
#include <vector>


// template <typename T>
class InfoSend {           // 发送类
public:
    InfoSend(const char* IP, uint16_t p);
    int init();
    int sendMsg(std::vector<unsigned char> &msg);
    ~InfoSend();
private:
    int sock;
    struct sockaddr_in serverAddr;
    const char* serverIP;
    uint16_t port;
};

// template <typename T>
InfoSend::InfoSend(const char *IP, uint16_t p) : serverIP(IP)
{
    port = p;
}

// template <typename T>
int InfoSend::init()
{
    sock = socket(AF_INET, SOCK_STREAM, 0);
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
        std::cout << "Error: Connection failed.\n";
        close(sock);
        return 1;
    }
    return 0;
}

// template <typename T>
int InfoSend::sendMsg(std::vector<unsigned char> &msg)
{
    uint32_t len = msg.size();
    // char buf[len];
    // memcpy(buf, &msg, len);
    std::vector<unsigned char> buffer(len + 8);
    buffer[0] = 'B';
    buffer[1] = 'F';
    buffer[2] = 'B';
    buffer[3] = 'F';
    buffer[4] = (unsigned char)((len) & 0xFF);
    buffer[5] = (unsigned char)((len >> 8) & 0xFF);
    buffer[6] = (unsigned char)((len >> 16) & 0xFF);
    buffer[7] = (unsigned char)((len >> 24) & 0xFF);
    // std::cout << "send len imcode: " << (uint8_t)buffer[4] << ' '  << (uint8_t)buffer[5] << ' '  << (uint8_t)buffer[6] << ' ' << (uint8_t)buffer[7] << '\n';
    // std::cout << "send len: " << len << '\n';
    for (int i = 0; i < len; ++i) {
        buffer[i + 8] = msg[i];
    }

    if (send(sock, buffer.data(), buffer.size(), 0) == -1) {
        std::cout << "Error: Failed to send image data.\n";
        return -1;
    }
    return 0;
}

// template <typename T>
InfoSend::~InfoSend()
{
    close(this->sock);
}


#endif