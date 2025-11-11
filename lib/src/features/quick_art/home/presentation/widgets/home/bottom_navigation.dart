import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/navigation_notifier.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(navigationProvider);
    final theme = Theme.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: Colors.grey[600],
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: currentTab.tabIndex,
      onTap: (index) {
        final tab = NavigationTab.values[index];
        ref.read(navigationProvider.notifier).state = tab;
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: NavigationTab.quickart.label,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: NavigationTab.explore.label,
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.smart_toy,
              color: Colors.black,
              size: 20,
            ),
          ),
          label: NavigationTab.ai.label,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.build),
          label: NavigationTab.aiTools.label,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.video_library),
          label: NavigationTab.studio.label,
        ),
      ],
    );
  }
}