#ifndef TINY_MUDUO_TCPSERVER_H_
#define TINY_MUDUO_TCPSERVER_H_

#include <memory>
#include <unordered_map>

#include "callback.h"
#include "eventloop.h"
#include "acceptor.h"
#include "eventloopthreadpool.h"
#include "tcpconnection.h"

namespace tiny_muduo {

class Address;

class TcpServer {
 public:
  TcpServer(EventLoop* loop, const Address& address);
  ~TcpServer();

  void Start() {
    threads_->StartLoop();
    loop_->RunOneFunc(std::bind(&Acceptor::Listen, acceptor_.get()));
  }

  void SetConnectionCallback(const ConnectionCallback& callback) { 
    connection_callback_ = callback;
  }

  void SetMessageCallback(const MessageCallback& callback) {
    message_callback_ = callback;
  }

  void SetThreadNums(int thread_nums) {
    threads_->SetThreadNums(thread_nums);    
  }

  void HandleClose(const TcpConnectionPtr& conn);
  void HandleCloseInLoop(const TcpConnectionPtr& ptr);
  void HandleNewConnection(int connfd);

 private:
  typedef std::unordered_map<int, TcpconnectionPtr> ConnectionMap;

  EventLoop* loop_;
  std::unique_ptr<EventLoopThreadPool> threads_;
  std::unique_ptr<Acceptor> acceptor_;

  ConnectionCallback connection_callback_;
  MessageCallback message_callback_;
  ConnectionMap connections_;
};

}// namespace tiny_muduo
#endif
