#ifndef TINY_MUDUO_ADDRESS_H_
#define TINY_MUDUO_ADDRESS_H_

#include <string>
#include <cstring>
#include <json/json.h>
#include <fstream>


using std::string;
using namespace Json;

namespace tiny_muduo {

class Address {
 private:
  const char* ip_;
  const int port_;

 public:
  Address(const char* port = "8888") : ip_("127.0.0.1"), port_(atoi(port)) {}

  const char* ip() const { return ip_; }
  const int port() const { return port_; }

  // Address(string json = "/home/boyi/WebServer/Main/setting.json"){
  //   Value root;
  //   Reader reader;

  //   ifstream ifs(json);
  //   reader.parse(ifs, root);
  //   ip_ = root["ip"].asString();
  //   port_ = root["port"].asUInt64();
  // }

  // const char* ip() const { return ip_; }
  // int port() const { return port_; }
};

}
#endif

