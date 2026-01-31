import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_bottom_sheet_notifier.g.dart';

enum BottomSheetType { image, video }

class BottomSheetState {
  final String url;
  final BottomSheetType type;

  BottomSheetState({required this.url, required this.type});
}

/// 底部弹出框
/// 如果url（视频url或者图片的url）不为null就弹出否则就不弹出底部弹出框
@riverpod
class ShowBottomSheetNotifier extends _$ShowBottomSheetNotifier {
  @override
  BottomSheetState? build() => null;

  void trigger(String url, BottomSheetType type) {
    state = BottomSheetState(url: url, type: type);
  }

  void reset() {
    state = null;
  }
}
