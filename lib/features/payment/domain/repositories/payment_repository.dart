import 'package:quick_art/features/payment/domain/entities/payment_order.dart';
import 'package:quick_art/features/payment/domain/entities/payment_order_status.dart';

/// 支付仓库抽象
abstract class IPaymentRepository {
  /// 创建支付宝订单
  Future<PaymentOrder> createAlipayOrder({required String productCode});

  /// 查询订单状态
  Future<PaymentOrderStatus> getOrderStatus({required String orderId});
}
