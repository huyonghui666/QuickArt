import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/widgets/waiting_screen.dart';
import 'package:quick_art/features/home/presentation/screens/home_screen.dart';
import 'package:quick_art/features/home/presentation/screens/main_screen.dart';
import 'package:quick_art/features/setting/presentation/screens/language_screen.dart';
import 'package:quick_art/features/setting/presentation/screens/setting_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/ai_video_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/start_end_frame_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/text_to_video_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/tools_screen.dart';
import 'package:quick_art/features/workshop/presentation/screens/workshop_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        // 第一个 branch: QuickArt
        StatefulShellBranch(
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
              path: '/workshop',
              builder: (context, state) => const WorkshopScreen(),
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
      path: '/wait/:taskType',
      name: 'Wait',
      builder: (context, state) {
        final taskType = state.pathParameters['taskType']!;
        final prompt = state.uri.queryParameters['prompt']!;
        return WaitingScreen(taskType: taskType, prompt: prompt);
      },
    ),
    GoRoute(
      path: '/tools/ai-video',
      builder: (context, state) => const AiVideoScreen(),
    ),
    GoRoute(
      path: '/tools/ai-video/text-to-video',
      builder: (context, state) => const TextToVideoScreen(),
    ),
    GoRoute(
      path: '/tools/ai-video/start-end-frame',
      builder: (context, state) => const StartEndFrameScreen(),
    ),
  ],
);
