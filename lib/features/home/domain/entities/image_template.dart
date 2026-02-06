/// 图片模板包的一个图片信息模型
class ImageTemplate {
  final String id;
  final Map<String, String> name;
  final String imageUrl;
  final String? thumbnailUrl;
  final String? category;
  final Map<String, String>? description;

  const ImageTemplate({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.thumbnailUrl,
    this.category,
    this.description,
  });
}
