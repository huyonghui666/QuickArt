import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'art_style_notifier.g.dart';

/// 艺术风格枚举
enum ArtStyle {
  /// 无风格
  noStyle(
    thumbnailAsset: '',
    backgroundAsset: 'assets/images/bg/no_style.webp',
  ),

  /// 可爱卡通
  cuteCartoon(
    thumbnailAsset: 'assets/images/art_styles/cute_cartoon.webp',
    backgroundAsset: 'assets/images/bg/cute_cartoon.webp',
  ),

  /// 古风
  ancientStyle(
    thumbnailAsset: 'assets/images/art_styles/antique.webp',
    backgroundAsset: 'assets/images/bg/antique.webp',
  ),

  /// 涂鸦
  graffiti(
    thumbnailAsset: 'assets/images/art_styles/graffiti.webp',
    backgroundAsset: 'assets/images/bg/graffiti.webp',
  ),

  /// 波普艺术
  popArt(
    thumbnailAsset: 'assets/images/art_styles/pop.webp',
    backgroundAsset: 'assets/images/bg/pop.webp',
  ),

  /// 唯美写实
  vividRealism(
    thumbnailAsset: 'assets/images/art_styles/gorgeous_realism.webp',
    backgroundAsset: 'assets/images/bg/gorgeous_realism.webp',
  ),

  /// 色彩
  color(
    thumbnailAsset: 'assets/images/art_styles/color.webp',
    backgroundAsset: 'assets/images/bg/color.webp',
  ),

  /// 80年代
  eighties(
    thumbnailAsset: 'assets/images/art_styles/80s.webp',
    backgroundAsset: 'assets/images/bg/80s.webp',
  ),

  /// 昭和
  showa(
    thumbnailAsset: 'assets/images/art_styles/showa_style.webp',
    backgroundAsset: 'assets/images/bg/showa_style.webp',
  ),

  /// 3D模型
  model3D(
    thumbnailAsset: 'assets/images/art_styles/3d_model.webp',
    backgroundAsset: 'assets/images/bg/3d_model.webp',
  ),

  /// 摄影
  photoPhotography(
    thumbnailAsset: 'assets/images/art_styles/photography.webp',
    backgroundAsset: 'assets/images/bg/photography.webp',
  ),

  /// 日系动漫
  japaneseAnime(
    thumbnailAsset: 'assets/images/art_styles/japanese_anime.webp',
    backgroundAsset: 'assets/images/bg/japanese_anime.webp',
  ),

  /// 纹身
  tattoo(
    thumbnailAsset: 'assets/images/art_styles/tattoo.webp',
    backgroundAsset: 'assets/images/bg/tattoo.webp',
  ),

  /// 复古街机
  retroArcade(
    thumbnailAsset: 'assets/images/art_styles/retro_arcade.webp',
    backgroundAsset: 'assets/images/bg/retro_arcade.webp',
  ),

  /// 黑白
  blackWhite(
    thumbnailAsset: 'assets/images/art_styles/black_white.webp',
    backgroundAsset: 'assets/images/bg/black_white.webp',
  ),

  /// 皮克斯
  pixar(
    thumbnailAsset: 'assets/images/art_styles/pixar.webp',
    backgroundAsset: 'assets/images/bg/pixar.webp',
  ),

  /// 赛博朋克
  cyberpunk(
    thumbnailAsset: 'assets/images/art_styles/cyberpunk.webp',
    backgroundAsset: 'assets/images/bg/cyberpunk.webp',
  ),

  /// 线条艺术
  lineArt(
    thumbnailAsset: 'assets/images/art_styles/line.webp',
    backgroundAsset: 'assets/images/bg/line.webp',
  ),

  /// 水彩
  watercolor(
    thumbnailAsset: 'assets/images/art_styles/watercolor.webp',
    backgroundAsset: 'assets/images/bg/watercolor.webp',
  );

  const ArtStyle({required this.thumbnailAsset, required this.backgroundAsset});

  /// 本地asset中的缩略图
  final String thumbnailAsset;
  /// 本地asset中的背景图
  final String backgroundAsset;

  /// 获取本地化标签
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case ArtStyle.noStyle:
        return l10n.style_no_style;
      case ArtStyle.cuteCartoon:
        return l10n.style_cute_cartoon;
      case ArtStyle.ancientStyle:
        return l10n.style_ancient_style;
      case ArtStyle.graffiti:
        return l10n.style_graffiti;
      case ArtStyle.popArt:
        return l10n.style_pop_art;
      case ArtStyle.vividRealism:
        return l10n.style_vivid_realism;
      case ArtStyle.color:
        return l10n.style_color;
      case ArtStyle.eighties:
        return l10n.style_eighties;
      case ArtStyle.showa:
        return l10n.style_showa;
      case ArtStyle.model3D:
        return l10n.style_model_3d;
      case ArtStyle.photoPhotography:
        return l10n.style_photography;
      case ArtStyle.japaneseAnime:
        return l10n.style_japanese_anime;
      case ArtStyle.tattoo:
        return l10n.style_tattoo;
      case ArtStyle.retroArcade:
        return l10n.style_retro_arcade;
      case ArtStyle.blackWhite:
        return l10n.style_black_white;
      case ArtStyle.pixar:
        return l10n.style_pixar;
      case ArtStyle.cyberpunk:
        return l10n.style_cyberpunk;
      case ArtStyle.lineArt:
        return l10n.style_line_art;
      case ArtStyle.watercolor:
        return l10n.style_watercolor;
    }
  }
}

/// 艺术风格选择状态管理
@riverpod
class ArtStyleNotifier extends _$ArtStyleNotifier {
  @override
  ArtStyle build() {
    return ArtStyle.noStyle;
  }

  /// 设置风格
  void setStyle(ArtStyle style) {
    state = style;
  }
}
