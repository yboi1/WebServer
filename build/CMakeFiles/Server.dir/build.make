# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/boyi/WebServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/boyi/WebServer/build

# Include any dependencies generated for this target.
include CMakeFiles/Server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Server.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Server.dir/flags.make

CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o: ../Main/src/EventLoopThreadPool.cc
CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o -MF CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o.d -o CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o -c /home/boyi/WebServer/Main/src/EventLoopThreadPool.cc

CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/EventLoopThreadPool.cc > CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.i

CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/EventLoopThreadPool.cc -o CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.s

CMakeFiles/Server.dir/Main/src/acceptor.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/acceptor.o: ../Main/src/acceptor.cc
CMakeFiles/Server.dir/Main/src/acceptor.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Server.dir/Main/src/acceptor.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/acceptor.o -MF CMakeFiles/Server.dir/Main/src/acceptor.o.d -o CMakeFiles/Server.dir/Main/src/acceptor.o -c /home/boyi/WebServer/Main/src/acceptor.cc

CMakeFiles/Server.dir/Main/src/acceptor.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/acceptor.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/acceptor.cc > CMakeFiles/Server.dir/Main/src/acceptor.i

CMakeFiles/Server.dir/Main/src/acceptor.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/acceptor.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/acceptor.cc -o CMakeFiles/Server.dir/Main/src/acceptor.s

CMakeFiles/Server.dir/Main/src/channel.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/channel.o: ../Main/src/channel.cc
CMakeFiles/Server.dir/Main/src/channel.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Server.dir/Main/src/channel.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/channel.o -MF CMakeFiles/Server.dir/Main/src/channel.o.d -o CMakeFiles/Server.dir/Main/src/channel.o -c /home/boyi/WebServer/Main/src/channel.cc

CMakeFiles/Server.dir/Main/src/channel.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/channel.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/channel.cc > CMakeFiles/Server.dir/Main/src/channel.i

CMakeFiles/Server.dir/Main/src/channel.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/channel.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/channel.cc -o CMakeFiles/Server.dir/Main/src/channel.s

CMakeFiles/Server.dir/Main/src/echo.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/echo.o: ../Main/src/echo.cc
CMakeFiles/Server.dir/Main/src/echo.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Server.dir/Main/src/echo.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/echo.o -MF CMakeFiles/Server.dir/Main/src/echo.o.d -o CMakeFiles/Server.dir/Main/src/echo.o -c /home/boyi/WebServer/Main/src/echo.cc

CMakeFiles/Server.dir/Main/src/echo.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/echo.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/echo.cc > CMakeFiles/Server.dir/Main/src/echo.i

CMakeFiles/Server.dir/Main/src/echo.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/echo.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/echo.cc -o CMakeFiles/Server.dir/Main/src/echo.s

CMakeFiles/Server.dir/Main/src/epoller.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/epoller.o: ../Main/src/epoller.cc
CMakeFiles/Server.dir/Main/src/epoller.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Server.dir/Main/src/epoller.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/epoller.o -MF CMakeFiles/Server.dir/Main/src/epoller.o.d -o CMakeFiles/Server.dir/Main/src/epoller.o -c /home/boyi/WebServer/Main/src/epoller.cc

CMakeFiles/Server.dir/Main/src/epoller.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/epoller.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/epoller.cc > CMakeFiles/Server.dir/Main/src/epoller.i

CMakeFiles/Server.dir/Main/src/epoller.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/epoller.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/epoller.cc -o CMakeFiles/Server.dir/Main/src/epoller.s

CMakeFiles/Server.dir/Main/src/eventloop.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/eventloop.o: ../Main/src/eventloop.cc
CMakeFiles/Server.dir/Main/src/eventloop.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/Server.dir/Main/src/eventloop.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/eventloop.o -MF CMakeFiles/Server.dir/Main/src/eventloop.o.d -o CMakeFiles/Server.dir/Main/src/eventloop.o -c /home/boyi/WebServer/Main/src/eventloop.cc

CMakeFiles/Server.dir/Main/src/eventloop.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/eventloop.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/eventloop.cc > CMakeFiles/Server.dir/Main/src/eventloop.i

CMakeFiles/Server.dir/Main/src/eventloop.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/eventloop.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/eventloop.cc -o CMakeFiles/Server.dir/Main/src/eventloop.s

CMakeFiles/Server.dir/Main/src/eventloopthread.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/eventloopthread.o: ../Main/src/eventloopthread.cc
CMakeFiles/Server.dir/Main/src/eventloopthread.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/Server.dir/Main/src/eventloopthread.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/eventloopthread.o -MF CMakeFiles/Server.dir/Main/src/eventloopthread.o.d -o CMakeFiles/Server.dir/Main/src/eventloopthread.o -c /home/boyi/WebServer/Main/src/eventloopthread.cc

CMakeFiles/Server.dir/Main/src/eventloopthread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/eventloopthread.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/eventloopthread.cc > CMakeFiles/Server.dir/Main/src/eventloopthread.i

CMakeFiles/Server.dir/Main/src/eventloopthread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/eventloopthread.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/eventloopthread.cc -o CMakeFiles/Server.dir/Main/src/eventloopthread.s

