import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/core/theme/app_icons.dart';

class ArtStyleSelector extends ConsumerWidget {
  const ArtStyleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(artStyleNotifierProvider);
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
                    ref.read(artStyleNotifierProvider.notifier).setStyle(style);
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
    return Image.asset(style.thumbnailAsset, fit: BoxFit.cover);
  }
}
