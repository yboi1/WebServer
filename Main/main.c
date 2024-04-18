#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(int argc, char* argv[]){
    if(argc<2){
        printf("Usage : %s ip_address portname Where is port?\n", argv[0]);
        return 0;
    }

    const char *ip = argv[1];
    int port = atoi(argv[2]);

    int listenfd = socket(PF_INET, SOCK_STREAM, 0);
    assert(listenfd>1);

    struct sockaddr_in address;     // <netinet/in.h>
    memset(&address, 0, sizeof(address));
    address.sin_family = AF_INET;       // 地址族, AF_INET表示IPv4
    address.sin_port = htons(port);     // 端口号
    inet_pton(AF_INET, ip, &address.sin_addr);  // 表示IPv4地址, 是一个in_addr 结构体

    int ret = bind(listenfd, (struct sockaddr*)(&address), sizeof(address));
    assert(ret!=-1);

    ret = listen(listenfd, 5);
    assert(ret != -1);
                      
    struct sockaddr_in client;
    socklen_t client_addrlen = sizeof(client);
    int sockfd = accept(listenfd, (struct sockaddr*)(&address), &client_addrlen);

    char buf_size[1024] = {0};
    int recv_size = 0;
    recv_size = recv(sockfd, buf_size, sizeof(buf_size), 0);

    int send_size = 0;
    send_size = send(sockfd, buf_size, recv_size, 0);

    close(sockfd);
    close(listenfd);

    return 0;

}