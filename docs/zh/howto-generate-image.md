# 操作指南：生成图片

你将向 AI 后端提交一个文字提示词，并在 App 中显示生成的图片。

## 前提条件

- 已安装 Flutter SDK 并执行过 `flutter pub get`。
- 后端服务器正在运行，地址与 `AppConfig.apiBaseUrl` 和 `AppConfig.webSocketUrl` 中的配置一致。
- 开发环境：服务器默认地址为 `http://192.168.147.214:8080/api/v1`，WebSocket 地址为 `ws://192.168.147.214:8080/ws/generation`。请修改 `lib/core/config/config_dev.dart` 以匹配你的本地服务器地址。

## 操作步骤

### 1. 打开 Home 标签页

启动 App，默认打开 Home 标签页（`/`）。顶部可以看到提示词输入框。

### 2. 输入提示词

点击提示词输入框，输入你想要生成的图片描述。

```
示例："a cyberpunk city at night with neon lights"
```

提示词存储在 `promptProvider('textToImage')` 中，由绘制按钮读取。

### 3. （可选）选择艺术风格

滚动提示词输入框下方的艺术风格标签。点击某个风格（如赛博朋克、水彩）可更换背景并应用风格标签。当前实现中风格仅影响视觉效果，不会影响后端请求。

### 4. 点击绘制按钮

屏幕底部的悬浮绘制按钮会读取当前提示词。若提示词为空，点击无效；若不为空，则跳转至：

```
/wait/image?prompt=<你的提示词>
```

此操作会将 `WaitingScreen` 推入导航栈。

### 5. 等待结果

`WaitingScreen` 立即调用 `imageGenerationNotifierProvider(prompt)`，向 `/images/mock-generate` 发送 POST 请求。后端返回 `taskId`，App 通过 WebSocket 订阅该任务。

等待期间会显示粒子动画和"创作中..."提示。你可以点击"后台运行"返回 Home 标签页，任务会在后台继续执行。

### 6. 查看生成的图片

后端通过 WebSocket 发送结果后，`WaitingScreen` 自动退出，`GeneratedImageBottomSheet` 从底部滑出并显示图片。你可以在此保存图片或分享到 TikTok、Instagram 或 Facebook。

## 验证

点击绘制后，路由变为 `/wait/image?prompt=...`。几秒后（取决于服务器负载），底部弹窗出现并显示生成的图片。若 30 秒内图片未出现，请检查 WebSocket 连接和服务器日志。

## 故障排查

**点击绘制按钮无反应**  
提示词为空。请先在输入框中输入内容。

**等待界面显示"网络错误"**  
后端不可达。检查 `config_dev.dart` 中的 `apiBaseUrl` 是否指向正在运行的服务器，以及设备是否与服务器在同一网络。

**等待界面一直不消失**  
WebSocket 未收到结果事件。请检查：
1. `config_dev.dart` 中的 `webSocketUrl` 是否正确。
2. 后端是否在 WebSocket 上发送了 `{"event": "success", "taskId": "...", "imageUrl": "..."}`。
3. WebSocket 消息中的 `taskId` 是否与 HTTP POST 返回的一致。

**App 切到后台后结果一直未到达**  
任务 ID 已持久化到 `SharedPreferences`。重新打开 App 后，`WebSocketNotifier` 会重新连接并重新订阅。后端处理完成后结果会自动到达。也可在工作坊标签页查看任务状态。

## 相关文档

- [参考：图片生成](reference-image-generation.md)
- [原理说明：异步任务架构](explanation-async-task-architecture.md)
- [教程：生成你的第一张 AI 图片](tutorial-first-image.md)
