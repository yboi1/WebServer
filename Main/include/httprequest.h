#ifndef TINY_MUDUO_HTTPREQUEST_H_
#define TINY_MUDUO_HTTPREQUEST_H_

#include "httpparsestate.h"

#include <string>
#include <map>

using std::string;

namespace tiny_muduo{

static const char http[] = "http/1." ;

enum Method {
  kGet,
  kPost,
  kPut,
  kDelete,
  kTrace,
  kOptions,
  kConnect,
  kPatch
};

enum Version {
  kHttp10,
  kHttp11
};

class HttpRequest{
public:
    HttpRequest();
    ~HttpRequest();

    // : 解析 HTTP 请求方法
    bool ParseRequestMethod(const char* start, const char* end);

    // 解析 HTTP 请求行
    void ParseRequestLine(const char* start, const char* end, 
                        HttpRequestParseState& state);

    // 解析 HTTP 请求头部。
    void ParseHeaders(const char* start, const char* end, 
                        HttpRequestParseState& state);

    // 解析 HTTP 请求体
    void ParseBody(const char* start, const char* end, 
                        HttpRequestParseState& state);                    

    Method method() const {return method_; }
    const string& path() const {return path_;}
    const string& query() const {return query_;}
    Version version() const { return version_; }
    const std::map<string, string>& headers() const { return headers_; }

    string GetHeader(const string& header) const{
        auto iter = headers_.find(header);
        if(iter == headers_.end()){
            return string();
        } else {
            return iter->second;
        }
    }



private:
    Method method_;
    string path_;
    string query_;
    Version version_;
    std::map<string, string> headers_;
};

}



#endif