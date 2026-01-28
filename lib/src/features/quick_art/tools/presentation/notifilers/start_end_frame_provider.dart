import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_end_frame_provider.g.dart';

class StartEndFrameState {
  final String? startFramePath;
  final String? endFramePath;

  StartEndFrameState({this.startFramePath, this.endFramePath});

  StartEndFrameState copyWith({String? startFramePath, String? endFramePath}) {
    return StartEndFrameState(
      startFramePath: startFramePath ?? this.startFramePath,
      endFramePath: endFramePath ?? this.endFramePath,
    );
  }
}

@riverpod
class StartEndFrame extends _$StartEndFrame {
  @override
  StartEndFrameState build() {
    return StartEndFrameState();
  }

  void setStartFrame(String path) {
    state = state.copyWith(startFramePath: path);
  }

  void setEndFrame(String path) {
    state = state.copyWith(endFramePath: path);
  }
}
