import 'package:go_router/go_router.dart';
import 'package:quick_art/core/widgets/waiting_screen.dart';
import 'package:quick_art/features/explore/routes/explore_routes.dart';
import 'package:quick_art/core/router/bottom_navigation_screen.dart';
import 'package:quick_art/features/home/routes/home_routes.dart';
import 'package:quick_art/features/setting/routes/setting_routes.dart';
import 'package:quick_art/features/tools/routes/tools_routes.dart';
import 'package:quick_art/features/workshop/routes/workshop_routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  observers: [SentryNavigatorObserver()],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        // 第一个 branch: QuickArt
        StatefulShellBranch(routes: homeRoutes),
        // 第二个 branch: 发现
        StatefulShellBranch(routes: exploreRoutes),
        // 第三个 branch: 工具
        StatefulShellBranch(routes: toolsRoutes),
        // 第四个 branch: 工作室
        StatefulShellBranch(routes: workshopRoutes),
      ],
    ),
    // 其他独立于底部导航栏导航的页面
    ...settingRoutes,

    GoRoute(
      path: '/wait/:taskType',
      name: 'Wait',
      builder: (context, state) {
        final taskType = state.pathParameters['taskType']!;
        final prompt = state.uri.queryParameters['prompt']!;
        return WaitingScreen(taskType: taskType, prompt: prompt);
      },
    ),
    ...toolsStandaloneRoutes,
  ],
);
