#!/bin/bash

echo "=== JeecgBoot F5调试问题诊断 ==="
echo

echo "1. 检查Java版本配置："
echo "系统默认Java版本："
java -version
echo

echo "配置的Java 17版本："
/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home/bin/java -version
echo

echo "2. 检查Maven配置："
cd jeecg-boot
echo "Maven版本："
mvn -version
echo

echo "3. 检查数据库连接："
mysql -u root -p123456 -e "SELECT 'Database connection OK' as status;" jeecg-boot 2>/dev/null || echo "数据库连接失败"
echo

echo "4. 检查Redis连接："
redis-cli ping 2>/dev/null || echo "Redis连接失败"
echo

echo "5. 检查项目编译状态："
if [ -d "jeecg-module-system/jeecg-system-start/target/classes" ]; then
    echo "项目已编译 ✓"
else
    echo "项目未编译 ✗"
fi
echo

echo "6. 检查主启动类："
if [ -f "jeecg-module-system/jeecg-system-start/src/main/java/org/jeecg/JeecgSystemApplication.java" ]; then
    echo "主启动类存在 ✓"
else
    echo "主启动类不存在 ✗"
fi
echo

echo "=== 诊断完成 ==="
echo "如果所有检查都通过，现在可以尝试在VSCode中按F5启动调试。"
echo "如果仍有问题，请检查VSCode的Java扩展是否正确安装和配置。"
