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
  await SentryFlutter.init(
    (options) {
      // TODO: Replace with your actual Sentry DSN
      options.dsn = 'https://978a9c75528df7c5baa40634fb4ec54e@o4510808410226688.ingest.us.sentry.io/4510808535269376';
      // 将 tracesSampleRate 设置为 1.0 可捕获 100% 的事务进行追踪。
      // 我们建议在生产环境中调整此值(为0.5等)。
      options.tracesSampleRate = 1.0;
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
