import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';

class ArtStyleSelector extends ConsumerWidget {
  const ArtStyleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(artStyleProvider);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '艺术风格',
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ArtStyle.values.map((style) {
              final isSelected = selectedStyle == style;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    ref.read(artStyleProvider.notifier).state = style;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _StyleCard(style: style, selected: isSelected),
                      const SizedBox(height: 6),
                      Text(
                        style.label,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : const Color(0xFFCECECE),
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _StyleCard extends StatelessWidget {
  const _StyleCard({required this.style, required this.selected});
  final ArtStyle style;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 84,
      height: 74,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? theme.colorScheme.primary : const Color(0xFF4A4A4A),
          width: selected ? 2 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: _content(),
    );
  }

  Widget _content() {
    if (style == ArtStyle.noStyle) {
      return Center(
        child: SvgPicture.asset(AppIcons.homeBgStyleNo, width: 84, height: 74),
      );
    }
    return Image.asset(_assetForStyle(style), fit: BoxFit.cover);
  }
}

String _assetForStyle(ArtStyle style) {
  switch (style) {
    case ArtStyle.noStyle:
      return '';
    case ArtStyle.cuteCartoon:
      return 'assets/images/art_styles/cute_cartoon.webp';
    case ArtStyle.ancientStyle:
      return 'assets/images/art_styles/antique.webp';
    case ArtStyle.graffiti:
      return 'assets/images/art_styles/graffiti.webp';
    case ArtStyle.popArt:
      return 'assets/images/art_styles/pop.webp';
    case ArtStyle.vividRealism:
      return 'assets/images/art_styles/gorgeous_realism.webp';
    case ArtStyle.color:
      return 'assets/images/art_styles/color.webp';
    case ArtStyle.eighties:
      return 'assets/images/art_styles/80s.webp';
    case ArtStyle.showa:
      return 'assets/images/art_styles/showa_style.webp';
    case ArtStyle.model3D:
      return 'assets/images/art_styles/3d_model.webp';
    case ArtStyle.photoPhotography:
      return 'assets/images/art_styles/photography.webp';
    case ArtStyle.japaneseAnime:
      return 'assets/images/art_styles/japanese_anime.webp';
    case ArtStyle.tattoo:
      return 'assets/images/art_styles/tattoo.webp';
    case ArtStyle.retroArcade:
      return 'assets/images/art_styles/retro_arcade.webp';
    case ArtStyle.blackWhite:
      return 'assets/images/art_styles/black_white.webp';
    case ArtStyle.pixar:
      return 'assets/images/art_styles/pixar.webp';
    case ArtStyle.cyberpunk:
      return 'assets/images/art_styles/cyberpunk.webp';
    case ArtStyle.lineArt:
      return 'assets/images/art_styles/line.webp';
    case ArtStyle.watercolor:
      return 'assets/images/art_styles/watercolor.webp';
  }
}
