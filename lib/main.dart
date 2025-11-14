import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/core/routing/router.dart';
import 'package:quick_art/src/shared/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: QuickArtApp()));
}

class QuickArtApp extends ConsumerWidget {
  const QuickArtApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'QuickArt',
      theme: AppTheme.lightTheme, // 使用统一的明亮主题
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
