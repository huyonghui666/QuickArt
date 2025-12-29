
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/text_to_image_notifier.dart';

/// This widget listens to the [textToImageNotifierProvider] and handles
/// side effects like navigation or showing snackbars.
/// It does not render any UI itself.
class TextToImageStateListener extends ConsumerWidget {
  const TextToImageStateListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<TextToImageState>(textToImageNotifierProvider, (previous, next) {
      // Handle navigation when a task is created
      if (next.taskId != null && next.taskId!.isNotEmpty) {
        context.push(
          '/waiting',
          extra: {'taskId': next.taskId!, 'type': 'image'},
        );
      }

      // Optionally, handle errors by showing a dialog or a snackbar
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    // This widget does not build any UI, so it returns an empty container.
    return const SizedBox.shrink();
  }
}
