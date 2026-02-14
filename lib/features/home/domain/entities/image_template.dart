import 'package:equatable/equatable.dart';

/// 图片模板包的一个图片信息模型
/// 继承 [Equatable] 是为了实现基于值的相等性比较。
/// 使用 Equatable 后，只要 [props] 列表中返回的属性值相同，这两个对象就被视为相等。
/// 这在以下场景非常有用：
/// 1. 单元测试：可以直接使用 expect(actual, expected) 比较对象。
/// 2. 状态管理（如 Riverpod/Bloc）：状态更新时，只有当新旧状态不相等时才会触发 UI 重建，避免不必要的刷新。
class ImageTemplate extends Equatable {

  ///构造
  const ImageTemplate({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.thumbnailUrl,
    this.category,
    this.description,
  });
  /// 模板id
  final String id;
  /// 模板标题
  final Map<String, String> name;
  /// 大图图片url
  final String imageUrl;
  /// 缩略图url
  final String? thumbnailUrl;
  /// 分类
  final String? category;
  /// 图片模板提示词描述
  final Map<String, String>? description;

  @override
  List<Object?> get props => [
    id,
    name,
    imageUrl,
    thumbnailUrl,
    category,
    description,
  ];
}
