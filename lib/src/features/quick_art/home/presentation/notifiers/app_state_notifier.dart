import 'package:flutter_riverpod/flutter_riverpod.dart';

// // 提示词输入状态管理
// final promptProvider = StateProvider<String>((ref) => '');

// 图片数量状态管理
final imageCountProvider = StateProvider<int>((ref) => 4);

// 切换选项状态管理（Image Describe / Ref Image）
enum ToggleOption {
  imageDescribe('Image Describe'),
  refImage('Ref Image');

  const ToggleOption(this.label);
  final String label;
}

final toggleOptionProvider = StateProvider<ToggleOption>(
  (ref) => ToggleOption.imageDescribe,
);
