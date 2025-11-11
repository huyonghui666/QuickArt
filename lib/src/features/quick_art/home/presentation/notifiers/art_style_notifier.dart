import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ArtStyle {
  noStyle('No Style'),
  model3D('3D Model'),
  photo('Photo'),
  anime('Ani');

  const ArtStyle(this.label);
  final String label;
}

// 艺术风格选择状态管理
final artStyleProvider = StateProvider<ArtStyle>((ref) => ArtStyle.noStyle);

// 动漫风格选择状态管理
enum AnimeStyle {
  funny('Funny'),
  photography('Photography'),
  tattoo('Tatto'),
  watercolor('Waterco');

  const AnimeStyle(this.label);
  final String label;
}

final animeStyleProvider = StateProvider<AnimeStyle?>((ref) => null);