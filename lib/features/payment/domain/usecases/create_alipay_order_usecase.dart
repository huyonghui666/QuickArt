import 'package:quick_art/features/payment/domain/entities/payment_order.dart';
import 'package:quick_art/features/payment/domain/repositories/payment_repository.dart';

/// 创建支付宝订单用例
class CreateAlipayOrderUseCase {
  /// 构造
  const CreateAlipayOrderUseCase(this._repository);

  final IPaymentRepository _repository;

  /// 执行
  Future<PaymentOrder> call({required String productCode}) {
    return _repository.createAlipayOrder(productCode: productCode);
  }
}
