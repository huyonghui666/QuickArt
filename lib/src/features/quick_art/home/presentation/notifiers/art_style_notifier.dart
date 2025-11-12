import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ArtStyle {
  noStyle('无风格'),
  cuteCartoon('可爱卡通'),
  ancientStyle('古风'),
  graffiti('涂鸦'),
  popArt('波普'),
  vividRealism('绚丽写实'),
  color('色彩'),
  eighties('80年代'),
  showa('昭和风'),
  model3D('3D模型'),
  photoPhotography('照片摄影'),
  japaneseAnime('日漫'),
  tattoo('纹身'),
  retroArcade('复古街机'),
  blackWhite('黑白'),
  pixar('皮克斯'),
  cyberpunk('赛博朋克'),
  lineArt('线条'),
  watercolor('水彩');

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
