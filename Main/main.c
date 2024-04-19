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

#define MAX_EVENTS_NUMER 5

int set_non_block(int fd){
    int old_state = fcntl(fd, F_GETFL);
    int new_state = old_state | O_NONBLOCK;
    fcntl(fd, F_SETFL, new_state);

    return old_state;
}

void addfd(int epollfd, int fd){
    struct epoll_event event;
    event.events = EPOLLIN | EPOLLET;
    event.data.fd = fd;
    epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &event);
    set_non_block(fd);
}

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

    struct epoll_event events[MAX_EVENTS_NUMER];
    int epollfd = epoll_create(5);
    assert(epollfd!=-1);
    addfd(epollfd, listenfd);

    while(1){
        int number = epoll_wait(epollfd, events, MAX_EVENTS_NUMER, -1);
        if(number<0){
            printf("epoll_wait failed...\n");
            return -1;
        }

        for(int i = 0; i < number; i++){
            const struct epoll_event event = events[i]; // ===无法使用引用
            const int eventfd = event.data.fd;

            if(eventfd == listenfd){
                struct sockaddr_in client;
                socklen_t client_len = sizeof(client);
                int sockfd = accept(listenfd, (struct sockaddr*)(&address), &client_len);
                addfd(epollfd, sockfd);
            }
            else if(event.events & EPOLLIN){
                char buf[1024] = {0};
                while(1){
                    memset(buf, 0, sizeof(buf));
                    int recv_size = recv(eventfd, buf, sizeof(buf), 0);
                    if(recv_size < 0){
                        if( (errno == EAGAIN) || (errno == EWOULDBLOCK) ){
                            break;
                        }
                        printf(" sock fd %d, recv msg failed...\n", eventfd);
                        close(eventfd);
                        break;
                    }
                    else if( recv_size == 0 ){
                        close(eventfd);
                        break;
                    }
                    else{
                        send(eventfd, buf, recv_size, 0);
                    }
                }
            }
        }
    }

    close(listenfd);
    return 0;
}