# QuickArt

QuickArt is a Flutter app for AI-powered image and video generation. Users type a prompt, pick an art style, and the app generates an image or video via a backend AI service. Results are delivered over a persistent WebSocket connection and displayed in a bottom sheet with sharing options.

## Features

- **Text-to-image generation** — type a prompt, pick from 19 art styles, generate an AI image
- **Text-to-video generation** — generate short AI videos from a text prompt
- **Start-end frame video** — generate a video that transitions between two images
- **Video templates** — generate videos from pre-built templates
- **Workshop** — view all past generation tasks and their results
- **Localization** — English and Chinese (Simplified) supported

## Getting Started

### Prerequisites

- Flutter SDK 3.x, Dart SDK 3.9+
- A running QuickArt backend server

### Install and run

```bash
flutter pub get
flutter run
```

The app defaults to the development config in `lib/core/config/config_dev.dart`. Update `apiBaseUrl` and `webSocketUrl` to point to your backend server.

### Build flavors

| File | Environment |
|------|-------------|
| `lib/core/config/config_dev.dart` | Development (local server, full logging) |
| `lib/core/config/config_staging.dart` | Staging |
| `lib/core/config/config_prod.dart` | Production |

The active config is selected by `lib/core/di/config/config_provider.dart`.

### Code generation

This project uses `riverpod_generator`, `freezed`, and `json_serializable`. After changing annotated files, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Architecture

QuickArt follows Clean Architecture with feature-based modules:

```
lib/
  core/           # Shared: config, DI, router, widgets, WebSocket, localization
  features/
    home/         # Image generation (text-to-image)
    tools/        # Video generation
    workshop/     # Task history (SQLite)
    setting/      # Language and app settings
    explore/      # Explore tab (placeholder)
```

Each feature has three layers:
- `data/` — remote/local data sources, models (DTOs), repository implementations
- `domain/` — entities, repository interfaces, use cases
- `presentation/` — Riverpod notifiers, screens, widgets

State management: **Riverpod** (code-generated providers via `riverpod_annotation`).  
Navigation: **go_router** with a `StatefulShellRoute` for the bottom navigation tabs.  
Error monitoring: **Sentry** (configured per environment).

## Documentation

Full documentation for the image generation feature.

**English** ([docs/](docs/)):

| Document | Quadrant | Description |
|----------|----------|-------------|
| [docs/tutorial-first-image.md](docs/tutorial-first-image.md) | Tutorial | Trace a prompt from text field to generated image — understand the full flow |
| [docs/howto-generate-image.md](docs/howto-generate-image.md) | How-to | Step-by-step guide to generating an image in the running app |
| [docs/reference-image-generation.md](docs/reference-image-generation.md) | Reference | Complete API surface: providers, notifiers, entities, data sources |
| [docs/explanation-async-task-architecture.md](docs/explanation-async-task-architecture.md) | Explanation | Why the app uses submit-then-subscribe instead of synchronous HTTP |

**中文** ([docs/zh/](docs/zh/)):

| 文档 | 类型 | 说明 |
|------|------|------|
| [docs/zh/tutorial-first-image.md](docs/zh/tutorial-first-image.md) | 教程 | 追踪提示词从输入框到图片显示的完整流程 |
| [docs/zh/howto-generate-image.md](docs/zh/howto-generate-image.md) | 操作指南 | 在运行中的 App 里生成图片的分步指南 |
| [docs/zh/reference-image-generation.md](docs/zh/reference-image-generation.md) | 参考文档 | 完整 API 接口：Provider、通知器、实体、数据源 |
| [docs/zh/explanation-async-task-architecture.md](docs/zh/explanation-async-task-architecture.md) | 原理说明 | 为什么采用提交后订阅而非同步 HTTP |

## Key dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_riverpod` | 2.6.1 | State management |
| `go_router` | 17.0.0 | Navigation |
| `dio` | 5.9.0 | HTTP client |
| `web_socket_channel` | 3.0.3 | WebSocket connection |
| `hive_flutter` | 1.1.0 | Local key-value storage |
| `sqflite` | 2.4.2 | SQLite (Workshop task history) |
| `sentry_flutter` | 9.10.0 | Error monitoring |
| `freezed` | 3.1.0 | Immutable data classes |
| `cached_network_image` | 3.4.1 | Image caching |
