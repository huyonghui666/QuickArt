import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/navigation_notifier.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(navigationProvider);

    return Container(
      height: 80, // 调整整体高度以适应新设计
      color: Colors.black, // 设置背景色
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            ref: ref,
            currentTab: currentTab,
            tab: NavigationTab.quickart,
            selectedIcon: AppIcons.navQuickArtPress,
            unselectedIcon: AppIcons.navQuickArt,
            label: 'QUICKART',
          ),
          _buildNavItem(
            ref: ref,
            currentTab: currentTab,
            tab: NavigationTab.explore,
            selectedIcon: AppIcons.navExplorePress,
            unselectedIcon: AppIcons.navExplore,
            label: '发现',
          ),
          _buildNavItem(
            ref: ref,
            currentTab: currentTab,
            tab: NavigationTab.aiTools,
            selectedIcon: AppIcons.navToolsPress,
            unselectedIcon: AppIcons.navTools,
            label: '工具',
          ),
          _buildNavItem(
            ref: ref,
            currentTab: currentTab,
            tab: NavigationTab.studio,
            selectedIcon: AppIcons.navStudioPress,
            unselectedIcon: AppIcons.navStudio,
            label: '工作室',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required WidgetRef ref,
    required NavigationTab currentTab,
    required NavigationTab tab,
    required String selectedIcon,
    required String unselectedIcon,
    required String label,
  }) {
    final isSelected = currentTab == tab;
    return GestureDetector(
      onTap: () => ref.read(navigationProvider.notifier).state = tab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSelected ? selectedIcon : unselectedIcon,
            width: 28,
            height: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}