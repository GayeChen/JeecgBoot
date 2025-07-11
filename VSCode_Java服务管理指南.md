# VSCode Java服务管理指南

## 🚀 启动Java服务的多种方式

### 方式1：使用调试面板（推荐）
1. 点击VSCode左侧的**调试图标**（🐛）
2. 在顶部下拉菜单中选择：
   - `JeecgBoot Application (Debug)` - 调试模式，可设置断点
   - `JeecgBoot Application (Run)` - 运行模式，启动更快
3. 点击**绿色播放按钮**启动

### 方式2：使用快捷键
- **F5** - 启动调试模式
- **Ctrl+F5** (Windows/Linux) 或 **Cmd+F5** (Mac) - 启动运行模式

### 方式3：使用命令面板
1. 按 `Ctrl+Shift+P` (Windows/Linux) 或 `Cmd+Shift+P` (Mac)
2. 输入并选择：
   - `Debug: Start Debugging` - 调试模式
   - `Debug: Start Without Debugging` - 运行模式

## 🛑 停止Java服务的方法

### 方法1：使用调试控制栏（最简单）
- 当服务运行时，VSCode顶部会出现调试控制栏
- 点击**红色方块停止按钮**（⏹️）即可停止服务

### 方法2：使用调试面板
- 在调试面板中点击**停止按钮**

### 方法3：使用快捷键
- **Shift+F5** - 停止当前调试会话

### 方法4：使用集成终端
- 在集成终端中按 **Ctrl+C** 停止服务

### 方法5：使用命令面板
1. 按 `Ctrl+Shift+P` 或 `Cmd+Shift+P`
2. 输入 `Debug: Stop` 并选择

## 🔄 重启Java服务

### 快速重启方法：
1. **停止服务**：使用上述任一停止方法
2. **重新启动**：使用上述任一启动方法

### 一键重启（推荐）：
1. 按 `Ctrl+Shift+P` 或 `Cmd+Shift+P`
2. 输入 `Debug: Restart` 并选择

## 📊 服务状态监控

### 查看服务状态：
- **调试控制栏**：显示当前运行状态
- **调试面板**：显示详细调试信息
- **集成终端**：显示服务日志输出
- **状态栏**：底部显示Java进程状态

### 服务启动成功标志：
```
----------------------------------------------------------
	Application Jeecg-Boot is running! Access URLs:
	Local: 		http://localhost:8080/jeecg-boot/
	External: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/
	Swagger文档: 	http://xxx.xxx.xxx.xxx:8080/jeecg-boot/doc.html
----------------------------------------------------------
```

## 🔧 高级管理技巧

### 1. 多实例管理
- 可以同时运行多个不同的Java应用
- 在调试面板中会显示所有运行的实例
- 可以分别控制每个实例的启停

### 2. 热重载配置
在 `.vscode/settings.json` 中已配置：
```json
{
    "java.configuration.updateBuildConfiguration": "automatic",
    "java.saveActions.organizeImports": true
}
```

### 3. 内存监控
- 当前配置：`-Xmx2048m -Xms512m`
- 可在调试面板中监控内存使用情况

## 🚨 常见问题解决

### 问题1：端口被占用
```bash
# 查找占用8080端口的进程
lsof -i :8080

# 杀死占用端口的进程
kill -9 <PID>
```

### 问题2：服务无法停止
1. 使用 `Shift+F5` 强制停止
2. 如果仍无法停止，在终端中：
```bash
# 查找Java进程
ps aux | grep java

# 强制杀死进程
kill -9 <PID>
```

### 问题3：重启后配置未生效
1. 停止服务
2. 按 `Ctrl+Shift+P`，输入 `Java: Reload Projects`
3. 重新启动服务

## 💡 最佳实践

### 1. 开发时推荐流程：
1. 使用**调试模式**启动（可设置断点）
2. 代码修改后，使用 `Ctrl+Shift+P` → `Debug: Restart`
3. 测试完成后，使用**停止按钮**优雅关闭

### 2. 生产环境测试：
1. 使用**运行模式**启动（性能更好）
2. 通过集成终端监控日志
3. 使用浏览器访问 http://localhost:8080/jeecg-boot/

### 3. 调试技巧：
- 在关键代码处设置断点
- 使用调试控制台查看变量值
- 利用条件断点提高调试效率

## 🎯 快捷操作总结

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 启动调试 | F5 | 调试模式启动 |
| 启动运行 | Ctrl+F5 | 运行模式启动 |
| 停止服务 | Shift+F5 | 停止当前会话 |
| 重启服务 | Ctrl+Shift+P → Debug: Restart | 重启当前会话 |
| 强制停止 | Ctrl+C (在终端) | 强制中断 |

现在您再也不需要手动杀进程了！使用这些方法可以优雅地管理您的Java服务。
