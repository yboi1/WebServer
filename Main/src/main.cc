#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <errno.h>
//epoll
#include <sys/epoll.h>
#include <fcntl.h>

#include "processpoll.h"
#include "echo.h"
#define MAX_EVENTS_NUMER 5

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

    processpoll<echo>* poll = processpoll<echo>::create(listenfd, 8);
    poll->run();

    close(listenfd);

    return 0;
}