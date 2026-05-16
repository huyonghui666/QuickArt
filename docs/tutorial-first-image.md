# Tutorial: Your First AI Image with QuickArt

You'll build a working understanding of the image generation flow by tracing a single prompt from the text field all the way to the generated image on screen. By the end, you'll know exactly which files to touch when you need to change how images are generated, styled, or displayed.

## What you'll need

- Flutter SDK 3.x installed
- Dart SDK 3.9+
- A running QuickArt backend (or the mock endpoint — the app ships with `/images/mock-generate` enabled by default in dev)
- The repo cloned and `flutter pub get` run

## Step 1: Run the app and see the Home screen

```bash
flutter run
```

The app opens on the Home tab. You'll see:
- A dark background image (this changes when you pick an art style)
- A text field at the top
- A row of option chips (Describe, Add Photo, 1:1, History)
- A horizontal scroll of art style chips
- A grid of inspiration templates
- A floating "Draw" button at the bottom

The background image comes from `ArtStyleNotifier` in [lib/features/home/presentation/notifiers/art_style_notifier.dart](../lib/features/home/presentation/notifiers/art_style_notifier.dart). The default style is `ArtStyle.noStyle`, which loads `CdnAssets.bgNoStyle`.

## Step 2: Type a prompt and tap Draw

Type `"a watercolor painting of a mountain lake"` in the text field and tap the Draw button.

What just happened:

1. `HomeScreen` reads `promptProvider('textToImage').text` — the current text field value.
2. It calls `context.pushNamed('Wait', pathParameters: {'taskType': 'image'}, queryParameters: {'prompt': prompt})`.
3. The router in [lib/core/router/router.dart](../lib/core/router/router.dart) matches `/wait/image` and builds `WaitingScreen(taskType: 'image', prompt: 'a watercolor painting...')`.

You're now on the waiting screen. The particle animation is playing.

## Step 3: Watch the HTTP request go out

Open your terminal. If `logNetworkRequests` is `true` in `config_dev.dart` (it is by default), Dio logs the request:

```
POST http://192.168.147.214:8080/api/v1/images/mock-generate
Body: {"prompt":"a watercolor painting of a mountain lake"}
Response: {"taskId":"abc-123-xyz"}
```

This happens inside `ImageGenerationNotifier._startGeneration` in [lib/features/home/presentation/notifiers/image_generation_provider.dart](../lib/features/home/presentation/notifiers/image_generation_provider.dart). The notifier calls `TextToGenerateImageUseCase.execute(prompt)`, which calls the repository, which calls the data source.

The backend returns a `taskId`. The notifier stores it as `AsyncData(ImageGenerationTask(taskId: 'abc-123-xyz'))`.

## Step 4: Watch the WebSocket subscription

Immediately after storing the task, the notifier calls:

```dart
ref.read(webSocketNotifierProvider.notifier)
   .subscribeTask(task.taskId, type: GenerateTaskType.image);
```

`WebSocketNotifier` in [lib/core/websocket/websocket_provider.dart](../lib/core/websocket/websocket_provider.dart) sends:

```json
{"event": "subscribe", "taskId": "abc-123-xyz"}
```

The backend now knows to push the result to this client. The task ID is also saved to `SharedPreferences` so it survives a reconnect.

## Step 5: The result arrives

When the backend finishes generating, it sends:

```json
{"event": "success", "taskId": "abc-123-xyz", "imageUrl": "https://cdn.example.com/images/abc-123-xyz.jpg"}
```

`WebSocketNotifier._handleMessage` parses this, creates a `GenerationResultModel`, and adds it to `generationEventController`. The `generationEventProvider` stream emits the model.

`WaitingScreen` is listening via `ref.listen(generationEventProvider, ...)`. It sees the event, checks that `taskId == 'abc-123-xyz'`, and since `event == 'success'`:

1. Calls `context.pop()` to dismiss the waiting screen.
2. After 300ms (to avoid animation jank), calls `ShowBottomSheetNotifier.trigger(imageUrl, BottomSheetType.image)`.

## Step 6: See the image

`GeneratedImageBottomSheet` slides up showing your image in a 1:1 square. The sharing buttons (Save, TikTok, Instagram, Facebook) are present but not yet wired to real actions.

The image is loaded by `CachedNetworkImage` — it caches to disk so the same URL loads instantly on the next view.

## What you built

You now understand the full image generation flow:

```
HomeScreen (prompt input)
  → WaitingScreen (task submission + WebSocket wait)
    → ImageGenerationNotifier (HTTP POST → taskId)
    → WebSocketNotifier (subscribe → result event)
    → generationEventProvider (broadcast stream)
  → GeneratedImageBottomSheet (display result)
```

**Where to make changes:**

| What you want to change | Where to look |
|-------------------------|---------------|
| Add art style to the API request | `TextToImageRemoteDataSource.submitTextToImageTask` |
| Change the backend endpoint | `TextToImageRemoteDataSource` (line 26) |
| Add a new art style | `ArtStyle` enum in `art_style_notifier.dart` |
| Change the waiting screen animation | `LoadingAnimation` / `ParticleAnimation` in `lib/core/widgets/loading_animation.dart` |
| Add a real save/share action | `GeneratedImageBottomSheet._buildSocialButton` |
| Change reconnect delay | `WebSocketNotifier._reconnect` (currently 5 seconds) |

## Next steps

- [How to generate an image](howto-generate-image.md) — task-focused guide for day-to-day use
- [Reference: Image generation](reference-image-generation.md) — complete API surface
- [Explanation: Async task architecture](explanation-async-task-architecture.md) — why the submit-then-subscribe design was chosen
