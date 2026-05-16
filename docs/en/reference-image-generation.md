# Image Generation — Reference

The Home feature lets users generate AI images from a text prompt. The user types a description, optionally picks an art style, and taps the Draw button. The app submits the prompt to the backend, receives a task ID, then waits for the result over a persistent WebSocket connection. When the image is ready, a bottom sheet shows it with sharing options.

---

## Public Surface

### HomeScreen

`lib/features/home/presentation/screens/home_screen.dart`

A `ConsumerStatefulWidget` that is the root of the Home tab. It renders:

- A top section with a background image (driven by the selected art style), the prompt text field, option chips, and the art style selector.
- A pinned tab bar for inspiration categories (Newest, etc.).
- A paginated grid of image templates per category.
- A floating Draw button at the bottom.

No constructor parameters. Mounted by the router at `/`.

---

### ImageGenerationNotifier

`lib/features/home/presentation/notifiers/image_generation_provider.dart`

A Riverpod `@riverpod` class notifier. State: `AsyncValue<ImageGenerationTask>`.

**Provider:** `imageGenerationNotifierProvider(String prompt)`

| Method | Description |
|--------|-------------|
| `build(String prompt)` | Immediately calls `_startGeneration(prompt)` and returns `AsyncLoading()`. |
| `retry()` | Calls `ref.invalidateSelf()`, which re-runs `build` and re-submits the task. |

`_startGeneration` calls `TextToGenerateImageUseCase.execute(prompt)`, then calls `WebSocketNotifier.subscribeTask(taskId, type: GenerateTaskType.image)`.

**State transitions:**
```
AsyncLoading → AsyncData(ImageGenerationTask)   on success
AsyncLoading → AsyncError(exception, stack)     on failure
```

---

### ArtStyleNotifier

`lib/features/home/presentation/notifiers/art_style_notifier.dart`

A Riverpod `@riverpod` class notifier. State: `ArtStyle` enum value.

**Provider:** `artStyleNotifierProvider`

| Method | Description |
|--------|-------------|
| `build()` | Returns `ArtStyle.noStyle` as the initial state. |
| `setStyle(ArtStyle style)` | Updates the selected style. |

The selected style drives the background image in `HomeScreen._buildTopSection`. The style value is **not** sent to the backend — it is a client-side visual preference only.

**ArtStyle enum values** (19 total):

| Value | Label |
|-------|-------|
| `noStyle` | No Style |
| `cuteCartoon` | Cute Cartoon |
| `ancientStyle` | Ancient Style |
| `graffiti` | Graffiti |
| `popArt` | Pop Art |
| `vividRealism` | Vivid Realism |
| `color` | Color |
| `eighties` | 80s |
| `showa` | Showa |
| `model3D` | 3D Model |
| `photoPhotography` | Photography |
| `japaneseAnime` | Japanese Anime |
| `tattoo` | Tattoo |
| `retroArcade` | Retro Arcade |
| `blackWhite` | Black & White |
| `pixar` | Pixar |
| `cyberpunk` | Cyberpunk |
| `lineArt` | Line Art |
| `watercolor` | Watercolor |

Each value has a `thumbnailAsset` (CDN URL for the style chip) and a `backgroundAsset` (CDN URL for the full-screen background).

---

### TemplatesNotifier

`lib/features/home/presentation/notifiers/template_notifier.dart`

A Riverpod `@riverpod` class notifier. State: `AsyncValue<ImageTemplatePage>`.

**Provider:** `templatesProvider({String? category})`

| Method | Description |
|--------|-------------|
| `build({String? category})` | Fetches page 0 for the given category. |
| `loadMore()` | Appends the next page to the current list. No-op if already loading, no more pages, or a load is in progress. |
| `refresh()` | Resets to page 0 and re-fetches. |

**Note:** The `InspirationCategoryType.newest` enum value maps to the backend category string `'new'` (not `'newest'`). This mapping is applied in `HomeScreen` before calling `loadMore()`.

---

### WaitingScreen

`lib/core/widgets/waiting_screen.dart`

A `ConsumerWidget` shown while a generation task is in progress.

**Constructor:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskType` | `String` | `'image'`, `'video'`, `'start_end_frame'`, or `'template_video'` |
| `prompt` | `String` | The prompt passed to the generation notifier |

**Route:** `/wait/:taskType?prompt=<prompt>`

The screen listens to `generationEventProvider`. When an event arrives whose `taskId` matches the current task, it either:
- Pops the route and triggers `ShowBottomSheetNotifier` (on success)
- Shows an error view with a retry button (on failure)

The user can tap "Run in background" to pop the route without cancelling the task. The WebSocket subscription persists.

---

### GeneratedImageBottomSheet

`lib/core/widgets/generated_image_bottom_sheet.dart`

A `StatelessWidget` shown as a modal bottom sheet after a successful image generation.

**Constructor:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `imageUrl` | `String` | The CDN URL of the generated image |

Displays the image in a 1:1 aspect ratio with sharing buttons (Save, TikTok, Instagram, Facebook). Sharing actions are UI-only stubs in the current implementation.

---

### ImageGenerationTask

`lib/features/home/domain/entities/image_generation_task.dart`

Domain entity. Immutable, extends `Equatable`.

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | `String` | Unique task identifier returned by the backend |

---

### TextToGenerateImageUseCase

`lib/features/home/domain/usecases/text_to_generate_image_usecase.dart`

| Method | Signature | Description |
|--------|-----------|-------------|
| `execute` | `Future<ImageGenerationTask> execute(String prompt)` | Delegates to `ITextToImageRepository.submitTextToImageTask(prompt)` |

---

### ITextToImageRepository / TextToImageRepositoryImpl

`lib/features/home/domain/repositories/text_to_image_repository.dart`  
`lib/features/home/data/repositories/text_to_image_repository_impl.dart`

| Method | Signature | Description |
|--------|-----------|-------------|
| `submitTextToImageTask` | `Future<ImageGenerationTask> submitTextToImageTask(String prompt)` | POSTs to `/images/mock-generate` (dev) or `/images/generate` (prod), returns the task entity |

---

### TextToImageRemoteDataSource

`lib/features/home/data/datasources/text_to_image_remote_data_source.dart`

| Method | Signature | Description |
|--------|-----------|-------------|
| `submitTextToImageTask` | `Future<ImageGenerationTaskModel> submitTextToImageTask(String prompt)` | HTTP POST with `{"prompt": prompt}`. Throws `NetworkException` on non-200 or Dio error. Throws `DataException` if response body is null. Errors are captured to Sentry. |

**Current endpoint:** `/images/mock-generate` (mock). Change to `/images/generate` for production.

---

## Error Types

`lib/core/error/exception.dart`

| Type | When thrown |
|------|-------------|
| `NetworkException` | HTTP non-200 response or Dio network error |
| `DataException` | Response body is null |
| `UnknownException` | Any other exception |

---

## Related

- [How to generate an image](howto-generate-image.md)
- [Tutorial: Your first AI image](tutorial-first-image.md)
- [Explanation: Async task architecture](explanation-async-task-architecture.md)
