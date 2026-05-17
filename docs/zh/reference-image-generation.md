# 图片生成 — 参考文档

Home 功能允许用户通过文字提示词生成 AI 图片。用户输入描述，可选择艺术风格，然后点击绘制按钮。App 将提示词提交给后端，获取任务 ID，再通过持久 WebSocket 连接等待结果。图片就绪后，底部弹窗会显示图片及分享选项。

---

## 公开接口

### HomeScreen

`lib/features/home/presentation/screens/home_screen.dart`

一个 `ConsumerStatefulWidget`，是 Home 标签页的根组件。渲染内容包括：

- 顶部区域：背景图（由所选艺术风格驱动）、提示词输入框、选项标签和艺术风格选择器。
- 固定的灵感分类标签栏（最新等）。
- 每个分类下的分页图片模板网格。
- 底部悬浮的绘制按钮。

无构造参数，由路由挂载在 `/`。

---

### ImageGenerationNotifier

`lib/features/home/presentation/notifiers/image_generation_provider.dart`

Riverpod `@riverpod` 类通知器。状态类型：`AsyncValue<ImageGenerationTask>`。

**Provider：** `imageGenerationNotifierProvider(String prompt)`

| 方法 | 说明 |
|------|------|
| `build(String prompt)` | 立即调用 `_startGeneration(prompt)` 并返回 `AsyncLoading()`。 |
| `retry()` | 调用 `ref.invalidateSelf()`，重新执行 `build` 并重新提交任务。 |

`_startGeneration` 调用 `TextToGenerateImageUseCase.execute(prompt)`，然后调用 `WebSocketNotifier.subscribeTask(taskId, type: GenerateTaskType.image)`。

**状态转换：**
```
AsyncLoading → AsyncData(ImageGenerationTask)   成功时
AsyncLoading → AsyncError(exception, stack)     失败时
```

---

### ArtStyleNotifier

`lib/features/home/presentation/notifiers/art_style_notifier.dart`

Riverpod `@riverpod` 类通知器。状态类型：`ArtStyle` 枚举值。

**Provider：** `artStyleNotifierProvider`

| 方法 | 说明 |
|------|------|
| `build()` | 返回 `ArtStyle.noStyle` 作为初始状态。 |
| `setStyle(ArtStyle style)` | 更新所选风格。 |

所选风格驱动 `HomeScreen._buildTopSection` 中的背景图。风格值**不会**发送给后端——它仅是客户端的视觉偏好。

**ArtStyle 枚举值**（共 19 个）：

| 枚举值 | 标签 |
|--------|------|
| `noStyle` | 无风格 |
| `cuteCartoon` | 可爱卡通 |
| `ancientStyle` | 古风 |
| `graffiti` | 涂鸦 |
| `popArt` | 波普艺术 |
| `vividRealism` | 唯美写实 |
| `color` | 色彩 |
| `eighties` | 80年代 |
| `showa` | 昭和 |
| `model3D` | 3D模型 |
| `photoPhotography` | 摄影 |
| `japaneseAnime` | 日系动漫 |
| `tattoo` | 纹身 |
| `retroArcade` | 复古街机 |
| `blackWhite` | 黑白 |
| `pixar` | 皮克斯 |
| `cyberpunk` | 赛博朋克 |
| `lineArt` | 线条艺术 |
| `watercolor` | 水彩 |

每个枚举值都有 `thumbnailAsset`（风格标签的 CDN 缩略图 URL）和 `backgroundAsset`（全屏背景的 CDN URL）。

---

### TemplatesNotifier

`lib/features/home/presentation/notifiers/template_notifier.dart`

Riverpod `@riverpod` 类通知器。状态类型：`AsyncValue<ImageTemplatePage>`。

**Provider：** `templatesProvider({String? category})`

| 方法 | 说明 |
|------|------|
| `build({String? category})` | 获取指定分类的第 0 页数据。 |
| `loadMore()` | 将下一页追加到当前列表。若正在加载、已无更多页或加载进行中，则为空操作。 |
| `refresh()` | 重置到第 0 页并重新获取。 |

**注意：** `InspirationCategoryType.newest` 枚举值对应后端分类字符串 `'new'`（而非 `'newest'`）。此映射在 `HomeScreen` 中调用 `loadMore()` 前完成。

---

### WaitingScreen

`lib/core/widgets/waiting_screen.dart`

生成任务进行中时显示的 `ConsumerWidget`。

**构造参数：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `taskType` | `String` | `'image'`、`'video'`、`'start_end_frame'` 或 `'template_video'` |
| `prompt` | `String` | 传递给生成通知器的提示词 |

**路由：** `/wait/:taskType?prompt=<prompt>`

该界面监听 `generationEventProvider`。当收到 `taskId` 与当前任务匹配的事件时：
- 成功：退出路由并触发 `ShowBottomSheetNotifier` 显示图片。
- 失败：显示带有重试按钮的错误视图。

用户可点击"后台运行"退出路由而不取消任务，WebSocket 订阅会持续保持。

---

### GeneratedImageBottomSheet

`lib/core/widgets/generated_image_bottom_sheet.dart`

图片生成成功后以模态底部弹窗形式显示的 `StatelessWidget`。

**构造参数：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `imageUrl` | `String` | 生成图片的 CDN URL |

以 1:1 宽高比显示图片，并提供分享按钮（保存、TikTok、Instagram、Facebook）。当前实现中分享操作仅为 UI 占位。

---

### ImageGenerationTask

`lib/features/home/domain/entities/image_generation_task.dart`

领域实体，不可变，继承 `Equatable`。

| 字段 | 类型 | 说明 |
|------|------|------|
| `taskId` | `String` | 后端返回的唯一任务标识符 |

---

### TextToGenerateImageUseCase

`lib/features/home/domain/usecases/text_to_generate_image_usecase.dart`

| 方法 | 签名 | 说明 |
|------|------|------|
| `execute` | `Future<ImageGenerationTask> execute(String prompt)` | 委托给 `ITextToImageRepository.submitTextToImageTask(prompt)` |

---

### ITextToImageRepository / TextToImageRepositoryImpl

`lib/features/home/domain/repositories/text_to_image_repository.dart`  
`lib/features/home/data/repositories/text_to_image_repository_impl.dart`

| 方法 | 签名 | 说明 |
|------|------|------|
| `submitTextToImageTask` | `Future<ImageGenerationTask> submitTextToImageTask(String prompt)` | POST 到 `/images/mock-generate`（开发环境）或 `/images/generate`（生产环境），返回任务实体 |

---

### TextToImageRemoteDataSource

`lib/features/home/data/datasources/text_to_image_remote_data_source.dart`

| 方法 | 签名 | 说明 |
|------|------|------|
| `submitTextToImageTask` | `Future<ImageGenerationTaskModel> submitTextToImageTask(String prompt)` | HTTP POST，请求体为 `{"prompt": prompt}`。非 200 响应或 Dio 错误时抛出 `NetworkException`；响应体为 null 时抛出 `DataException`。错误会上报至 Sentry。 |

**当前端点：** `/images/mock-generate`（模拟）。生产环境请改为 `/images/generate`。

---

## 错误类型

`lib/core/error/exception.dart`

| 类型 | 触发时机 |
|------|----------|
| `NetworkException` | HTTP 非 200 响应或 Dio 网络错误 |
| `DataException` | 响应体为 null |
| `UnknownException` | 其他任何异常 |

---

## 相关文档

- [操作指南：生成图片](howto-generate-image.md)
- [教程：生成你的第一张 AI 图片](tutorial-first-image.md)
- [原理说明：异步任务架构](explanation-async-task-architecture.md)
