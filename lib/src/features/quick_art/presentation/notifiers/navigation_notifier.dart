import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationTab {
  quickart(0, 'QUICKART'),
  explore(1, 'EXPLORE'),
  ai(2, 'AI'),
  aiTools(3, 'AI TOOLS'),
  studio(4, 'STUDIO');

  const NavigationTab(this.tabIndex, this.label);
  final int tabIndex;
  final String label;
}

// 底部导航栏当前选中项状态管理
final navigationProvider = StateProvider<NavigationTab>((ref) => NavigationTab.quickart);