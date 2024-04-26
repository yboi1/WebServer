#ifndef TINY_MUDUO_EVENTLOOPTHREAD_H
#define TINY_MUDUO_EVENTLOOPTHREAD_H

#include "thread.h"
#include "mutex.h"
#include "condition.h"

namespace tiny_muduo {

class EventLoop;

class EventLoopThread {
 public:
  EventLoopThread();
  ~EventLoopThread();

  void StartFunc();
  EventLoop* StartLoop();

 private:
  EventLoop* loop_;
  Thread thread_;
  MutexLock mutex_;
  Condition cond_;
};

}
#endif
