#include "echo.h"
#include "eventloop.h"
#include "address.h"

using namespace tiny_muduo;

int main(){
    EventLoop* loop = new EventLoop();
    Address* addr = new Address();
    EchoServer* server = new EchoServer(loop, *addr);
    server->Start();
    loop->Loop();
    return 0;
}