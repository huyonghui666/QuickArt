import 'package:go_router/go_router.dart';
import 'package:quick_art/features/home/presentation/screens/home_screen.dart';

List<GoRoute> get homeRoutes => [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
];
