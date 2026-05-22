import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:quick_art/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:quick_art/features/payment/domain/entities/payment_order.dart';
import 'package:quick_art/features/payment/domain/entities/payment_order_status.dart';
import 'package:quick_art/features/payment/domain/repositories/payment_repository.dart';
import 'package:quick_art/features/payment/domain/usecases/create_alipay_order_usecase.dart';
import 'package:quick_art/features/payment/domain/usecases/get_payment_order_status_usecase.dart';
import 'package:tobias/tobias.dart';

/// 支付页面状态
class PaymentState {
  /// 构造
  const PaymentState({
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    this.lastOrderStatus,
  });

  /// 加载中
  final bool isLoading;

  /// 错误消息
  final String? errorMessage;

  /// 成功消息
  final String? successMessage;

  /// 最近订单状态
  final PaymentOrderStatus? lastOrderStatus;

  /// 拷贝
  PaymentState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    PaymentOrderStatus? lastOrderStatus,
    bool clearError = false,
    bool clearSuccess = false,
  }) {
    return PaymentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      successMessage: clearSuccess
          ? null
          : (successMessage ?? this.successMessage),
      lastOrderStatus: lastOrderStatus ?? this.lastOrderStatus,
    );
  }
}

/// 支付状态管理
class PaymentNotifier extends StateNotifier<PaymentState> {
  /// 构造
  PaymentNotifier(this._createOrderUseCase, this._statusUseCase)
    : super(const PaymentState());

  final CreateAlipayOrderUseCase _createOrderUseCase;
  final GetPaymentOrderStatusUseCase _statusUseCase;
  final Tobias _tobias = Tobias();

  /// 发起支付
  Future<void> createOrderAndPay({required String productCode}) async {
    if (state.isLoading) {
      return;
    }

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      final order = await _createOrderUseCase.call(productCode: productCode);
      final payResult = await _payWithAlipay(order);
      final orderStatus = await _statusUseCase.call(orderId: order.orderId);

      if (orderStatus.isPaid) {
        state = state.copyWith(
          isLoading: false,
          lastOrderStatus: orderStatus,
          successMessage: '支付成功',
        );
        return;
      }

      final resultCode = payResult['resultStatus']?.toString() ?? '';
      if (resultCode == '6001') {
        state = state.copyWith(
          isLoading: false,
          lastOrderStatus: orderStatus,
          errorMessage: '你已取消支付',
        );
        return;
      }

      state = state.copyWith(
        isLoading: false,
        lastOrderStatus: orderStatus,
        errorMessage: '支付未完成，请稍后重试',
      );
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// 清除错误
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// 清除成功提示
  void clearSuccess() {
    state = state.copyWith(clearSuccess: true);
  }

  Future<Map<String, dynamic>> _payWithAlipay(PaymentOrder order) async {
    final result = await _tobias.pay(order.orderString, evn: AliPayEvn.sandbox);
    return result.map(
      (key, value) => MapEntry(key.toString(), value),
    );
  }
}

/// 支付远程数据源 Provider
final paymentRemoteDataSourceProvider = Provider<IPaymentRemoteDataSource>((
  ref,
) {
  return PaymentRemoteDataSource(ref.watch(dioProvider));
});

/// 支付仓库 Provider
final paymentRepositoryProvider = Provider<IPaymentRepository>((ref) {
  return PaymentRepositoryImpl(
    ref.watch(paymentRemoteDataSourceProvider),
    ref.watch(authLoginLocalDataSourceProvider),
  );
});

/// 创建支付宝订单用例 Provider
final createAlipayOrderUseCaseProvider = Provider<CreateAlipayOrderUseCase>((
  ref,
) {
  return CreateAlipayOrderUseCase(ref.watch(paymentRepositoryProvider));
});

/// 查询支付订单状态用例 Provider
final getPaymentOrderStatusUseCaseProvider =
    Provider<GetPaymentOrderStatusUseCase>((ref) {
      return GetPaymentOrderStatusUseCase(ref.watch(paymentRepositoryProvider));
    });

/// 支付状态管理 Provider
final paymentNotifierProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
      return PaymentNotifier(
        ref.watch(createAlipayOrderUseCaseProvider),
        ref.watch(getPaymentOrderStatusUseCaseProvider),
      );
    });
