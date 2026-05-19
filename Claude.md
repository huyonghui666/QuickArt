# QuickArt Flutter Project

## Tech Stack

- **Language**: Dart
- **Framework**: Flutter
- **State Management**: Riverpod with `@riverpod` annotation (riverpod_generator)
- **Networking**: Dio
- **Design**: Material Design 3
- **Localization**: intl + ARB files (`lib/core/localization/l10n/`)
- **Icons**: SVG via `flutter_svg` — always use `SvgPicture.asset()`, never `Icon()`
- **Data Classes**: freezed for immutable models
- **Routing**: GoRouter

## Asset Rules

- Local images in `assets/`: use `Image.asset()`
- Remote images via URL: use `CachedNetworkImage`
- Local asset path constants live in `AppVideoImage` and `AppIcons`

## Architecture

Strict Clean Architecture, feature-based modules under `lib/features/`:

```
lib/features/<feature>/
  data/
    datasources/   # remote & local data sources
    models/        # JSON models (freezed or manual)
    repositories/  # repository implementations
  domain/
    entities/      # pure domain objects
    repositories/  # abstract interfaces
    usecases/
  presentation/
    notifiers/     # Riverpod notifiers (@riverpod)
    screens/
    widgets/
```

- Data sources handle raw API/DB calls only
- Repositories map models → entities
- Notifiers call use cases or repositories; no business logic in widgets
- Screens are thin; extract reusable UI into widgets

## Code Quality

- `const` everywhere it's valid — constructors, literals, widgets
- No duplicate code; extract shared logic into helpers or base classes
- Comments only when the *why* is non-obvious; no what/how comments
- No unused imports, no dead code
- Run `flutter analyze` before considering any task done; zero issues required

## Localization

- All user-facing strings go in `app_en.arb` and `app_zh.arb`
- Regenerate with `flutter gen-l10n` after editing ARB files
- Access via `AppLocalizations.of(context)!`

## Code Generation

- After editing `@riverpod` notifiers or `@freezed` models, run:
  ```
  dart run build_runner build --delete-conflicting-outputs
  ```

## Theme

- Use `AppTheme` for colors, typography, and borders — no hardcoded values
- Dark background default: `Colors.black` or `Color(0xFF1C1C1E)`
