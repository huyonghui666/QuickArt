import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/error/setup_error_handling.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/localization/notifiers/locale_provider.dart';
import 'package:quick_art/core/router/router.dart';
import 'package:quick_art/core/theme/app_theme.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init((options) {
      // 从 --dart-define 读取 DSN（CI/CD 注入生产值，本地默认空或测试 DSN）
      const dsn = String.fromEnvironment('SENTRY_DSN', defaultValue: '');
      if (dsn.isNotEmpty) {
        options.dsn = dsn;
      } else {
        // 开发环境：可填测试 DSN 或留空（Sentry 不上报）
        // options.dsn = '你的测试 DSN'; // 可选，测试项目 DSN
        options.dsn = 'https://978a9c75528df7c5baa40634fb4ec54e@o4510808410226688.ingest.us.sentry.io/4510808535269376';
      }

      // 动态采样率：开发全采样，生产降采样
      const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'development');
      if (flavor == 'production') {
        options.tracesSampleRate = 0.2; // 生产 20%
      } else if (flavor == 'staging') {
        options.tracesSampleRate = 0.5; // 预发 50%
      } else {
        options.tracesSampleRate = 1.0; // 开发/测试 100%
      }

      // 环境标签（Sentry 仪表盘会显示）
      options.environment = flavor;

      // 可选：崩溃附截图、自动面包屑等
      options.attachScreenshot = true;
      options.enableAutoNativeBreadcrumbs = true;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupErrorHandling();
      runApp(const ProviderScope(child: QuickArtApp()));
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
