#include "eventloop.h"
#include "channel.h"

#include <iostream>
namespace tiny_muduo{


EventLoop::EventLoop()
    : epoller_(new Epoller()),
      wakeup_fd_(0),
      tid_(::pthread_self()),
      wakeup_channel_(new Channel(this, wakeup_fd_)){
    wakeup_channel_->SetReadCallback(std::bind(&EventLoop::HandleRead, this));
    wakeup_channel_->EnableReading();
}

EventLoop::~EventLoop() {}

void EventLoop::Loop(){
    while(1){
        epoller_->Poll(active_channels_);
        // printf("EventLoop Loop:: eventnum %d\n", active_channels_.size());
        for(const auto&channel : active_channels_){
            // printf("EventLoop Loop connfd %d\n", channel->fd());
            channel->HandleEvent();
        }
        active_channels_.clear();
        DoToDoList();
    }
}

void EventLoop::HandleRead(){
    uint64_t read_one_byte = 1;
    ::read(wakeup_fd_, &read_one_byte, sizeof(read_one_byte));  // 等待被唤醒
    return;
}

void EventLoop::RunOneFunc(const BasicFunc& func) { 
   if(IsInThreadLoop()){
    func();
   }else{
    {
        MutexLockGuard lock(mutex_);
        to_do_list_.emplace_back(func);
    }
    if(!IsInThreadLoop()){
        uint64_t write_one_byte = 1;
        ::write(wakeup_fd_, &write_one_byte, sizeof(write_one_byte)); // 唤醒等待线程
    }
   }
}

void EventLoop::DoToDoList() {
  ToDoList functors;
  {
    MutexLockGuard lock(mutex_);
    functors.swap(to_do_list_);
  }
  for(const auto&func : functors){
    func();
  }
}


}// namespace tiny_muduo