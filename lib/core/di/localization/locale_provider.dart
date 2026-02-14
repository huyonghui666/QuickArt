import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 语言切换提供器
final localeProvider = StateProvider<Locale>((ref) => const Locale('zh'));
