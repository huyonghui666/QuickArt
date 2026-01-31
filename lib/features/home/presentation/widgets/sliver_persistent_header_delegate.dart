import 'package:flutter/material.dart';
import 'package:quick_art/features/home/presentation/widgets/inspiration_section.dart';

class InspirationTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  const InspirationTabHeaderDelegate({required this.statusBarHeight});

  final double statusBarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight, left: 20.0, right: 20.0),
      alignment: Alignment.centerLeft, // 左对齐
      color: Colors.black, // 背景色确保和页面融合
      child: const InspirationTabBar(),
    );
  }

  @override
  double get maxExtent => 56.0 + statusBarHeight; // TabBar 的最大高度

  @override
  double get minExtent => 56.0 + statusBarHeight; // TabBar 的最小高度，保持一致实现吸顶

  @override
  bool shouldRebuild(InspirationTabHeaderDelegate oldDelegate) {
    return statusBarHeight != oldDelegate.statusBarHeight;
  }
}
