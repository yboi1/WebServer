#ifndef TINY_MUDUO_BUFFER_H_
#define TINY_MUDUO_BUFFER_H_

#include <vector>
#include <algorithm>
#include <string>
#include <assert.h>

using std::string;

namespace tiny_muduo{

static const int kPrePendIndex = 8;

class Buffer{
public:
    Buffer():buffer_(1024), read_index_(kPrePendIndex), write_index_(kPrePendIndex){
}
    ~Buffer(){}

    // 读取文件描述符fd中的内容	
    int ReadFd(int fd);

    // 返回buffer的首地址
    char* begin(){return &*buffer_.begin();};
    const char* begin() const {return &*buffer_.begin(); };

    // 返回可读取数据的首地址。
    char* beginread() { return begin() + read_index_;}
    const char* beginread() const{ return begin() + read_index_;}

    // 返回可写入数据的首地址。
    char* beginwrite() { return begin() + write_index_; }
    const char* beginwrite() const { return begin() + write_index_; }

    // 向buffer中添加内容
    void Append(const char* message, int len){
        MakeSureEnoughStorage(len);
        std::copy(message, message+len, beginwrite());
        write_index_ += len;
    }

    void Append(const string& message){
        Append(message.data(), message.size());
    }

    // 从缓冲区中移除 len 长度的数据。
    void Retrieve(int len){
        if(len + read_index_ != write_index_){
            read_index_ = read_index_ + len;
        }else{
            write_index_ = kPrePendIndex;
            read_index_ = write_index_;
        }
    }

    // 从缓冲区中移除直到指定索引位置的数据。
    void RetrieveUntilIndex(const char* index){
        assert(beginwrite() >= index);
        read_index_ += index - beginread();
    }

    // 清空缓冲区。
    void RetrieveAll(){
        write_index_ = kPrePendIndex;
        read_index_ = write_index_;
    }

    // 从缓冲区中获取长度为 len 的数据并转换为字符串。
    string RetrieveAsString(int len){
        assert(read_index_ + len <= write_index_);
        string ret = std::move(PeekAsString(len));
        Retrieve(len);
        return ret;
    }

    // 从缓冲区中获取所有数据并转换为字符串。
    string RetrieveAllAsString(){
        string ret = std::move(RetrieveAllAsString());
        RetrieveAll();
        return ret;
    }

    // : 返回缓冲区中可读取数据的首地址
    const char* Peek() const{
        return beginread();
    }

    // 返回缓冲区中长度为 len 的数据并转换为字符串
    string PeekAsString(int len){
        return string(beginread(), beginread() + len);
    }

    // 返回缓冲区中所有数据并转换为字符串。
    string PeekAllString(){
        return string(beginread(), beginwrite());
    }

    int readablebytes() const {return read_index_ - write_index_; } // // 返回可读取的长度
    int writeablebytes() const {return buffer_.capacity() - write_index_; } // 返回可写入的长度
    int prependablebytes() const { return read_index_; }    // 返回缓冲区头部的预留空间的字节数，即读指针的位置

    // 扩容函数, 确保内存大小够用
    void MakeSureEnoughStorage(int len){
        if(readablebytes() >= len)  return;
        if(writeablebytes() + prependablebytes() >= kPrePendIndex + len){
            std::copy(beginread(), beginwrite(), begin()+kPrePendIndex);
            write_index_ = 8 + readablebytes();
            read_index_ = 8;
        }else{
            buffer_.resize(buffer_.size() + len);
        }
    }

private:
    std::vector<char> buffer_;
    int read_index_;
    int write_index_;
};

}


#endif