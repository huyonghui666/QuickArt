import 'package:quick_art/features/payment/domain/entities/payment_order.dart';

/// 创建支付宝订单响应模型
class CreateAlipayOrderResponseModel {
  /// 构造
  const CreateAlipayOrderResponseModel({
    required this.orderId,
    required this.outTradeNo,
    required this.totalAmount,
    required this.subject,
    required this.orderString,
    required this.status,
  });

  /// 从 JSON 构造
  CreateAlipayOrderResponseModel.fromJson(Map<String, dynamic> json)
    : orderId = (json['orderId'] ?? '').toString(),
      outTradeNo = (json['outTradeNo'] ?? '').toString(),
      totalAmount = (json['totalAmount'] ?? '').toString(),
      subject = (json['subject'] ?? '').toString(),
      orderString = (json['orderString'] ?? '').toString(),
      status = (json['status'] ?? '').toString();

  /// 订单ID
  final String orderId;

  /// 商户订单号
  final String outTradeNo;

  /// 订单金额
  final String totalAmount;

  /// 订单标题
  final String subject;

  /// 支付宝拉起参数
  final String orderString;

  /// 订单状态
  final String status;

  /// 转实体
  PaymentOrder toEntity() {
    return PaymentOrder(
      orderId: orderId,
      outTradeNo: outTradeNo,
      totalAmount: totalAmount,
      subject: subject,
      orderString: orderString,
      status: status,
    );
  }
}
