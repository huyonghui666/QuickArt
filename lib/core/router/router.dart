import 'package:go_router/go_router.dart';
import 'package:quick_art/core/widgets/waiting_screen.dart';
import 'package:quick_art/features/explore/routes/explore_routes.dart';
import 'package:quick_art/features/home/presentation/screens/main_screen.dart';
import 'package:quick_art/features/home/routes/home_routes.dart';
import 'package:quick_art/features/setting/routes/setting_routes.dart';
import 'package:quick_art/features/tools/routes/tools_routes.dart';
import 'package:quick_art/features/workshop/routes/workshop_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
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
    // 其他独立于主导航的页面
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
