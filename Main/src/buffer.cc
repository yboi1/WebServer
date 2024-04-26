#include "buffer.h"

#include <sys/uio.h>

using namespace tiny_muduo;

int Buffer::ReadFd(int fd){
    char extrabuf[65536] = {0};
    struct iovec iv[2];
    const int writeable = writeablebytes();
    iv[0].iov_base = beginwrite();
    iv[0].iov_len = writeable;
    iv[1].iov_base = extrabuf;
    iv[1].iov_len = sizeof(extrabuf);

    // 判断是否需要多余的空间
    const int iovcnt = (writeable < static_cast<int> (sizeof(extrabuf)) ? 2 : 1);
    int readn = readv(fd, iv, iovcnt);

    if(readn < 0){
        assert(readn >= 0);
    }
    else if(readn <= writeable){
        write_index_ += readn;
    } else { // readn > writeable   继续读取
        write_index_ = buffer_.size();
        Append(extrabuf, readn - writeable);
    }

    return readn;
}