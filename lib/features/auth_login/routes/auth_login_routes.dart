import 'package:go_router/go_router.dart';
import 'package:quick_art/features/auth_login/presentation/screens/auth_login_screen.dart';

/// 登录模块路由
List<GoRoute> get authLoginRoutes => [
  GoRoute(
    path: '/auth/login',
    name: 'AuthLogin',
    builder: (context, state) => const AuthLoginScreen(),
  ),
];
