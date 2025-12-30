import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_bottom_sheet_notifier.g.dart';

/// 底部弹出框
/// 如果url（视频url或者图片的url）不为null就弹出否则就不弹出底部弹出框
@riverpod
class ShowBottomSheetNotifier extends _$ShowBottomSheetNotifier {
  @override
  String? build() => null;

  void trigger(String url) {
    state = url;
  }

  void reset() {
    state = null;
  }
}
