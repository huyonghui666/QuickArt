import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';

class WorkshopTaskCard extends StatelessWidget {
  final WorkshopTask task;
  final VoidCallback? onRetry;
  final VoidCallback? onTap;

  const WorkshopTaskCard({
    super.key,
    required this.task,
    this.onRetry,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C), // Dark grey background
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildContent(),
          if (task.status == WorkshopTaskStatus.success)
            Positioned(
              left: 10,
              bottom: 10,
              child: Icon(
                task.type == GenerateTaskType.video
                    ? Icons.videocam
                    : Icons.image,
                color: Colors.white,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (task.status) {
      case WorkshopTaskStatus.processing:
        return _buildProcessingState();
      case WorkshopTaskStatus.success:
        return _buildSuccessState();
      case WorkshopTaskStatus.failed:
        return _buildFailedState();
    }
  }

  Widget _buildProcessingState() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2C2C2C),
            const Color(0xFF2C2C2C).withValues(alpha: 0.8),
            Colors.purple.withValues(alpha: 0.2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ),
          SizedBox(height: 16),
          Text(
            '绘图过程中，请耐心等待',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    if (task.url == null) return const SizedBox();

    // 优先使用 thumbnailUrl (特别是视频任务)，如果为空则尝试使用 url (图片任务)
    // 如果是视频且没有缩略图，才使用占位符
    final imageUrl =
        task.thumbnailUrl ??
        (task.type == GenerateTaskType.image
            ? task.url!
            : 'https://via.placeholder.com/300x300.png?text=Video');

    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Container(color: const Color(0xFF2C2C2C)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildFailedState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          task.errorMessage ?? '生成失败，请重试！',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onRetry,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3C3C3C),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          child: const Text('重试'),
        ),
      ],
    );
  }
}
