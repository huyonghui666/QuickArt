import 'package:flutter/material.dart';

class AppTheme {
  // 主题配置常量
  static const double _borderRadius = 12.0;
  static const double _buttonBorderRadius = 8.0;
  static const double _cardElevation = 1.0;

  // 间距常量 - 建议添加
  static const EdgeInsets _buttonPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const EdgeInsets _inputPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const EdgeInsets _cardMargin = EdgeInsets.all(8.0);
  
  // 浅色主题
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true,

    // 文本主题
    textTheme: const TextTheme(
      // 显示文本（大标题）
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

      // 标题文本
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

      // 正文文本
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),

      // 标签文本
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
    ),

    //图标主题
    iconTheme: const IconThemeData(
      size: 24,
      color: Colors.grey, // 或者使用 colorScheme.onSurface
    ),

    // 卡片主题
    cardTheme: CardThemeData(
      elevation: _cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      margin: _cardMargin,
    ),
    
    // 按钮主题
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    
    // 文本按钮主题
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
        ),
        padding: _buttonPadding,
      ),
    ),

    // OutlinedButton 主题
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
        ),
        padding: _buttonPadding,
      ),
    ),

    // 输入框主题
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      contentPadding: _inputPadding,
      filled: true,
      fillColor: Colors.grey.shade50,
    ),
    
    // AppBar主题
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 2, // 滚动时显示阴影
    ),
    
    // 浮动操作按钮主题
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2,
      sizeConstraints: BoxConstraints.tightFor(width: 56, height: 56),
    ),

    // 对话框主题
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      elevation: 4,
    ),

    // 底部导航栏主题
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 2,
      type: BottomNavigationBarType.fixed,
    ),

  );

  // 深色主题 - 使用 copyWith 避免重复代码
  static final ThemeData darkTheme = lightTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    
    // 设置深色背景
    scaffoldBackgroundColor: Colors.grey.shade900,
    canvasColor: Colors.grey.shade900,
    
    // 深色主题的特殊调整
    inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: Colors.grey.shade800,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
    ),

    cardTheme: lightTheme.cardTheme.copyWith(
      color: Colors.grey.shade800, // 深色模式卡片背景
      shadowColor: Colors.black.withOpacity(0.3),
    ),
    
    // 调整文本颜色以适应深色背景
    textTheme: lightTheme.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    
    // 图标颜色调整
    iconTheme: const IconThemeData(
      size: 24,
      color: Colors.white70,
    ),
    
    // AppBar深色主题调整
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 2,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
  );
}