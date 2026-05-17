import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'art_style_notifier.g.dart';

/// 当前选中的艺术风格状态管理
///
/// 方案 B：风格列表完全由服务端驱动，不再使用本地枚举。
/// 默认值为 [ArtStyle.noStyle]（id 为空字符串），表示未选中任何风格。
/// 通过 [ArtStyleX.isNoStyle] 判断是否处于无风格状态。
@riverpod
class ArtStyleNotifier extends _$ArtStyleNotifier {
  @override
  ArtStyle build() {
    // 默认无风格
    return ArtStyle.noStyle;
  }

  /// 选中某个风格
  void setStyle(ArtStyle style) {
    state = style;
  }

  /// 清除风格，回到"无风格"状态
  void clearStyle() {
    state = ArtStyle.noStyle;
  }
}
