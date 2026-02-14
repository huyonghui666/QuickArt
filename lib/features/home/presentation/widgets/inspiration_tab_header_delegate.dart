import 'package:flutter/material.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';

/// 灵感分类 Tab 头部代理
class InspirationTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// 构造
  const InspirationTabHeaderDelegate({
    required this.controller,
    required this.categories,
    required this.statusBarHeight,
  });

  /// TabController
  final TabController controller;
  /// categories分类列表
  final List<InspirationCategoryType> categories;
  /// statusBarHeight系统状态栏高度
  final double statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: statusBarHeight),
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10), // Adjust padding
        tabs: categories
            .map((e) => Tab(text: e.getLabel(AppLocalizations.of(context)!)))
            .toList(),
      ),
    );
  }

  @override
  double get maxExtent => 48.0 + statusBarHeight;

  @override
  double get minExtent => 48.0 + statusBarHeight;

  @override
  bool shouldRebuild(InspirationTabHeaderDelegate oldDelegate) {
    return controller != oldDelegate.controller ||
        categories != oldDelegate.categories ||
        statusBarHeight != oldDelegate.statusBarHeight;
  }
}
