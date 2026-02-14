import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_end_frame_provider.g.dart';

/// 首尾帧状态
class StartEndFrameState {
  /// 构造
  StartEndFrameState({this.startFramePath, this.endFramePath});
  /// 首帧
  final String? startFramePath;
  /// 尾帧
  final String? endFramePath;
  /// 修改
  StartEndFrameState copyWith({String? startFramePath, String? endFramePath}) {
    return StartEndFrameState(
      startFramePath: startFramePath ?? this.startFramePath,
      endFramePath: endFramePath ?? this.endFramePath,
    );
  }
}
/// 首尾帧设置
@riverpod
class StartEndFrame extends _$StartEndFrame {
  @override
  StartEndFrameState build() {
    return StartEndFrameState();
  }
  /// 设置首帧
  void setStartFrame(String path) {
    state = state.copyWith(startFramePath: path);
  }
  /// 设置尾帧
  void setEndFrame(String path) {
    state = state.copyWith(endFramePath: path);
  }
}
