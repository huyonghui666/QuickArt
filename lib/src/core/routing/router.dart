import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/home_screen.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/main_screen.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/screens/tools_screen.dart';
import 'package:quick_art/src/features/quick_art/setting/presentation/screens/language_screen.dart';
import 'package:quick_art/src/features/quick_art/setting/presentation/screens/setting_screen.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/waiting_screen.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        // 第一个 branch: QuickArt
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
          ],
        ),
        // 第二个 branch: 发现
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/explore',
              builder: (context, state) => const Center(
                child: Text(
                  'Explore Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        // 第三个 branch: 工具
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tools',
              builder: (context, state) => const ToolsScreen(),
            ),
          ],
        ),
        // 第四个 branch: 工作室
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/studio',
              builder: (context, state) => const Center(
                child: Text(
                  'Studio Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    // 其他独立于主导航的页面
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: '/setting/language',
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: '/waiting',
      builder: (context, state) => const WaitingScreen(),
    ),
  ],
);
