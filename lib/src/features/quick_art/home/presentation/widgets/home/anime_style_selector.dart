import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/art_style_notifier.dart';

class AnimeStyleSelector extends ConsumerWidget {
  const AnimeStyleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(animeStyleProvider);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: AnimeStyle.values.map((style) {
          final isSelected = selectedStyle == style;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(style.label),
              selected: isSelected,
              onSelected: (selected) {
                ref.read(animeStyleProvider.notifier).state = 
                    selected ? style : null;
              },
              backgroundColor: Colors.grey[800],
              selectedColor: theme.colorScheme.secondary.withValues(alpha: 0.3),
              checkmarkColor: theme.colorScheme.secondary,
              labelStyle: TextStyle(
                color: isSelected ? theme.colorScheme.secondary : Colors.white70,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              side: BorderSide(
                color: isSelected ? theme.colorScheme.secondary : Colors.grey[600]!,
                width: isSelected ? 2 : 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}