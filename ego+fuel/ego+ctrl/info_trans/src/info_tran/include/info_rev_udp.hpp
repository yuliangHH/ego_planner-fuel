#include <iostream>
#include <cstring>
#include <arpa/inet.h>
#include <unistd.h>
#include <vector>

class UDPRev
{   
public:
    UDPRev(uint16_t p);
    int init();
    std::vector<unsigned char> run();
    ~UDPRev();
private:
    uint16_t sockfd;
    uint16_t port;
    struct sockaddr_in server_addr, client_addr;
};

UDPRev::UDPRev(uint16_t p)
{
    port = p;
}

int UDPRev::init()
{
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) {
        perror("socket creation failed");
        return -1;
    }
    memset(&server_addr, 0, sizeof(server_addr));
    memset(&client_addr, 0, sizeof(client_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(port);

    // 绑定套接字
    if (bind(sockfd, (const struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("bind failed");
        return -1;
    }
}

std::vector<unsigned char> UDPRev::run()
{
    char buffer[100];
    socklen_t len = sizeof(buffer);
    int n = recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr *)&client_addr, &len);
    if (n < 0) {
        perror("recvfrom failed");
        // return -1;
    }
    // std::cout << "n: " </< n << '\n';
    std::vector<unsigned char> res(n);
    for (int i = 0; i < n; i++) {
        res[i] = buffer[i];
    }
    return res;
}

UDPRev::~UDPRev()
{
    close(sockfd);
}