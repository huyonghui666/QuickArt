import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/core/routing/router.dart';
import 'package:quick_art/src/shared/localization/l10n/app_localizations.dart';
import 'package:quick_art/src/shared/localization/notifiers/locale_provider.dart';
import 'package:quick_art/src/shared/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: QuickArtApp()));
}

class QuickArtApp extends ConsumerWidget {
  const QuickArtApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
