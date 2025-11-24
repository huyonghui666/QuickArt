import 'package:go_router/go_router.dart';

import 'package:quick_art/src/features/quick_art/home/presentation/screens/waiting_screen.dart';
import 'package:quick_art/src/features/quick_art/setting/presentation/screens/language_screen.dart';
import 'package:quick_art/src/features/quick_art/setting/presentation/screens/setting_screen.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/screens/main_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
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