CMakeFiles/Server.dir/Main/src/main.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/main.o: ../Main/src/main.cc
CMakeFiles/Server.dir/Main/src/main.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/Server.dir/Main/src/main.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/main.o -MF CMakeFiles/Server.dir/Main/src/main.o.d -o CMakeFiles/Server.dir/Main/src/main.o -c /home/boyi/WebServer/Main/src/main.cc

CMakeFiles/Server.dir/Main/src/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/main.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/main.cc > CMakeFiles/Server.dir/Main/src/main.i

CMakeFiles/Server.dir/Main/src/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/main.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/main.cc -o CMakeFiles/Server.dir/Main/src/main.s

CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o: ../Main/src/tcpconnectionptr.cc
CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o -MF CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o.d -o CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o -c /home/boyi/WebServer/Main/src/tcpconnectionptr.cc

CMakeFiles/Server.dir/Main/src/tcpconnectionptr.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/tcpconnectionptr.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/tcpconnectionptr.cc > CMakeFiles/Server.dir/Main/src/tcpconnectionptr.i

CMakeFiles/Server.dir/Main/src/tcpconnectionptr.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/tcpconnectionptr.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/tcpconnectionptr.cc -o CMakeFiles/Server.dir/Main/src/tcpconnectionptr.s

CMakeFiles/Server.dir/Main/src/tcpserver.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/tcpserver.o: ../Main/src/tcpserver.cc
CMakeFiles/Server.dir/Main/src/tcpserver.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/Server.dir/Main/src/tcpserver.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/tcpserver.o -MF CMakeFiles/Server.dir/Main/src/tcpserver.o.d -o CMakeFiles/Server.dir/Main/src/tcpserver.o -c /home/boyi/WebServer/Main/src/tcpserver.cc

CMakeFiles/Server.dir/Main/src/tcpserver.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/tcpserver.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/tcpserver.cc > CMakeFiles/Server.dir/Main/src/tcpserver.i

CMakeFiles/Server.dir/Main/src/tcpserver.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/tcpserver.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/tcpserver.cc -o CMakeFiles/Server.dir/Main/src/tcpserver.s

CMakeFiles/Server.dir/Main/src/thread.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/Main/src/thread.o: ../Main/src/thread.cc
CMakeFiles/Server.dir/Main/src/thread.o: CMakeFiles/Server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/Server.dir/Main/src/thread.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Server.dir/Main/src/thread.o -MF CMakeFiles/Server.dir/Main/src/thread.o.d -o CMakeFiles/Server.dir/Main/src/thread.o -c /home/boyi/WebServer/Main/src/thread.cc

CMakeFiles/Server.dir/Main/src/thread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/Main/src/thread.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyi/WebServer/Main/src/thread.cc > CMakeFiles/Server.dir/Main/src/thread.i

CMakeFiles/Server.dir/Main/src/thread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/Main/src/thread.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyi/WebServer/Main/src/thread.cc -o CMakeFiles/Server.dir/Main/src/thread.s

# Object files for target Server
Server_OBJECTS = \
"CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o" \
"CMakeFiles/Server.dir/Main/src/acceptor.o" \
"CMakeFiles/Server.dir/Main/src/channel.o" \
"CMakeFiles/Server.dir/Main/src/echo.o" \
"CMakeFiles/Server.dir/Main/src/epoller.o" \
"CMakeFiles/Server.dir/Main/src/eventloop.o" \
"CMakeFiles/Server.dir/Main/src/eventloopthread.o" \
"CMakeFiles/Server.dir/Main/src/main.o" \
"CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o" \
"CMakeFiles/Server.dir/Main/src/tcpserver.o" \
"CMakeFiles/Server.dir/Main/src/thread.o"

# External object files for target Server
Server_EXTERNAL_OBJECTS =

Server: CMakeFiles/Server.dir/Main/src/EventLoopThreadPool.o
Server: CMakeFiles/Server.dir/Main/src/acceptor.o
Server: CMakeFiles/Server.dir/Main/src/channel.o
Server: CMakeFiles/Server.dir/Main/src/echo.o
Server: CMakeFiles/Server.dir/Main/src/epoller.o
Server: CMakeFiles/Server.dir/Main/src/eventloop.o
Server: CMakeFiles/Server.dir/Main/src/eventloopthread.o
Server: CMakeFiles/Server.dir/Main/src/main.o
Server: CMakeFiles/Server.dir/Main/src/tcpconnectionptr.o
Server: CMakeFiles/Server.dir/Main/src/tcpserver.o
Server: CMakeFiles/Server.dir/Main/src/thread.o
Server: CMakeFiles/Server.dir/build.make
Server: CMakeFiles/Server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/boyi/WebServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable Server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Server.dir/build: Server
.PHONY : CMakeFiles/Server.dir/build

CMakeFiles/Server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Server.dir/clean

CMakeFiles/Server.dir/depend:
	cd /home/boyi/WebServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/boyi/WebServer /home/boyi/WebServer /home/boyi/WebServer/build /home/boyi/WebServer/build /home/boyi/WebServer/build/CMakeFiles/Server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Server.dir/depend

