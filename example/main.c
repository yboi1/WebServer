#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(int argc, char*argv[]){
    if(argc<2){
        printf("data is no enough...\n");
    }
    char* ip = argv[1];
    int port = atoi(argv[2]);

    // socket
    int listenfd = socket(PF_INET, SOCK_STREAM, 0);

    struct sockaddr_in address;
    address.sin_family =  AF_INET;
    address.sin_port = htons(port);
    inet_pton(AF_INET, ip, &(address.sin_addr));

    // bind
    bind(listenfd, (struct sockaddr*)(&address), sizeof(address));
    // listen
    listen(listenfd, 5);


    struct sockaddr_in client;
    socklen_t client_len = sizeof(client);
    // accept
    int sockfd = accept(listenfd, (struct sockaddr*)(&address), &client_len);

    char buf[1024] = {0};
    int recv_size = recv(sockfd, buf, sizeof(buf), 0);

    printf("%s\n", buf);

    send(sockfd, buf, recv_size, 0);


    close(listenfd);
    close(sockfd);
    return 0;

}