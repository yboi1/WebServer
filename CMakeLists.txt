file(GLOB src "*/src/*.c*")
file(GLOB include "*/include/*.h")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

include_directories(/home/boyi/WebServer/Main/include)

add_executable(Server ${src} ${include})