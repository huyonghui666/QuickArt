import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';

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
    final l10n = AppLocalizations.of(context)!;
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
            label: l10n.nav_quickart,
          ),
          _buildNavItem(
            index: 1,
            selectedIcon: AppIcons.navExplorePress,
            unselectedIcon: AppIcons.navExplore,
            label: l10n.nav_explore,
          ),
          _buildNavItem(
            index: 2,
            selectedIcon: AppIcons.navToolsPress,
            unselectedIcon: AppIcons.navTools,
            label: l10n.nav_tools,
          ),
          _buildNavItem(
            index: 3,
            selectedIcon: AppIcons.navStudioPress,
            unselectedIcon: AppIcons.navStudio,
            label: l10n.nav_studio,
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
