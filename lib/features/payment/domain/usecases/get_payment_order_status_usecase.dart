import 'package:quick_art/features/payment/domain/entities/payment_order_status.dart';
import 'package:quick_art/features/payment/domain/repositories/payment_repository.dart';

/// 查询支付订单状态用例
class GetPaymentOrderStatusUseCase {
  /// 构造
  const GetPaymentOrderStatusUseCase(this._repository);

  final IPaymentRepository _repository;

  /// 执行
  Future<PaymentOrderStatus> call({required String orderId}) {
    return _repository.getOrderStatus(orderId: orderId);
  }
}
