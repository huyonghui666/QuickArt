import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/text_to_image_notifier.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/video_generation_provider.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/video_card.dart';
import 'package:rive/rive.dart';

final _imageTaskInitProvider = FutureProvider.autoDispose.family<void, String>((
  ref,
  prompt,
) {
  return ref.read(textToImageNotifierProvider.notifier).generateImage(prompt);
});

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
    // 根据 type 调整标题
    final title = taskType == 'video' ? '视频生成中' : '图片生成中';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: taskType == 'video' ? _buildVideoBody(ref) : _buildImageBody(ref),
    );
  }

  Widget _buildVideoBody(WidgetRef ref) {
    final asyncTask = ref.watch(videoGenerationNotifierProvider(prompt));

    return asyncTask.when(
      loading: () => _buildLoadingView(),
      error: (e, _) => _buildErrorView(e.toString(), () {
        ref.read(videoGenerationNotifierProvider(prompt).notifier).retry();
      }),
      data: (task) => task.when(
        submitting: (_) => _buildLoadingView(),
        waiting: (taskId) => _buildLoadingView(),
        success: (_, url) => _buildResultView(url, isVideo: true),
        failed: (_, error) => _buildErrorView(error, () {
          ref.read(videoGenerationNotifierProvider(prompt).notifier).retry();
        }),
      ),
    );
  }

  Widget _buildImageBody(WidgetRef ref) {
    // 触发图片生成任务
    ref.watch(_imageTaskInitProvider(prompt));

    final imageState = ref.watch(textToImageNotifierProvider);

    if (imageState.isLoading) {
      return _buildLoadingView();
    }

    if (imageState.error != null) {
      return _buildErrorView(imageState.error!, () {
        ref.read(textToImageNotifierProvider.notifier).generateImage(prompt);
      });
    }

    if (imageState.taskId != null) {
      final asyncUrl = ref.watch(imageUrlProvider(imageState.taskId!));
      return asyncUrl.when(
        data: (url) => _buildResultView(url, isVideo: false),
        error: (err, stack) => _buildErrorView(err.toString(), () {
          // Retry fetching url or restart task?
          // Restarting task is safer
          ref.read(textToImageNotifierProvider.notifier).generateImage(prompt);
        }),
        loading: () => _buildLoadingView(),
      );
    }

    return _buildLoadingView();
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

  Widget _buildResultView(String url, {required bool isVideo}) {
    if (isVideo) {
      return Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoCard(videoPath: url, title: 'Generated Video'),
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ImagePreviewWidget(url: url),
        ),
      );
    }
  }
}

class ImagePreviewWidget extends StatelessWidget {
  final String url;
  const ImagePreviewWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.broken_image, color: Colors.white)),
      ),
    );
  }
}
