## 函数执行步骤:

### 创建EventLoop对象

```
创建Epoller, 初始化epollfd_, events(事件数量)
			wake_fd(0)
```

### 创建Address对象

```
初始化port, ip
```

### 创建EchoServer对象

```
传参:loop, address
创建TcpServer对象 server_(loop, address)
	-初始化loop_, threads
	-创建acceptor_对象(loop, address)
		-初始化loop_, listenfd(socket(PF_INET, SOCK_STREAM, 0))
	-创建Channel对象 channel_(loop, listenfd)
		-初始化loop_, fd, events, recv_events_
	-绑定fd BindListenFd(address)
	-channel_ -> setReadCallBack(bind((NewConnection, this))
绑定ConnectionCallback
绑定MessageCallback
```



### TcpServer server_ -> start()

```
server.loop_->RunOnefunc() -> 执行Accpetor::Listen函数
	监听套接字, 设置监听事件
```



### EventLoop loop_->Loop()	

> 死循环执行处理任务

```
loop.epooler_->poll 
	-执行epoll_wait ->执行FillActiveChannels()
	-将监听到的放入到任务队列active_channels_中
遍历任务队列active_channels_ 
	通过执行HandleEvent()函数处理任务
重新开始循环
```

