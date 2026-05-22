import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/payment/data/models/create_alipay_order_request_model.dart';
import 'package:quick_art/features/payment/data/models/create_alipay_order_response_model.dart';
import 'package:quick_art/features/payment/data/models/payment_order_status_response_model.dart';

/// 支付远程数据源抽象
abstract class IPaymentRemoteDataSource {
  /// 创建支付宝订单
  Future<CreateAlipayOrderResponseModel> createAlipayOrder({
    required String token,
    required CreateAlipayOrderRequestModel request,
  });

  /// 查询订单状态
  Future<PaymentOrderStatusResponseModel> getOrderStatus({
    required String token,
    required String orderId,
  });
}

/// 支付远程数据源实现
class PaymentRemoteDataSource implements IPaymentRemoteDataSource {
  /// 构造
  PaymentRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<CreateAlipayOrderResponseModel> createAlipayOrder({
    required String token,
    required CreateAlipayOrderRequestModel request,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/payments/alipay/orders',
        data: request.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw NetworkException('Create order failed: ${response.data}');
      }

      final data = response.data;
      if (data == null) {
        throw DataException('Create order response is null');
      }

      return CreateAlipayOrderResponseModel.fromJson(data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<PaymentOrderStatusResponseModel> getOrderStatus({
    required String token,
    required String orderId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/payments/orders/$orderId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw NetworkException('Get order status failed: ${response.data}');
      }

      final data = response.data;
      if (data == null) {
        throw DataException('Order status response is null');
      }

      return PaymentOrderStatusResponseModel.fromJson(data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
