import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomNavigation({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            selectedIcon: AppIcons.navQuickArtPress,
            unselectedIcon: AppIcons.navQuickArt,
            label: 'QUICKART',
          ),
          _buildNavItem(
            index: 1,
            selectedIcon: AppIcons.navExplorePress,
            unselectedIcon: AppIcons.navExplore,
            label: '发现',
          ),
          _buildNavItem(
            index: 2,
            selectedIcon: AppIcons.navToolsPress,
            unselectedIcon: AppIcons.navTools,
            label: '工具',
          ),
          _buildNavItem(
            index: 3,
            selectedIcon: AppIcons.navStudioPress,
            unselectedIcon: AppIcons.navStudio,
            label: '工作室',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String selectedIcon,
    required String unselectedIcon,
    required String label,
  }) {
    final isSelected = navigationShell.currentIndex == index;
    return GestureDetector(
      onTap: () => _onTap(index),
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
