#ifndef TINY_MUDUO_CONDITION_H_
#define TINY_MUDUO_CONDITION_H_

#include "pthread.h"
#include "mutex.h"

namespace tiny_muduo{

class Condition{
public:
    Condition(MutexLock& mutex):mutex_(mutex){
        pthread_cond_init(&cond_, nullptr);
    }
    ~Condition(){
        pthread_cond_destroy(&cond_);
    }

    // 等待条件变量满足并且解锁互斥锁, 进入睡眠, 等待其他线程调用signal或者broadcast
    bool Wait(){
        int ret = 0;
        ret = pthread_cond_wait(&cond_, mutex_.mutex());
        return ret == 0;
    }

    // 唤醒一个等待的线程
    bool Signal(){
        return pthread_cond_signal(&cond_);
    }

    // 广播唤醒所有等待的线程
    bool BroadCast(){
        return pthread_cond_broadcast(&cond_);
    }

private:
    MutexLock& mutex_;
    pthread_cond_t cond_;
};

}

#endif