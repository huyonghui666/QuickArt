import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prompt_provider.g.dart';

/// 提示词文本域
class PromptState {
  PromptState({required this.controller, this.text = ''});

  final TextEditingController controller;
  final String text;

  int get wordCount => text.length;

  PromptState copyWith({TextEditingController? controller, String? text}) {
    return PromptState(
      controller: controller ?? this.controller,
      text: text ?? this.text,
    );
  }
}

@riverpod
class Prompt extends _$Prompt {
  @override
  PromptState build(String id) {
    // 初始化 Controller
    final controller = TextEditingController();

    // 监听文本变化并更新状态
    void listener() {
      // 只有当文本真正变化时才更新状态，避免循环触发
      // 注意：这里我们比较的是 controller.text 和 state.text
      if (controller.text != state.text) {
        state = state.copyWith(text: controller.text);
      }
    }

    controller.addListener(listener);

    // 注册销毁回调
    ref.onDispose(() {
      controller.removeListener(listener);
      controller.dispose();
    });

    // 返回初始状态
    return PromptState(controller: controller, text: controller.text);
  }

  void clear() {
    state.controller.clear();
  }

  void updateText(String text) {
    state.controller.text = text;
  }
}
