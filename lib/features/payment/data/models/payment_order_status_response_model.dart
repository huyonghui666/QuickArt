import 'package:quick_art/features/payment/domain/entities/payment_order_status.dart';

/// 支付订单状态响应模型
class PaymentOrderStatusResponseModel {
  /// 构造
  const PaymentOrderStatusResponseModel({
    required this.orderId,
    required this.outTradeNo,
    required this.totalAmount,
    required this.status,
    this.tradeNo,
    this.paidAt,
    this.updatedAt,
  });

  /// 从 JSON 构造
  PaymentOrderStatusResponseModel.fromJson(Map<String, dynamic> json)
    : orderId = (json['orderId'] ?? '').toString(),
      outTradeNo = (json['outTradeNo'] ?? '').toString(),
      tradeNo = json['tradeNo']?.toString(),
      totalAmount = (json['totalAmount'] ?? '').toString(),
      status = (json['status'] ?? '').toString(),
      paidAt = _parseDateTime(json['paidAt']),
      updatedAt = _parseDateTime(json['updatedAt']);

  /// 订单ID
  final String orderId;

  /// 商户订单号
  final String outTradeNo;

  /// 支付宝交易号
  final String? tradeNo;

  /// 订单金额
  final String totalAmount;

  /// 订单状态
  final String status;

  /// 支付时间
  final DateTime? paidAt;

  /// 更新时间
  final DateTime? updatedAt;

  /// 转实体
  PaymentOrderStatus toEntity() {
    return PaymentOrderStatus(
      orderId: orderId,
      outTradeNo: outTradeNo,
      tradeNo: tradeNo,
      totalAmount: totalAmount,
      status: status,
      paidAt: paidAt,
      updatedAt: updatedAt,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    final text = value?.toString();
    if (text == null || text.isEmpty) {
      return null;
    }
    return DateTime.tryParse(text);
  }
}
