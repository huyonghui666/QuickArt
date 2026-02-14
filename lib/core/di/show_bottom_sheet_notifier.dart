import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_bottom_sheet_notifier.g.dart';

/// 底部弹出框类型
enum BottomSheetType {
  /// 图片
  image,

  /// 视频
  video,
}

/// 底部弹出框状态
class BottomSheetState {
  /// 构造函数
  BottomSheetState({required this.url, required this.type});

  /// 资源链接
  final String url;

  /// 类型
  final BottomSheetType type;
}

/// 底部弹出框
/// 如果url（视频url或者图片的url）不为null就弹出否则就不弹出底部弹出框
@riverpod
class ShowBottomSheetNotifier extends _$ShowBottomSheetNotifier {
  @override
  BottomSheetState? build() => null;

  /// 触发底部弹出框
  void trigger(String url, BottomSheetType type) {
    state = BottomSheetState(url: url, type: type);
  }

  /// 重置状态
  void reset() {
    state = null;
  }
}
