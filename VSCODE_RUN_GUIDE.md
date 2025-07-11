# JeecgBoot 在 VSCode 中的运行指南

## 项目概述
- **项目名称**: JeecgBoot 3.8.0
- **项目类型**: 基于Spring Boot的低代码开发平台
- **架构**: 前后端分离
- **后端技术栈**: Spring Boot 2.7.18, MyBatis-Plus, Apache Shiro, Redis, MySQL
- **前端技术栈**: Vue3 + Ant Design Vue

## 环境要求

### 已安装的环境
✅ **Java**: OpenJDK 17.0.15 (推荐使用Java 17，已配置)
✅ **Maven**: Apache Maven 3.9.10
✅ **MySQL**: 8.0.41 (兼容MySQL 5.7+)
✅ **Redis**: 7.2.7
✅ **Node.js**: 用于前端开发 (如需要)

### 系统服务状态
- MySQL服务：✅ 已启动
- Redis服务：✅ 已启动

## 数据库配置

### 数据库信息
- **数据库名**: `jeecg-boot`
- **用户名**: `root`
- **密码**: `123456`
- **端口**: `3306`
- **字符集**: `utf8mb4`

### 数据库初始化
数据库已成功创建并导入初始数据：
```bash
# 数据库已创建
CREATE DATABASE `jeecg-boot` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 数据已导入
mysql -u root -p123456 jeecg-boot < jeecg-boot/db/jeecgboot-mysql-5.7.sql
```

## VSCode 配置

### Java 配置 (.vscode/settings.json)
```json
{
    "java.configuration.updateBuildConfiguration": "automatic",
    "java.compile.nullAnalysis.mode": "disabled",
    "java.configuration.maven.userSettings": null,
    "java.import.maven.enabled": true,
    "java.maven.downloadSources": true,
    "java.maven.downloadJavadoc": false,
    "java.configuration.workspaceCacheLimit": 90,
    "java.sources.organizeImports.starThreshold": 99,
    "java.sources.organizeImports.staticStarThreshold": 99,
    "java.format.settings.url": null,
    "java.format.settings.profile": null,
    "java.saveActions.organizeImports": true,
    "java.project.referencedLibraries": [
        "lib/**/*.jar"
    ],
    "java.configuration.runtimes": [
        {
            "name": "JavaSE-17",
            "path": "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
            "default": true
        }
    ],
    "java.jdt.ls.vmargs": "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx2G -Xms100m -Xlog:disable"
}
```

### 启动配置 (.vscode/launch.json)
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
            "vmArgs": "-Dspring.profiles.active=dev -Dfile.encoding=UTF-8",
            "env": {
                "SPRING_PROFILES_ACTIVE": "dev"
            },
            "console": "internalConsole",
            "stopOnEntry": false,
            "cwd": "${workspaceFolder}/jeecg-boot/jeecg-module-system/jeecg-system-start"
        }
    ]
}
```

## 运行方式

### 方式一：使用 VSCode 调试器 (推荐)
1. 在 VSCode 中打开项目
2. 按 `F5` 或点击调试按钮
3. 选择 "JeecgBoot Application" 配置
4. 等待应用启动完成

### 方式二：使用 Maven 命令
```bash
# 进入启动模块目录
cd jeecg-boot/jeecg-module-system/jeecg-system-start

# 使用 Java 17 运行
JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home mvn spring-boot:run -Dspring-boot.run.profiles=dev -DskipTests
```

### 方式三：编译后运行
```bash
# 编译项目
cd jeecg-boot
JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home mvn clean package -DskipTests

# 运行 JAR 文件
cd jeecg-module-system/jeecg-system-start/target
java -jar jeecg-system-start-3.8.0.jar --spring.profiles.active=dev
```

## 应用访问

### 后端服务
- **本地访问**: http://localhost:8080/jeecg-boot/
- **API文档**: http://localhost:8080/jeecg-boot/doc.html
- **健康检查**: http://localhost:8080/jeecg-boot/actuator/health

### 默认账号
- **管理员账号**: `admin`
- **默认密码**: `123456`

### 前端应用 (如需要)
前端项目位于 `jeecgboot-vue3/` 目录：
```bash
cd jeecgboot-vue3
npm install
npm run dev
```
前端默认访问地址：http://localhost:3100

## 启动日志示例
```
2025-07-11 09:55:51.626 [main] INFO  org.jeecg.JeecgSystemApplication:41 -
----------------------------------------------------------
	Application Jeecg-Boot is running! Access URLs:
	Local: 		http://localhost:8080/jeecg-boot/
	External: 	http://10.255.42.170:8080/jeecg-boot/
	Swagger文档: 	http://10.255.42.170:8080/jeecg-boot/doc.html
----------------------------------------------------------
```

## 常见问题

### 1. Java 版本问题
如果遇到编译错误，确保使用 Java 17：
```bash
# 检查 Java 版本
java -version

# 如果版本不对，设置 JAVA_HOME
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
```

### 2. 数据库连接问题
检查 MySQL 服务状态：
```bash
brew services list | grep mysql
```

### 3. Redis 连接问题
检查 Redis 服务状态：
```bash
brew services list | grep redis
```

### 4. 端口占用问题
如果 8080 端口被占用：
```bash
# 查看端口占用
lsof -i :8080

# 修改配置文件中的端口
# 编辑 application-dev.yml 中的 server.port
```

## 项目结构

```
JeecgBoot/
├── jeecg-boot/                    # 后端项目
│   ├── jeecg-boot-base-core/      # 核心基础包
│   ├── jeecg-module-system/       # 系统模块
│   │   ├── jeecg-system-api/      # 系统API
│   │   ├── jeecg-system-biz/      # 系统业务逻辑
│   │   └── jeecg-system-start/    # 启动模块 ⭐
│   ├── jeecg-server-cloud/        # 微服务模块
│   └── db/                        # 数据库脚本
├── jeecgboot-vue3/                # 前端Vue3项目
└── .vscode/                       # VSCode配置
    ├── settings.json              # Java环境配置
    └── launch.json                # 调试配置
```

## 开发建议

1. **使用 VSCode 插件**:
   - Extension Pack for Java
   - Spring Boot Extension Pack
   - MySQL (如需数据库管理)

2. **代码格式化**:
   项目已配置自动格式化，保存时会自动整理导入

3. **热重载**:
   开发时建议使用 `spring-boot-devtools` 实现热重载

4. **日志查看**:
   应用日志会在 VSCode 终端中显示，便于调试

## 成功标志

当看到以下日志时，表示应用启动成功：
- ✅ 数据库连接成功
- ✅ Redis连接成功  
- ✅ Flyway数据库迁移完成
- ✅ Quartz定时任务启动
- ✅ Undertow服务器启动在8080端口
- ✅ 显示访问地址信息

---

**注意**: 此指南基于 macOS 环境配置，其他操作系统可能需要调整路径和命令。
