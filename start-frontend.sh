#!/bin/bash

echo "=== JeecgBoot Vue3 前端项目启动 ==="
echo

# 检查Node.js版本
echo "1. 检查Node.js版本："
node -v
echo

# 进入前端项目目录
cd jeecgboot-vue3

echo "2. 检查项目依赖："
if [ -d "node_modules" ]; then
    echo "依赖已安装 ✓"
else
    echo "依赖未安装，正在安装..."
    npm install
fi
echo

echo "3. 检查环境配置："
echo "端口配置: $(grep VITE_PORT .env)"
echo "后端API地址: $(grep VITE_GLOB_DOMAIN_URL .env.development)"
echo

echo "4. 启动开发服务器..."
echo "前端将在 http://localhost:3100 启动"
echo "请确保后端服务已在 http://localhost:8080/jeecg-boot 运行"
echo

# 启动开发服务器
npm run dev
