import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/generated_image_bottom_sheet.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/text_to_image_notifier.dart';
import 'package:quick_art/src/core/log/logger.dart';
import 'package:rive/rive.dart';

class WaitingScreen extends ConsumerWidget {
  const WaitingScreen({super.key});

  //TODO 在 build 方法中调用 ref.listen ⚠️
  //每次 WaitingScreen 重建时，都会创建新的监听器
  // 旧的监听器不会自动销毁，导致内存泄漏
  // 同一个 taskId 可能被监听多次，导致重复导航

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskId = ref.watch(textToImageNotifierProvider).taskId;
    logger.i('Waiting for taskId: $taskId');

    if (taskId != null) {
      ref.listen<AsyncValue<String>>(imageUrlProvider(taskId), (
        previous,
        next,
      ) {
        next.when(
          data: (imageUrl) {
            logger.i(
              'Received imageUrl: $imageUrl, navigating to result screen',
            );
            //TODO 这样子写有没有问题？
            context.pop();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: const Color(0xFF1A1A1A),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GeneratedImageBottomSheet(imageUrl: imageUrl),
                );
              },
            );
          },
          loading: () {
            logger.i('imageUrlProvider is loading...');
          },
          error: (error, stackTrace) {
            logger.e('Error in imageUrlProvider: $error');
          },
        );
      });
    }

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(
            child: RiveAnimation.asset(
              'assets/rive_animation/4533-9212-wave-form.riv',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Creating...',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  'The picture is being uploaded',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
