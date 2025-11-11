import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptState {
  PromptState({required this.controller, this.text = ''});

  final TextEditingController controller;
  final String text;

  int get wordCount => text.length;

  PromptState copyWith({
    TextEditingController? controller,
    String? text,
  }) {
    return PromptState(
      controller: controller ?? this.controller,
      text: text ?? this.text,
    );
  }
}

class PromptNotifier extends StateNotifier<PromptState> {
  PromptNotifier() : super(PromptState(controller: TextEditingController())) {
    state.controller.addListener(() {
      if (state.text != state.controller.text) {
        state = state.copyWith(text: state.controller.text);
      }
    });
  }

  void clear() {
    state.controller.clear();
  }

  @override
  void dispose() {
    state.controller.dispose();
    super.dispose();
  }
}

final promptProvider = StateNotifierProvider.autoDispose<PromptNotifier, PromptState>((ref) {
  return PromptNotifier();
});