import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/home_screen.dart';
import 'package:quick_art/src/shared/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: QuickArtApp()));
}

class QuickArtApp extends ConsumerWidget {
  const QuickArtApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'QuickArt',
      theme: AppTheme.lightTheme, // 使用统一的明亮主题
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
