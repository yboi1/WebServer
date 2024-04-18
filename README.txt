4.18 

## 实现了简单的通信服务器

下面是通信函数

```c
#include <sys/types>
#include <sys/socket.h>
int socket(int domain, int type, int protocol);
/*
//domain:
AF_UNIX 	//local communication
AF_INET	    //IPv4 Internet protocols
    
//type    
SOCK_STREAM  // 顺序的,可靠的,双向的, 基于连接的字节流	TCP
SOCK_DGRAM   // 支持数据报	UDP
    
//protocol
SOCK_NONBLOCK	// 非阻塞的
SOCK_CLIEXEC	// 在新的文件描述符上设置 close-on-exec（FD_CLOEXEC）标志

*/

/*
struct sockaddr {
  sa_family_t sa_family;	// 套接字地址的地址族 不同的域表示不同, 如AF_INET等
  char  sa_data[14];		//存储了 IP 地址和端口号信息
}
*/

int inet_pton(int af, const char *src, void *dst);
/* af AF_INET 表示IPv4
	  AF_INET6
	src ip地址的指针
	*dst 指向用于存储转换后二进制地址的缓冲区的指针。
*/
int bind(int sockfd, const struct sockaddr *addr,socklen_t addrlen);
// addr
// 通常是一个 sockaddr_in 或 sockaddr_in6 结构体，其中包含了 IP 地址和端口号等信息。

int listen(int sockfd, int backlog);
// backlog	可以连接的最大数量


int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);
```

