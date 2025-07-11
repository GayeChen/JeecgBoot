# VSCode调试启动指南

## 如何在VSCode中启动JeecgBoot调试

### 方法1：使用F5快捷键（推荐）
1. 确保您在VSCode中打开了JeecgBoot项目
2. 直接按键盘上的 **F5** 键
3. 如果弹出配置选择，选择 "JeecgBoot Application"

### 方法2：使用调试面板
1. 点击VSCode左侧活动栏的 **调试图标**（🐛虫子图标）
2. 在调试面板顶部的下拉菜单中，确保选择了 "JeecgBoot Application" 配置
3. 点击绿色的 **播放按钮**（▶️）开始调试

### 方法3：使用命令面板
1. 按 `Cmd+Shift+P`（Mac）或 `Ctrl+Shift+P`（Windows/Linux）
2. 输入 "Debug: Start Debugging"
3. 按回车，然后选择 "JeecgBoot Application" 配置

### 方法4：右键菜单启动
1. 在项目中找到主启动类文件：
   `jeecg-boot/jeecg-module-system/jeecg-system-start/src/main/java/org/jeecg/JeecgSystemApplication.java`
2. 右键点击该文件
3. 选择 "Debug Java" 或 "Run Java"

## 启动成功的标志

当看到以下日志输出时，表示启动成功：
```
----------------------------------------------------------
	Application Jeecg-Boot is running! Access URLs:
	Local: 		http://localhost:8080/jeecg-boot/
	External: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/
	Swagger文档: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/doc.html
----------------------------------------------------------
```

## 访问应用

启动成功后，可以通过以下地址访问：
- **后端API**: http://localhost:8080/jeecg-boot/
- **API文档**: http://localhost:8080/jeecg-boot/doc.html
- **默认账号**: admin / 123456

## 常见问题

如果启动失败，请检查：
1. 是否按照之前的配置修复了Java版本问题
2. MySQL和Redis服务是否正在运行
3. 8080端口是否被占用

如需帮助，可以运行诊断脚本：
```bash
./test-debug.sh
```

## 调试功能

启动后，您可以：
- 在代码中设置断点
- 单步调试
- 查看变量值
- 监控应用状态

现在请按F5键或使用上述任一方法启动调试！
