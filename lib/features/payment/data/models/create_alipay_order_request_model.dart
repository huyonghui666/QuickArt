/// 创建支付宝订单请求模型
class CreateAlipayOrderRequestModel {
  /// 构造
  const CreateAlipayOrderRequestModel({
    required this.productCode,
    this.clientType = 'APP',
  });

  /// 商品编码
  final String productCode;

  /// 客户端类型
  final String clientType;

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {'productCode': productCode, 'clientType': clientType};
  }
}
