import 'package:go_router/go_router.dart';
import 'package:quick_art/features/workshop/presentation/screens/workshop_screen.dart';

List<GoRoute> get workshopRoutes => [
      GoRoute(
        path: '/workshop',
        builder: (context, state) => const WorkshopScreen(),
      ),
    ];
