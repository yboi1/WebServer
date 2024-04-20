#ifndef __PROCESSPOLL_H_
#define __PROCESSPOLL_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <arpa/inet.h>

class process{
public:
    int pid;        // 记录id
    int pipe[2];    // 记录用于通信的套接字

    process() : pid(-1), pipe{0,0} {}
};

template <typename T>
class processpoll{
private:
    static const int MAX_EVENT_NUMBER = 5;
    static const int MAX_USER_PER_PROCESS = 10000;
    int idx;                // idx = i ? 不知是何意
    int listenfd;
    int epollfd;
    int max_process_num;    // 最大线程数量
    process* sub_processes;   // 存储线程的集合
    static processpoll<T>* instance;

    processpoll(int listenfd, int max_process_num = 8);
    ~processpoll(){
        delete []sub_processes;
    }
public:
    // 创建单例对象
    static processpoll<T>*create(int listenfd, int _max_process_num=8){
        if(instance==nullptr){
            instance = new processpoll<T>(listenfd, _max_process_num);
            return instance;
        }
        return instance;
    }

    void run();
    void run_parent();
    void run_child();
    void setup_up_sig();
};

// 初始化静态成员
template<typename T>
processpoll<T>* processpoll<T>::instance = nullptr;

template<typename T>
processpoll<T>::processpoll(int listenfd, int _max_process_num):
                            idx( -1 ), listenfd( listenfd ), epollfd ( 0 ),
						   max_process_num( _max_process_num ), sub_processes( nullptr )
{
    sub_processes = new process [max_process_num];
    for( int i = 0; i < max_process_num; i++){
        // 创建相互连接的套接字 int socketpair(int domain, int type, int protocol, int sv[2]); 
        socketpair( PF_UNIX, SOCK_STREAM, 0, sub_processes[i].pipe);
        sub_processes[i].pid = fork();

        if(sub_processes[i].pid>0){
            close(sub_processes[i].pipe[1]);
            continue;
        }
        else{   // 用idx来区分是否为子线程
            close(sub_processes[i].pipe[0]);
            idx = i;
            break;
        }
    }
}                           

static int set_non_blocking(int fd){
    int old_state = fcntl(fd, F_GETFL);
    int new_state = old_state | O_NONBLOCK;
    fcntl(fd, F_SETFL, new_state);
    return old_state;
}

static void addfd(int epollfd, int fd){
    epoll_event event;
    event.data.fd = fd;
    event.events = EPOLLIN | EPOLLET;
    epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &event);
    set_non_blocking(fd);
}

static void removefd(int epollfd, int fd){
    epoll_ctl(epollfd, EPOLL_CTL_DEL, fd, nullptr);
    close(fd);
}

template<typename T>
void processpoll<T>::run(){
    if(idx == -1){
        run_parent();
    }
    else{
        run_child();
    }
}

template<typename T>
void processpoll<T>::setup_up_sig(){
    epollfd = epoll_create(5);
    assert(epollfd != -1);
}

template<typename T>
void processpoll<T>::run_parent(){
    epoll_event events[ MAX_EVENT_NUMBER ];
    setup_up_sig();

    addfd(epollfd, listenfd);

    int pre_idx = 0;        // 记录上一个子进程的索引
    int has_new_cli = 1;    // 
    int number = 0;

    while(1){
        number = epoll_wait(epollfd, events, MAX_EVENT_NUMBER, -1);

        // 先与客户端创建连接
        for(int i = 0; i < number; ++i){
            int sockfd = events[i].data.fd;
            if(sockfd == listenfd){
                int pos = pre_idx;
                do{
                    pos = (pos+1)%max_process_num;
                }while(sub_processes[pos].pid == -1);
                pre_idx = pos;

                send(sub_processes[pos].pipe[0], (void*)&has_new_cli, sizeof(has_new_cli), 0);
                printf( "parent processes has sent msg to %d child\n", pos );
            }
        }
    }
}

template<typename T>
void processpoll<T>::run_child(){
    epoll_event events[MAX_EVENT_NUMBER];
    setup_up_sig();

    int pipefd = sub_processes[idx].pipe[1];
    addfd(epollfd, pipefd);
    T* users = new T[MAX_USER_PER_PROCESS];

    int number = 0;
    while(1){
        number = epoll_wait(epollfd, events, MAX_EVENT_NUMBER, -1);
        for(int i = 0; i < number; ++i){
            int sockfd = events[i].data.fd;
            // 在首次先进行创建通信套接字
            if(sockfd == pipefd && (events[i].events & EPOLLIN)){
                struct sockaddr_in client;
                socklen_t client_addrlength = sizeof(client);
                int connfd = accept(listenfd, (struct sockaddr*)&client, &client_addrlength);
                addfd(epollfd, connfd);
                users[connfd].init(epollfd, connfd, client);
                printf("child %d is addfding \n", idx);
                continue;
            }
            else if(events[i].events & EPOLLIN){
                printf( "child %d has recv msg\n", idx );
				users[sockfd].process();
            }
        }
    }
    delete [] users;
	users = nullptr;

	close( epollfd );
	close( pipefd );
}

#endif