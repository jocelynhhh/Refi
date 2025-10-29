cmake_minimum_required(VERSION 3.15)
project(Refi)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找依赖包
find_package(OpenCV REQUIRED)
find_package(Threads REQUIRED)

# 包含目录
include_directories(include)

# 添加可执行文件
add_executable(refi
    src/main.cpp
    src/FoodItem.cpp
    src/DatabaseManager.cpp
    src/HttpServer.cpp
    src/FoodRecognizer.cpp
    src/Config.cpp
)

# 链接库
target_link_libraries(refi
    ${OpenCV_LIBS}
    ${CMAKE_THREAD_LIBS_INIT}
    sqlite3
)

# 编译器选项
target_compile_options(refi PRIVATE -Wall -Wextra)
