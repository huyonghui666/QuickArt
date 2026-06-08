import 'package:go_router/go_router.dart';
import 'package:quick_art/features/payment/presentation/screens/payment_screen.dart';

/// 支付独立路由
List<GoRoute> get paymentStandaloneRoutes => [
  GoRoute(
    path: '/payment',
    builder: (context, state) => const PaymentScreen(),
  ),
];
