import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

part 'art_style_notifier.g.dart';

enum ArtStyle {
  noStyle(
    thumbnailAsset: '',
    backgroundAsset: 'assets/images/bg/no_style.webp',
  ),
  cuteCartoon(
    thumbnailAsset: 'assets/images/art_styles/cute_cartoon.webp',
    backgroundAsset: 'assets/images/bg/cute_cartoon.webp',
  ),
  ancientStyle(
    thumbnailAsset: 'assets/images/art_styles/antique.webp',
    backgroundAsset: 'assets/images/bg/antique.webp',
  ),
  graffiti(
    thumbnailAsset: 'assets/images/art_styles/graffiti.webp',
    backgroundAsset: 'assets/images/bg/graffiti.webp',
  ),
  popArt(
    thumbnailAsset: 'assets/images/art_styles/pop.webp',
    backgroundAsset: 'assets/images/bg/pop.webp',
  ),
  vividRealism(
    thumbnailAsset: 'assets/images/art_styles/gorgeous_realism.webp',
    backgroundAsset: 'assets/images/bg/gorgeous_realism.webp',
  ),
  color(
    thumbnailAsset: 'assets/images/art_styles/color.webp',
    backgroundAsset: 'assets/images/bg/color.webp',
  ),
  eighties(
    thumbnailAsset: 'assets/images/art_styles/80s.webp',
    backgroundAsset: 'assets/images/bg/80s.webp',
  ),
  showa(
    thumbnailAsset: 'assets/images/art_styles/showa_style.webp',
    backgroundAsset: 'assets/images/bg/showa_style.webp',
  ),
  model3D(
    thumbnailAsset: 'assets/images/art_styles/3d_model.webp',
    backgroundAsset: 'assets/images/bg/3d_model.webp',
  ),
  photoPhotography(
    thumbnailAsset: 'assets/images/art_styles/photography.webp',
    backgroundAsset: 'assets/images/bg/photography.webp',
  ),
  japaneseAnime(
    thumbnailAsset: 'assets/images/art_styles/japanese_anime.webp',
    backgroundAsset: 'assets/images/bg/japanese_anime.webp',
  ),
  tattoo(
    thumbnailAsset: 'assets/images/art_styles/tattoo.webp',
    backgroundAsset: 'assets/images/bg/tattoo.webp',
  ),
  retroArcade(
    thumbnailAsset: 'assets/images/art_styles/retro_arcade.webp',
    backgroundAsset: 'assets/images/bg/retro_arcade.webp',
  ),
  blackWhite(
    thumbnailAsset: 'assets/images/art_styles/black_white.webp',
    backgroundAsset: 'assets/images/bg/black_white.webp',
  ),
  pixar(
    thumbnailAsset: 'assets/images/art_styles/pixar.webp',
    backgroundAsset: 'assets/images/bg/pixar.webp',
  ),
  cyberpunk(
    thumbnailAsset: 'assets/images/art_styles/cyberpunk.webp',
    backgroundAsset: 'assets/images/bg/cyberpunk.webp',
  ),
  lineArt(
    thumbnailAsset: 'assets/images/art_styles/line.webp',
    backgroundAsset: 'assets/images/bg/line.webp',
  ),
  watercolor(
    thumbnailAsset: 'assets/images/art_styles/watercolor.webp',
    backgroundAsset: 'assets/images/bg/watercolor.webp',
  );

  const ArtStyle({
    required this.thumbnailAsset,
    required this.backgroundAsset,
  });

  final String thumbnailAsset;
  final String backgroundAsset;

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
