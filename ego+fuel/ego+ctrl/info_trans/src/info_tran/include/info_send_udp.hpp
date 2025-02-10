#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <vector>
#include <unistd.h> // 包含 usleep 函数

class UDPSend
{
public:
    UDPSend(const char* IP, uint16_t p);
    int init();
    int sendMsg(std::vector<unsigned char> &msg);
    ~UDPSend();
private:
    int sockfd;
    struct sockaddr_in server_addr;

    const char* serverIP;
    uint16_t port;
};

UDPSend::UDPSend(const char* IP, uint16_t p) : serverIP(IP)
{
    port = p;
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
    server_addr.sin_port = htons(port);
    if (inet_pton(AF_INET, serverIP, &server_addr.sin_addr) <= 0) {
        perror("inet_pton failed");
        exit(EXIT_FAILURE);
    }
    return 0;
}

int UDPSend::sendMsg(std::vector<unsigned char> &msg)
{
    // char buffer[sizeof(MyStruct)];
    // memcpy(buffer, &MyStruct, sizeof(MyStruct));
    // std::cout << "sizeof(msg): " << sizeof(msg) << '\n';
    sendto(sockfd, msg.data(), msg.size(), 0, (const struct sockaddr *)&server_addr, sizeof(server_addr));
    std::cout << "Data sent successfully." << std::endl;
    return 0;
}

UDPSend::~UDPSend()
{
    close(this->sockfd);
}