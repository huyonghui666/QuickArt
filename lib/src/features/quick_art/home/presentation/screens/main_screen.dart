
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/navigation_notifier.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/home_screen.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/tools_screen.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/bottom_navigation.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(navigationProvider);

    // 根据当前选择的 Tab 返回不同的页面
    Widget buildBody() {
      switch (currentTab) {
        case NavigationTab.quickart:
          return const HomeScreen();
        case NavigationTab.aiTools:
          return const ToolsScreen();
        case NavigationTab.explore:
        // TODO: 为其他 Tab 创建页面
        case NavigationTab.studio:
        return Center(
            child: Text(
              '${currentTab.name} Screen',
              style: const TextStyle(color: Colors.white),
            ),
          );
      }
    }

    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }


}
