/// 支付订单实体
class PaymentOrder {
  /// 构造
  const PaymentOrder({
    required this.orderId,
    required this.outTradeNo,
    required this.totalAmount,
    required this.subject,
    required this.orderString,
    required this.status,
  });

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
}
