import 'package:quick_art/core/resource_management/cdn_assets.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'art_style_notifier.g.dart';

/// 艺术风格枚举
enum ArtStyle {
  /// 无风格
  noStyle(
    thumbnailAsset: '',
    backgroundAsset: CdnAssets.bgNoStyle,
  ),

  /// 可爱卡通
  cuteCartoon(
    thumbnailAsset: CdnAssets.styleCuteCartoon,
    backgroundAsset: CdnAssets.bgCuteCartoon,
  ),

  /// 古风
  ancientStyle(
    thumbnailAsset: CdnAssets.styleAntique,
    backgroundAsset: CdnAssets.bgAntique,
  ),

  /// 涂鸦
  graffiti(
    thumbnailAsset: CdnAssets.styleGraffiti,
    backgroundAsset: CdnAssets.bgGraffiti,
  ),

  /// 波普艺术
  popArt(
    thumbnailAsset: CdnAssets.stylePop,
    backgroundAsset: CdnAssets.bgPop,
  ),

  /// 唯美写实
  vividRealism(
    thumbnailAsset: CdnAssets.styleGorgeousRealism,
    backgroundAsset: CdnAssets.bgGorgeousRealism,
  ),

  /// 色彩
  color(
    thumbnailAsset: CdnAssets.styleColor,
    backgroundAsset: CdnAssets.bgColor,
  ),

  /// 80年代
  eighties(
    thumbnailAsset: CdnAssets.style80s,
    backgroundAsset: CdnAssets.bg80s,
  ),

  /// 昭和
  showa(
    thumbnailAsset: CdnAssets.styleShowa,
    backgroundAsset: CdnAssets.bgShowa,
  ),

  /// 3D模型
  model3D(
    thumbnailAsset: CdnAssets.style3dModel,
    backgroundAsset: CdnAssets.bg3dModel,
  ),

  /// 摄影
  photoPhotography(
    thumbnailAsset: CdnAssets.stylePhotography,
    backgroundAsset: CdnAssets.bgPhotography,
  ),

  /// 日系动漫
  japaneseAnime(
    thumbnailAsset: CdnAssets.styleJapaneseAnime,
    backgroundAsset: CdnAssets.bgJapaneseAnime,
  ),

  /// 纹身
  tattoo(
    thumbnailAsset: CdnAssets.styleTattoo,
    backgroundAsset: CdnAssets.bgTattoo,
  ),

  /// 复古街机
  retroArcade(
    thumbnailAsset: CdnAssets.styleRetroArcade,
    backgroundAsset: CdnAssets.bgRetroArcade,
  ),

  /// 黑白
  blackWhite(
    thumbnailAsset: CdnAssets.styleBlackWhite,
    backgroundAsset: CdnAssets.bgBlackWhite,
  ),

  /// 皮克斯
  pixar(
    thumbnailAsset: CdnAssets.stylePixar,
    backgroundAsset: CdnAssets.bgPixar,
  ),

  /// 赛博朋克
  cyberpunk(
    thumbnailAsset: CdnAssets.styleCyberpunk,
    backgroundAsset: CdnAssets.bgCyberpunk,
  ),

  /// 线条艺术
  lineArt(
    thumbnailAsset: CdnAssets.styleLine,
    backgroundAsset: CdnAssets.bgLine,
  ),

  /// 水彩
  watercolor(
    thumbnailAsset: CdnAssets.styleWatercolor,
    backgroundAsset: CdnAssets.bgWatercolor,
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
        return l10n.home_style_no_style;
      case ArtStyle.cuteCartoon:
        return l10n.home_style_cute_cartoon;
      case ArtStyle.ancientStyle:
        return l10n.home_style_ancient_style;
      case ArtStyle.graffiti:
        return l10n.home_style_graffiti;
      case ArtStyle.popArt:
        return l10n.home_style_pop_art;
      case ArtStyle.vividRealism:
        return l10n.home_style_vivid_realism;
      case ArtStyle.color:
        return l10n.home_style_color;
      case ArtStyle.eighties:
        return l10n.home_style_eighties;
      case ArtStyle.showa:
        return l10n.home_style_showa;
      case ArtStyle.model3D:
        return l10n.home_style_model_3d;
      case ArtStyle.photoPhotography:
        return l10n.home_style_photography;
      case ArtStyle.japaneseAnime:
        return l10n.home_style_japanese_anime;
      case ArtStyle.tattoo:
        return l10n.home_style_tattoo;
      case ArtStyle.retroArcade:
        return l10n.home_style_retro_arcade;
      case ArtStyle.blackWhite:
        return l10n.home_style_black_white;
      case ArtStyle.pixar:
        return l10n.home_style_pixar;
      case ArtStyle.cyberpunk:
        return l10n.home_style_cyberpunk;
      case ArtStyle.lineArt:
        return l10n.home_style_line_art;
      case ArtStyle.watercolor:
        return l10n.home_style_watercolor;
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
