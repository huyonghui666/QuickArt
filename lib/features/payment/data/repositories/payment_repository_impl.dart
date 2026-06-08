import 'package:quick_art/features/auth_login/data/datasources/auth_login_local_data_source.dart';
import 'package:quick_art/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:quick_art/features/payment/data/models/create_alipay_order_request_model.dart';
import 'package:quick_art/features/payment/domain/entities/payment_order.dart';
import 'package:quick_art/features/payment/domain/entities/payment_order_status.dart';
import 'package:quick_art/features/payment/domain/repositories/payment_repository.dart';

/// 支付仓库实现
class PaymentRepositoryImpl implements IPaymentRepository {
  /// 构造
  PaymentRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final IPaymentRemoteDataSource _remoteDataSource;
  final IAuthLoginLocalDataSource _localDataSource;

  @override
  Future<PaymentOrder> createAlipayOrder({required String productCode}) async {
    final token = await _localDataSource.getJwtToken();
    if (token == null || token.isEmpty) {
      throw Exception('未登录，无法创建支付订单');
    }

    final model = await _remoteDataSource.createAlipayOrder(
      token: token,
      request: CreateAlipayOrderRequestModel(productCode: productCode),
    );
    return model.toEntity();
  }

  @override
  Future<PaymentOrderStatus> getOrderStatus({required String orderId}) async {
    final token = await _localDataSource.getJwtToken();
    if (token == null || token.isEmpty) {
      throw Exception('未登录，无法查询订单状态');
    }

    final model = await _remoteDataSource.getOrderStatus(
      token: token,
      orderId: orderId,
    );
    return model.toEntity();
  }
}
