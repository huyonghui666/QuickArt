import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/core/log/logger.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/image_generation_provider.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/video_generation_provider.dart';
import 'package:quick_art/src/shared/provider/show_bottom_sheet_notifier.dart';
import 'package:rive/rive.dart';

class WaitingScreen extends ConsumerWidget {
  final String taskType;
  final String prompt;

  const WaitingScreen({
    super.key,
    required this.taskType,
    required this.prompt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (taskType == 'video') {
      ref.listen(videoGenerationNotifierProvider(prompt), (previous, next) {
        next.whenData((task) {
          task.maybeWhen(
            success: (_, url) {
              logger.i('Video generation success: $url');

              // 先执行 pop 关闭当前等待页
              if (context.mounted) {
                context.pop();
              }

              // 再触发状态，让上一页（TextToVideoScreen）弹出底部结果栏
              // 这样避免了先弹出底部栏（成为栈顶）随后被 pop 掉的问题
              ref
                  .read(showBottomSheetNotifierProvider.notifier)
                  .trigger(url, BottomSheetType.video);
            },
            orElse: () {},
          );
        });
      });
    } else if (taskType == 'image') {
      ref.listen(imageGenerationNotifierProvider(prompt), (previous, next) {
        next.whenData((task) {
          task.maybeWhen(
            success: (_, url) {
              logger.i('Video generation success: $url');

              // 先执行 pop 关闭当前等待页
              if (context.mounted) {
                context.pop();
              }

              // 再触发状态，让上一页（TextToVideoScreen）弹出底部结果栏
              // 这样避免了先弹出底部栏（成为栈顶）随后被 pop 掉的问题
              ref
                  .read(showBottomSheetNotifierProvider.notifier)
                  .trigger(url, BottomSheetType.image);
            },
            orElse: () {},
          );
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: taskType == 'video'
          ? _buildVideoBody(context, ref)
          : _buildImageBody(ref),
    );
  }

  Widget _buildVideoBody(BuildContext context, WidgetRef ref) {
    final asyncTask = ref.watch(videoGenerationNotifierProvider(prompt));

    return asyncTask.when(
      loading: () => _buildLoadingView(),
      error: (e, _) => _buildErrorView(e.toString(), () {
        ref.read(videoGenerationNotifierProvider(prompt).notifier).retry();
      }),
      data: (task) => task.when(
        // 成功时，ref.listen 会处理页面跳转，这里继续保持 Loading 状态即可
        // 避免构建无用的 successView
        success: (_, __) => _buildLoadingView(),
        //TODO 错误处理还需要优化，不一定是网络问题，可能是敏感词
        failed: (_, error) => _buildErrorView(error, () {
          ref.read(videoGenerationNotifierProvider(prompt).notifier).retry();
        }),
      ),
    );
  }

  Widget _buildImageBody(WidgetRef ref) {
    final asyncTask = ref.watch(ImageGenerationNotifierProvider(prompt));

    return asyncTask.when(
      loading: () => _buildLoadingView(),
      error: (e, _) => _buildErrorView(e.toString(), () {
        ref.read(ImageGenerationNotifierProvider(prompt).notifier).retry();
      }),
      data: (task) => task.when(
        // 成功时，ref.listen 会处理页面跳转，这里继续保持 Loading 状态即可
        // 避免构建无用的 successView
        success: (_, __) => _buildLoadingView(),
        //TODO 错误处理还需要优化，不一定是网络问题，可能是敏感词
        failed: (_, error) => _buildErrorView(error, () {
          ref.read(ImageGenerationNotifierProvider(prompt).notifier).retry();
        }),
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Stack(
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
                'The masterpiece is being generated',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(String error, VoidCallback onRetry) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
