# 异步任务架构 — 原理说明

QuickArt 通过向后端服务器提交任务并异步等待结果来生成图片和视频。本文档解释为什么采用这种设计、它解决了什么问题，以及做出了哪些取舍。

---

## 问题所在

AI 图片和视频生成需要数秒到数分钟不等。如果使用同步 HTTP 请求（即 App 发送提示词后等待响应中的图片），会导致：

1. 在网络较慢或服务器繁忙时请求超时。
2. 用户在等待期间无法进行任何其他操作。
3. 如果用户将 App 切到后台或连接中途断开，结果将丢失。

简单的"每隔 N 秒轮询"方案虽然能避免超时，但会浪费电量并增加延迟。

---

## 解决方案

QuickArt 采用**提交后订阅**模式：

```
用户点击绘制
      │
      ▼
POST /images/mock-generate  ──►  后端将任务加入队列
      │                                │
      │  返回 { taskId }               │ 异步处理
      ▼                                │
WebSocket.subscribeTask(taskId)        │
      │                                │
      │  ◄──── WS 事件: success ───────┘
      ▼
GenerationResultModel 发出事件
      │
      ▼
WaitingScreen 退出，底部弹窗显示图片
```

**第一步 — 提交。** `TextToImageRemoteDataSource` 向后端 POST `{"prompt": "..."}` 请求。后端将任务加入队列并立即返回 `{"taskId": "abc123"}`。HTTP 往返耗时极短（< 1 秒）。

**第二步 — 订阅。** `WebSocketNotifier.subscribeTask(taskId)` 通过持久 WebSocket 连接发送 `{"event": "subscribe", "taskId": "abc123"}`。后端由此得知，任务完成后需将结果推送给该客户端。

**第三步 — 等待。** `WaitingScreen` 监听 `generationEventProvider`，这是一个由 `generationEventController` 支撑的广播流。当 WebSocket 收到 `{"event": "success", "taskId": "abc123", "imageUrl": "..."}` 时，`WebSocketNotifier._handleMessage` 解析消息，创建 `GenerationResultModel` 并将其加入流中。

**第四步 — 交付。** `WaitingScreen._handleEvent` 检查传入的 `taskId` 是否与当前任务匹配。匹配且成功时，退出当前路由并触发 `ShowBottomSheetNotifier` 显示图片；失败时，显示带有重试按钮的错误视图。

---

## 断线重连后的持久化

如果 WebSocket 断开（网络切换、App 切到后台），待处理的任务 ID 会以 `pending_tasks` 为键存储在 `SharedPreferences` 中。重新连接后，`WebSocketNotifier._restorePendingSubscriptions` 会为所有已存储的任务 ID 重新发送订阅消息。这意味着在网络断开前提交的任务，在重新连接后仍能收到结果。

任务提交时也会以 `processing` 状态写入本地 SQLite 数据库（`DatabaseHelper`）。结果到达后，数据库记录会更新为 `success` 或 `failed`。工作坊标签页正是通过读取该数据库来展示任务历史。

---

## 取舍

**此设计的优势：**
- HTTP 响应快速（不阻塞在生成时间上）。
- 对网络断开具有韧性——待处理任务在重连后依然有效。
- 用户可以将 App 切到后台；WebSocket 重连后会自动交付结果。

**此设计的代价：**
- 涉及更多组件：HTTP + WebSocket + 本地数据库 + SharedPreferences 共同参与同一个流程。
- WebSocket 是单一全局连接（`keepAlive: true`），所有功能（图片、视频、首尾帧）共用。某个功能的消息处理出现 bug 可能影响其他功能。
- 任务 ID 在 `WaitingScreen._processEvent` 中通过字符串相等性匹配。如果同时有两个任务在进行（例如用户打开了两个 WaitingScreen），两个界面都会收到所有事件并按 `taskId` 过滤。逻辑上是正确的，但意味着每个事件都会被所有活跃的 WaitingScreen 处理。

---

## 艺术风格仅在客户端生效

所选的 `ArtStyle` 会改变 `HomeScreen` 中的背景图片和风格标签 UI，但**不会包含在向后端发送的 POST 请求中**。当前 API 只接受 `{"prompt": "..."}`。如需将风格传给后端，请在 `TextToImageRemoteDataSource.submitTextToImageTask` 中添加该字段并更新 API 协议。

---

## 相关文档

- [参考：图片生成](reference-image-generation.md)
- [操作指南：生成图片](howto-generate-image.md)
