4.18 

第一步:
## 实现简单的通信服务器

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



4.20 

用epoll实现了事件监听

> 使用非阻塞recv然后使用epoll进行检测, 



简单的进程池服务器框架

```
process 类：用于表示子进程，其中包含子进程的 PID 和用于进程间通信的管道文件描述符。
processpoll 类：进程池类模板，用于管理多个子进程。主要功能包括创建进程池、运行父进程和子进程、设置信号处理等。
processpoll 类模板中的静态成员变量 instance 用于保存 processpoll 类的单例对象。
processpoll 类模板中的构造函数 processpoll(int listenfd, int _max_process_num) 用于初始化进程池。在构造函数中，通过调用 socketpair 创建一对全双工的通信管道，然后创建多个子进程，并在父子进程间建立通信。
run() 函数根据进程标识符 idx 判断当前进程是父进程还是子进程，并调用相应的处理函数。
setup_up_sig() 函数用于创建 epoll 实例并初始化。
run_parent() 函数是父进程的处理逻辑，通过监听 epoll 事件，接收客户端连接请求，并将连接请求发送给子进程。
run_child() 函数是子进程的处理逻辑，通过监听 epoll 事件，接收父进程发送的连接请求，并处理客户端的数据。
其他一些辅助函数，如 set_non_blocking() 用于设置文件描述符为非阻塞模式，addfd() 和 removefd() 用于向 epoll 中添加或删除文件描述符等。
```

