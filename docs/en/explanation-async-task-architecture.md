# Async Task Architecture — Explanation

QuickArt generates images and videos by submitting a task to a backend server and waiting for the result asynchronously. This document explains why the app uses this design, what problem it solves, and what trade-offs it makes.

---

## The problem

AI image and video generation takes seconds to minutes. A synchronous HTTP request — where the app sends a prompt and waits for the image in the response — would:

1. Time out on slow networks or busy servers.
2. Block the user from doing anything else while waiting.
3. Lose the result if the user backgrounds the app or the connection drops mid-request.

A naive "poll every N seconds" approach avoids timeouts but wastes battery and adds latency.

---

## The approach

QuickArt uses a **submit-then-subscribe** pattern:

```
User taps Draw
      │
      ▼
POST /images/mock-generate  ──►  Backend queues task
      │                                │
      │  returns { taskId }            │ processes async
      ▼                                │
WebSocket.subscribeTask(taskId)        │
      │                                │
      │  ◄──── WS event: success ──────┘
      ▼
GenerationResultModel emitted
      │
      ▼
WaitingScreen pops, bottom sheet shows image
```

**Step 1 — Submit.** `TextToImageRemoteDataSource` POSTs `{"prompt": "..."}` to the backend. The backend queues the job and immediately returns `{"taskId": "abc123"}`. The HTTP round-trip is fast (< 1 second).

**Step 2 — Subscribe.** `WebSocketNotifier.subscribeTask(taskId)` sends `{"event": "subscribe", "taskId": "abc123"}` over the persistent WebSocket connection. The backend now knows to push the result to this client when the job finishes.

**Step 3 — Wait.** `WaitingScreen` watches `generationEventProvider`, a broadcast stream backed by `generationEventController`. When the WebSocket receives `{"event": "success", "taskId": "abc123", "imageUrl": "..."}`, `WebSocketNotifier._handleMessage` parses it, creates a `GenerationResultModel`, and adds it to the stream.

**Step 4 — Deliver.** `WaitingScreen._handleEvent` checks that the incoming `taskId` matches the current task. On match + success, it pops the route and triggers `ShowBottomSheetNotifier` to show the image. On failure, it shows an error view with a retry button.

---

## Persistence across reconnects

If the WebSocket drops (network change, app backgrounded), pending task IDs are stored in `SharedPreferences` under the key `pending_tasks`. On reconnect, `WebSocketNotifier._restorePendingSubscriptions` re-sends subscribe messages for all stored task IDs. This means a task submitted before a network drop will still deliver its result after reconnection.

The task is also written to the local SQLite database (`DatabaseHelper`) with status `processing` at submission time. When the result arrives, the database record is updated to `success` or `failed`. This is what the Workshop tab reads to show task history.

---

## Trade-offs

**What this design gains:**
- Fast HTTP response (no blocking on generation time).
- Resilient to network drops — pending tasks survive reconnects.
- User can background the app; the WebSocket reconnects and delivers the result.

**What this design gives up:**
- More moving parts: HTTP + WebSocket + local DB + SharedPreferences all involved in one flow.
- The WebSocket is a single global connection (`keepAlive: true`). All features (image, video, start-end-frame) share it. A bug in one feature's message handling can affect others.
- Task IDs are matched by string equality in `WaitingScreen._processEvent`. If two tasks are in flight simultaneously (e.g., user opens two WaitingScreens), both screens receive all events and filter by `taskId`. This works correctly but means every event is processed by every active WaitingScreen.

---

## Art style is client-side only

The selected `ArtStyle` changes the background image in `HomeScreen` and the style chip UI, but it is **not included in the POST request** to the backend. The current API only accepts `{"prompt": "..."}`. If you want to send the style to the backend, add it to `TextToImageRemoteDataSource.submitTextToImageTask` and update the API contract.

---

## Related

- [Reference: Image generation](reference-image-generation.md)
- [How to generate an image](howto-generate-image.md)
