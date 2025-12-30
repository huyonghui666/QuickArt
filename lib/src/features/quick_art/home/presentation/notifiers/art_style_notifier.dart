import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'art_style_notifier.g.dart';

enum ArtStyle {
  noStyle(
    '无风格',
    thumbnailAsset: '',
    backgroundAsset: 'assets/images/bg/no_style.webp',
  ),
  cuteCartoon(
    '可爱卡通',
    thumbnailAsset: 'assets/images/art_styles/cute_cartoon.webp',
    backgroundAsset: 'assets/images/bg/cute_cartoon.webp',
  ),
  ancientStyle(
    '古风',
    thumbnailAsset: 'assets/images/art_styles/antique.webp',
    backgroundAsset: 'assets/images/bg/antique.webp',
  ),
  graffiti(
    '涂鸦',
    thumbnailAsset: 'assets/images/art_styles/graffiti.webp',
    backgroundAsset: 'assets/images/bg/graffiti.webp',
  ),
  popArt(
    '波普',
    thumbnailAsset: 'assets/images/art_styles/pop.webp',
    backgroundAsset: 'assets/images/bg/pop.webp',
  ),
  vividRealism(
    '绚丽写实',
    thumbnailAsset: 'assets/images/art_styles/gorgeous_realism.webp',
    backgroundAsset: 'assets/images/bg/gorgeous_realism.webp',
  ),
  color(
    '色彩',
    thumbnailAsset: 'assets/images/art_styles/color.webp',
    backgroundAsset: 'assets/images/bg/color.webp',
  ),
  eighties(
    '80年代',
    thumbnailAsset: 'assets/images/art_styles/80s.webp',
    backgroundAsset: 'assets/images/bg/80s.webp',
  ),
  showa(
    '昭和风',
    thumbnailAsset: 'assets/images/art_styles/showa_style.webp',
    backgroundAsset: 'assets/images/bg/showa_style.webp',
  ),
  model3D(
    '3D模型',
    thumbnailAsset: 'assets/images/art_styles/3d_model.webp',
    backgroundAsset: 'assets/images/bg/3d_model.webp',
  ),
  photoPhotography(
    '照片摄影',
    thumbnailAsset: 'assets/images/art_styles/photography.webp',
    backgroundAsset: 'assets/images/bg/photography.webp',
  ),
  japaneseAnime(
    '日漫',
    thumbnailAsset: 'assets/images/art_styles/japanese_anime.webp',
    backgroundAsset: 'assets/images/bg/japanese_anime.webp',
  ),
  tattoo(
    '纹身',
    thumbnailAsset: 'assets/images/art_styles/tattoo.webp',
    backgroundAsset: 'assets/images/bg/tattoo.webp',
  ),
  retroArcade(
    '复古街机',
    thumbnailAsset: 'assets/images/art_styles/retro_arcade.webp',
    backgroundAsset: 'assets/images/bg/retro_arcade.webp',
  ),
  blackWhite(
    '黑白',
    thumbnailAsset: 'assets/images/art_styles/black_white.webp',
    backgroundAsset: 'assets/images/bg/black_white.webp',
  ),
  pixar(
    '皮克斯',
    thumbnailAsset: 'assets/images/art_styles/pixar.webp',
    backgroundAsset: 'assets/images/bg/pixar.webp',
  ),
  cyberpunk(
    '赛博朋克',
    thumbnailAsset: 'assets/images/art_styles/cyberpunk.webp',
    backgroundAsset: 'assets/images/bg/cyberpunk.webp',
  ),
  lineArt(
    '线条',
    thumbnailAsset: 'assets/images/art_styles/line.webp',
    backgroundAsset: 'assets/images/bg/line.webp',
  ),
  watercolor(
    '水彩',
    thumbnailAsset: 'assets/images/art_styles/watercolor.webp',
    backgroundAsset: 'assets/images/bg/watercolor.webp',
  );

  const ArtStyle(
    this.label, {
    required this.thumbnailAsset,
    required this.backgroundAsset,
  });
  final String label;
  final String thumbnailAsset;
  final String backgroundAsset;
}

// 艺术风格选择状态管理
@riverpod
class ArtStyleNotifier extends _$ArtStyleNotifier {
  @override
  ArtStyle build() {
    return ArtStyle.noStyle;
  }

  void setStyle(ArtStyle style) {
    state = style;
  }
}
