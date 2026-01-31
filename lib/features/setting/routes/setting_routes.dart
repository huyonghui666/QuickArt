import 'package:go_router/go_router.dart';
import 'package:quick_art/features/setting/presentation/screens/language_screen.dart';
import 'package:quick_art/features/setting/presentation/screens/setting_screen.dart';

List<GoRoute> get settingRoutes => [
      GoRoute(
        path: '/setting',
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: '/setting/language',
        builder: (context, state) => const LanguageScreen(),
      ),
    ];
