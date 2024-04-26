#include "tcpserver.h"

#include "acceptor.h"
#include "tcpconnection.h"

using namespace tiny_muduo;

TcpServer::TcpServer(EventLoop* loop, const Address& address)
    :   loop_(loop),
        threads_(new EventLoopThreadPool(loop_)),
        acceptor_(new Acceptor(loop, address)){
    acceptor_->SetNewConnectionCallback(std::bind(&TcpServer::NewConnection, this, _1));
}

TcpServer::~TcpServer(){
    delete acceptor_;
    delete threads_;
}

void TcpServer::NewConnection(int connfd){
    EventLoop* loop = threads_->NextLoop();
    printf("TcpServer NewConnection Arrive Tid:%ld Manage\n", loop->DebugShowTid());

    TcpConnection* ptr = new TcpConnection(loop_, connfd);
    ptr->SetConnectionCallback(connection_callback_);
    ptr->SetMessageCallback(message_callback_);
    loop_->RunOneFunc(std::bind(&TcpConnection::ConnectionEstablished, ptr));

}
