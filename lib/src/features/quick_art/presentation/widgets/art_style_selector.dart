import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/presentation/notifiers/art_style_notifier.dart';

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
          'Art Style',
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
                child: FilterChip(
                  label: Text(style.label),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      ref.read(artStyleProvider.notifier).state = style;
                    }
                  },
                  backgroundColor: Colors.grey[800],
                  selectedColor: theme.colorScheme.primary.withValues(alpha: 0.3),
                  checkmarkColor: theme.colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? theme.colorScheme.primary : Colors.white70,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  side: BorderSide(
                    color: isSelected ? theme.colorScheme.primary : Colors.grey[600]!,
                    width: isSelected ? 2 : 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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