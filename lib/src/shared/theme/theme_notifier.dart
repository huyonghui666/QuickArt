import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/shared/theme/app_theme.dart';

// 主题状态提供者
final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());

// 当前主题数据提供者
final currentThemeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeNotifierProvider);
  switch (themeMode) {
    case ThemeMode.light:
      return AppTheme.lightTheme;
    case ThemeMode.dark:
      return AppTheme.darkTheme;
    case ThemeMode.system:
      // 根据系统设置返回主题
      return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
          ? AppTheme.darkTheme
          : AppTheme.lightTheme;
  }
});

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // 默认使用系统设置
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {


    state = mode;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  void setLightTheme() {
    state = ThemeMode.light;
  }

  void setDarkTheme() {
    state = ThemeMode.dark;
  }

  void setSystemTheme() {
    state = ThemeMode.system;
  }
}
