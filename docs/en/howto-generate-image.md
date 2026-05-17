# How to Generate an Image

You'll submit a text prompt to the AI backend and display the generated image in the app.

## Prerequisites

- Flutter SDK installed and `flutter pub get` run.
- A backend server running at the URL configured in `AppConfig.apiBaseUrl` and `AppConfig.webSocketUrl`.
- For development: the server defaults to `http://192.168.147.214:8080/api/v1` and `ws://192.168.147.214:8080/ws/generation`. Update `lib/core/config/config_dev.dart` to match your local server address.

## Steps

### 1. Open the Home tab

Launch the app. The Home tab (`/`) opens by default. You'll see the prompt text field at the top.

### 2. Type a prompt

Tap the prompt text field and type a description of the image you want.

```
Example: "a cyberpunk city at night with neon lights"
```

The prompt is stored in `promptProvider('textToImage')` and read by the Draw button.

### 3. (Optional) Select an art style

Scroll the art style chips below the prompt field. Tap a style (e.g., Cyberpunk, Watercolor) to change the background and apply the style label. The style is visual-only in the current implementation — it does not affect the backend request.

### 4. Tap the Draw button

The floating Draw button at the bottom of the screen reads the current prompt. If the prompt is empty, the tap is ignored. If non-empty, it navigates to:

```
/wait/image?prompt=<your prompt>
```

This pushes `WaitingScreen` onto the navigation stack.

### 5. Wait for the result

`WaitingScreen` immediately calls `imageGenerationNotifierProvider(prompt)`, which POSTs to `/images/mock-generate`. The backend returns a `taskId`. The app subscribes to that task over WebSocket.

While waiting, you'll see a particle animation and the message "Creating...". You can tap "Run in background" to return to the Home tab — the task continues in the background.

### 6. View the generated image

When the backend sends the result over WebSocket, `WaitingScreen` pops automatically and `GeneratedImageBottomSheet` slides up showing the image. From there you can save it or share to TikTok, Instagram, or Facebook.

## Verification

After tapping Draw, the route changes to `/wait/image?prompt=...`. After a few seconds (depending on server load), the bottom sheet appears with the generated image. If the image does not appear within 30 seconds, check the WebSocket connection and server logs.

## Troubleshooting

**Draw button does nothing**
The prompt is empty. Type something in the text field first.

**"Network error" on the waiting screen**
The backend is unreachable. Check that `apiBaseUrl` in `config_dev.dart` points to a running server and that your device is on the same network.

**Waiting screen stays forever**
The WebSocket is not receiving the result event. Check:
1. `webSocketUrl` in `config_dev.dart` is correct.
2. The backend is sending `{"event": "success", "taskId": "...", "imageUrl": "..."}` on the WebSocket.
3. The `taskId` in the WebSocket message matches the one returned by the HTTP POST.

**App backgrounded, result never arrived**
The task ID is persisted in `SharedPreferences`. When you reopen the app, `WebSocketNotifier` reconnects and re-subscribes. The result will arrive once the backend finishes processing. Check the Workshop tab for task status.

## Related

- [Reference: Image generation](reference-image-generation.md)
- [Explanation: Async task architecture](explanation-async-task-architecture.md)
- [Tutorial: Your first AI image](tutorial-first-image.md)
