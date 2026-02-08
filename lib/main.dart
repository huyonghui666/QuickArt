import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/config/config_provider.dart';
import 'package:quick_art/core/error/setup_error_handling.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/localization/notifiers/locale_provider.dart';
import 'package:quick_art/core/router/router.dart';
import 'package:quick_art/core/theme/app_theme.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // 必须先初始化 Flutter 绑定，才能读取 ProviderContainer
  WidgetsFlutterBinding.ensureInitialized();

  // 创建一个 ProviderContainer 来读取配置
  // ProviderContainer 是 Riverpod 状态管理的"仓库"，通常由 ProviderScope 自动管理。
  // 但在这里，因为我们需要在 runApp 之前（也就是 UI 构建之前）就读取配置（Sentry 需要这些配置），
  // 所以我们手动创建了一个容器。
  final container = ProviderContainer();
  final config = container.read(appConfigProvider);

  await SentryFlutter.init(
    (options) {
      options.dsn = config.sentryDsn;
      options.tracesSampleRate = config.tracesSampleRate;
      options.environment = config.environment.shortName;

      // 可选：崩溃附截图、自动面包屑等
      options.attachScreenshot = true;
      options.enableAutoNativeBreadcrumbs = true;
    },

    appRunner: () async {
      await setupErrorHandling();
      runApp(
        // UncontrolledProviderScope 用于将我们上面手动创建的 container 注入到 Flutter 的 Widget 树中。
        // 这样，整个应用就可以复用这个 container 里的状态（比如我们刚刚读取的 appConfigProvider），
        // 而不是重新创建一个新的（那样会导致配置状态丢失或重复初始化）。
        UncontrolledProviderScope(
          container: container,
          child: const QuickArtApp(),
        ),
      );
    },
  );
}

class QuickArtApp extends ConsumerStatefulWidget {
  const QuickArtApp({super.key});

  @override
  ConsumerState<QuickArtApp> createState() => _QuickArtAppState();
}

class _QuickArtAppState extends ConsumerState<QuickArtApp> {
  @override
  void initState() {
    super.initState();
    // Initialize WebSocket connection on app startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(webSocketNotifierProvider.notifier).connect();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'QuickArt',
      theme: AppTheme.lightTheme, // 使用统一的明亮主题
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
