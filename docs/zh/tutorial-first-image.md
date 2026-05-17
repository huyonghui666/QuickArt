# 教程：用 QuickArt 生成你的第一张 AI 图片

你将通过追踪一个提示词从输入框到最终图片显示在屏幕上的完整流程，深入理解图片生成的工作原理。学完本教程，你将清楚地知道在需要修改图片生成方式、风格或显示效果时，应该改哪些文件。

## 你需要准备

- Flutter SDK 3.x
- Dart SDK 3.9+
- 一个正在运行的 QuickArt 后端（或使用模拟端点——开发环境默认启用 `/images/mock-generate`）
- 已克隆仓库并执行过 `flutter pub get`

## 第一步：运行 App，查看 Home 界面

```bash
flutter run
```

App 打开后默认显示 Home 标签页，你会看到：
- 深色背景图（选择艺术风格后会改变）
- 顶部的文字输入框
- 一排选项标签（描述、添加图片、1:1、历史）
- 横向滚动的艺术风格标签
- 灵感模板网格
- 底部悬浮的"绘制"按钮

背景图来自 [lib/features/home/presentation/notifiers/art_style_notifier.dart](../../lib/features/home/presentation/notifiers/art_style_notifier.dart) 中的 `ArtStyleNotifier`。默认风格为 `ArtStyle.noStyle`，加载 `CdnAssets.bgNoStyle`。

## 第二步：输入提示词并点击绘制

在输入框中输入 `"a watercolor painting of a mountain lake"`，然后点击绘制按钮。

刚才发生了什么：

1. `HomeScreen` 读取 `promptProvider('textToImage').text`——即当前输入框的值。
2. 调用 `context.pushNamed('Wait', pathParameters: {'taskType': 'image'}, queryParameters: {'prompt': prompt})`。
3. [lib/core/router/router.dart](../../lib/core/router/router.dart) 中的路由匹配 `/wait/image`，构建 `WaitingScreen(taskType: 'image', prompt: 'a watercolor painting...')`。

现在你进入了等待界面，粒子动画正在播放。

## 第三步：观察 HTTP 请求发出

打开终端。如果 `config_dev.dart` 中的 `logNetworkRequests` 为 `true`（默认开启），Dio 会打印请求日志：

```
POST http://192.168.147.214:8080/api/v1/images/mock-generate
Body: {"prompt":"a watercolor painting of a mountain lake"}
Response: {"taskId":"abc-123-xyz"}
```

这发生在 [lib/features/home/presentation/notifiers/image_generation_provider.dart](../../lib/features/home/presentation/notifiers/image_generation_provider.dart) 的 `ImageGenerationNotifier._startGeneration` 中。通知器调用 `TextToGenerateImageUseCase.execute(prompt)`，后者调用仓库，仓库再调用数据源。

后端返回 `taskId`，通知器将其存储为 `AsyncData(ImageGenerationTask(taskId: 'abc-123-xyz'))`。

## 第四步：观察 WebSocket 订阅

存储任务后，通知器立即调用：

```dart
ref.read(webSocketNotifierProvider.notifier)
   .subscribeTask(task.taskId, type: GenerateTaskType.image);
```

[lib/core/websocket/websocket_provider.dart](../../lib/core/websocket/websocket_provider.dart) 中的 `WebSocketNotifier` 发送：

```json
{"event": "subscribe", "taskId": "abc-123-xyz"}
```

后端由此得知需要将结果推送给该客户端。任务 ID 同时保存到 `SharedPreferences`，以便在断线重连后恢复。

## 第五步：结果到达

后端生成完成后，发送：

```json
{"event": "success", "taskId": "abc-123-xyz", "imageUrl": "https://cdn.example.com/images/abc-123-xyz.jpg"}
```

`WebSocketNotifier._handleMessage` 解析消息，创建 `GenerationResultModel` 并将其加入 `generationEventController`。`generationEventProvider` 流发出该模型。

`WaitingScreen` 通过 `ref.listen(generationEventProvider, ...)` 监听。它收到事件后，检查 `taskId == 'abc-123-xyz'`，由于 `event == 'success'`：

1. 调用 `context.pop()` 关闭等待界面。
2. 延迟 300ms（避免动画卡顿）后，调用 `ShowBottomSheetNotifier.trigger(imageUrl, BottomSheetType.image)`。

## 第六步：查看图片

`GeneratedImageBottomSheet` 从底部滑出，以 1:1 正方形显示你的图片。分享按钮（保存、TikTok、Instagram、Facebook）已显示，但尚未接入真实操作。

图片由 `CachedNetworkImage` 加载——会缓存到磁盘，相同 URL 下次加载时立即显示。

## 你学到了什么

你现在理解了完整的图片生成流程：

```
HomeScreen（提示词输入）
  → WaitingScreen（任务提交 + WebSocket 等待）
    → ImageGenerationNotifier（HTTP POST → taskId）
    → WebSocketNotifier（订阅 → 结果事件）
    → generationEventProvider（广播流）
  → GeneratedImageBottomSheet（显示结果）
```

**需要修改时，去哪里找：**

| 想要修改的内容 | 对应位置 |
|----------------|----------|
| 将艺术风格加入 API 请求 | `TextToImageRemoteDataSource.submitTextToImageTask` |
| 更换后端端点 | `TextToImageRemoteDataSource`（第 26 行） |
| 添加新的艺术风格 | `art_style_notifier.dart` 中的 `ArtStyle` 枚举 |
| 修改等待界面动画 | `lib/core/widgets/loading_animation.dart` 中的 `LoadingAnimation` |
| 接入真实的保存/分享操作 | `GeneratedImageBottomSheet._buildSocialButton` |
| 修改重连延迟 | `WebSocketNotifier._reconnect`（当前为 5 秒） |

## 下一步

- [操作指南：生成图片](howto-generate-image.md) — 日常使用的任务导向指南
- [参考：图片生成](reference-image-generation.md) — 完整的 API 接口说明
- [原理说明：异步任务架构](explanation-async-task-architecture.md) — 为什么选择提交后订阅的设计
