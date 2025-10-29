#!/bin/bash

# 检查是否在 Refi 项目目录中
if [ ! -d "src" ] && [ ! -d "include" ]; then
    echo "警告：当前目录可能不是 Refi 项目根目录"
    echo "请确保在 Refi 文件夹内运行此脚本"
    read -p "是否继续？(y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 创建目录结构
mkdir -p include src web/css web/js web/assets models tests data

# 创建头文件
touch include/FoodItem.h
touch include/DatabaseManager.h
touch include/HttpServer.h
touch include/FoodRecognizer.h
touch include/Config.h

# 创建源文件
touch src/main.cpp
touch src/FoodItem.cpp
touch src/DatabaseManager.cpp
touch src/HttpServer.cpp
touch src/FoodRecognizer.cpp
touch src/Config.cpp

# 创建前端文件
touch web/index.html
touch web/css/style.css
touch web/css/mobile.css
touch web/js/app.js
touch web/js/api.js

# 创建配置文件（如果不存在）
[ ! -f "CMakeLists.txt" ] && touch CMakeLists.txt
[ ! -f "config.json" ] && touch config.json
[ ! -f ".gitignore" ] && touch .gitignore
[ ! -f "README.md" ] && touch README.md

# 创建测试文件
touch tests/test_fooditem.cpp
touch tests/test_database.cpp

# 创建数据目录
touch data/refi_database.db

# 创建模型占位文件
touch models/food_detection.onnx

# 如果 CMakeLists.txt 为空，则填充基础内容
if [ ! -s "CMakeLists.txt" ]; then
    echo "cmake_minimum_required(VERSION 3.15)" > CMakeLists.txt
    echo "project(Refi)" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "set(CMAKE_CXX_STANDARD 17)" >> CMakeLists.txt
    echo "set(CMAKE_CXX_STANDARD_REQUIRED ON)" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "# 查找依赖包" >> CMakeLists.txt
    echo "find_package(OpenCV REQUIRED)" >> CMakeLists.txt
    echo "find_package(Threads REQUIRED)" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "# 包含目录" >> CMakeLists.txt
    echo "include_directories(include)" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "# 添加可执行文件" >> CMakeLists.txt
    echo "add_executable(refi" >> CMakeLists.txt
    echo "    src/main.cpp" >> CMakeLists.txt
    echo "    src/FoodItem.cpp" >> CMakeLists.txt
    echo "    src/DatabaseManager.cpp" >> CMakeLists.txt
    echo "    src/HttpServer.cpp" >> CMakeLists.txt
    echo "    src/FoodRecognizer.cpp" >> CMakeLists.txt
    echo "    src/Config.cpp" >> CMakeLists.txt
    echo ")" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "# 链接库" >> CMakeLists.txt
    echo "target_link_libraries(refi" >> CMakeLists.txt
    echo "    \${OpenCV_LIBS}" >> CMakeLists.txt
    echo "    \${CMAKE_THREAD_LIBS_INIT}" >> CMakeLists.txt
    echo "    sqlite3" >> CMakeLists.txt
    echo ")" >> CMakeLists.txt
    echo "" >> CMakeLists.txt
    echo "# 编译器选项" >> CMakeLists.txt
    echo "target_compile_options(refi PRIVATE -Wall -Wextra)" >> CMakeLists.txt
fi

# 如果 .gitignore 为空，则填充基础内容
if [ ! -s ".gitignore" ]; then
    echo "build/" > .gitignore
    echo "*.o" >> .gitignore
    echo "*.so" >> .gitignore
    echo "*.a" >> .gitignore
    echo "*.db" >> .gitignore
    echo "*.onnx" >> .gitignore
    echo ".DS_Store" >> .gitignore
    echo "*.log" >> .gitignore
fi

# 如果 README.md 为空，则填充基础内容
if [ ! -s "README.md" ]; then
    echo "# Refi - 智能食品管理应用" > README.md
    echo "" >> README.md
    echo "基于 C++ 开发的食品识别和管理 Web 应用。" >> README.md
    echo "" >> README.md
    echo "## 功能特性" >> README.md
    echo "- 食品图像识别" >> README.md
    echo "- 食品信息管理" >> README.md
    echo "- 过期提醒" >> README.md
    echo "- 手机端适配" >> README.md
    echo "" >> README.md
    echo "## 构建说明" >> README.md
    echo "\`\`\`bash" >> README.md
    echo "mkdir build && cd build" >> README.md
    echo "cmake .." >> README.md
    echo "make" >> README.md
    echo "\`\`\`" >> README.md
    echo "" >> README.md
    echo "## 项目结构" >> README.md
    echo "参见项目文档。" >> README.md
fi

echo "Refi 项目结构创建/更新完成！"