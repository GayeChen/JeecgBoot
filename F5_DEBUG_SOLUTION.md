# JeecgBoot F5调试问题解决方案

## 问题分析

您的JeecgBoot项目F5调试问题主要由以下几个版本不匹配导致：

1. **Java版本不一致**：
   - 系统默认：Java 23
   - VSCode配置：Java 17
   - Maven项目原配置：Java 1.8
   - Maven运行时：Java 24

2. **配置不匹配**：VSCode的launch.json配置需要优化

## 已修复的问题

### 1. 更新Maven项目Java版本
已将 `jeecg-boot/pom.xml` 中的Java版本从1.8更新为17：
```xml
<java.version>17</java.version>
```

### 2. 优化VSCode调试配置
已更新 `.vscode/launch.json`：
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "JeecgBoot Application",
            "request": "launch",
            "mainClass": "org.jeecg.JeecgSystemApplication",
            "projectName": "jeecg-system-start",
            "args": "",
            "vmArgs": "-Dspring.profiles.active=dev -Dfile.encoding=UTF-8 -Xmx2048m -Xms512m",
            "env": {
                "SPRING_PROFILES_ACTIVE": "dev",
                "JAVA_HOME": "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
            },
            "console": "internalConsole",
            "stopOnEntry": false,
            "cwd": "${workspaceFolder}/jeecg-boot/jeecg-module-system/jeecg-system-start"
        }
    ]
}
```

### 3. 项目重新编译
已使用Java 17重新编译项目，编译成功。

## 验证结果

✅ Java 17配置正确  
✅ 数据库连接正常  
✅ Redis连接正常  
✅ 项目编译成功  
✅ 主启动类存在  
✅ VSCode配置已优化  

## 使用方法

### 方法一：VSCode F5调试（推荐）
1. 在VSCode中打开项目
2. 按 `F5` 键或点击调试按钮
3. 选择 "JeecgBoot Application" 配置
4. 等待应用启动完成

### 方法二：命令行启动
```bash
cd jeecg-boot/jeecg-module-system/jeecg-system-start
JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home mvn spring-boot:run -Dspring-boot.run.profiles=dev -DskipTests
```

### 方法三：直接运行JAR
```bash
cd jeecg-boot
JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home mvn clean package -DskipTests
cd jeecg-module-system/jeecg-system-start/target
java -jar jeecg-system-start-3.8.0.jar --spring.profiles.active=dev
```

## 访问地址

启动成功后，可以通过以下地址访问：

- **后端API**: http://localhost:8080/jeecg-boot/
- **API文档**: http://localhost:8080/jeecg-boot/doc.html
- **健康检查**: http://localhost:8080/jeecg-boot/actuator/health

## 默认账号

- **用户名**: admin
- **密码**: 123456

## 可能的其他问题

如果F5调试仍然有问题，请检查：

1. **VSCode Java扩展**：
   - Extension Pack for Java
   - Spring Boot Extension Pack

2. **端口占用**：
   ```bash
   lsof -i :8080
   ```

3. **清理VSCode工作区**：
   - 重启VSCode
   - 清理Java工作区缓存

4. **Maven依赖**：
   ```bash
   cd jeecg-boot
   mvn clean install -DskipTests
   ```

## 成功启动标志

当看到以下日志时，表示启动成功：
```
Application Jeecg-Boot is running! Access URLs:
Local: 		http://localhost:8080/jeecg-boot/
External: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/
Swagger文档: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/doc.html
```

## 故障排除

如果遇到问题，可以运行诊断脚本：
```bash
./test-debug.sh
```

这个脚本会检查所有关键配置项，帮助快速定位问题。
