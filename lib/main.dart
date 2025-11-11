import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/presentation/screens/home_screen.dart';
import 'package:quick_art/src/shared/theme/app_theme.dart';
import 'package:quick_art/src/shared/theme/theme_notifier.dart';

void main() {
  runApp(
    const ProviderScope(
      child: QuickArtApp(),
    ),
  );
}

class QuickArtApp extends ConsumerWidget {
  const QuickArtApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(currentThemeProvider);

    return MaterialApp(
      title: 'Flutter统一主题演示',
      theme: theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeNotifierProvider),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }


// @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter统一主题演示',
  //     theme: theme,
  //     darkTheme: AppTheme.darkTheme,
  //     themeMode: ref.watch(themeNotifierProvider),
  //     home: const MyHomePage(title: 'Flutter统一主题演示'),
  //     debugShowCheckedModeBanner: false,
  //   );

    // return MaterialApp(
    //   title: 'QuickArt',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: ColorScheme.fromSeed(
    //       seedColor: Colors.purple,
    //       brightness: Brightness.dark,
    //     ),
    //     scaffoldBackgroundColor: Colors.black,
    //     appBarTheme: const AppBarTheme(
    //       backgroundColor: Colors.black,
    //       foregroundColor: Colors.white,
    //     ),
    //   ),
    //   home: const HomeScreen(),
    // );
  // }
}
