/// 支付订单状态实体
class PaymentOrderStatus {
  /// 构造
  const PaymentOrderStatus({
    required this.orderId,
    required this.outTradeNo,
    required this.totalAmount,
    required this.status,
    this.tradeNo,
    this.paidAt,
    this.updatedAt,
  });

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

  /// 支付完成时间
  final DateTime? paidAt;

  /// 更新时间
  final DateTime? updatedAt;

  /// 是否支付成功
  bool get isPaid => status == 'PAID';
}
