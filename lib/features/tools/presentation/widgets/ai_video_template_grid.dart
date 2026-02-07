import 'package:flutter/material.dart';
import 'package:quick_art/features/tools/data/mock_video_data.dart';
import 'package:quick_art/features/tools/presentation/widgets/ai_video_grid_item.dart';

class VideoTemplateGrid extends StatelessWidget {
  final List<VideoData> videos;

  const VideoTemplateGrid({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 9 / 16, // Aspect ratio for a portrait card
      ),
      itemCount: videos.length, 
      itemBuilder: (context, index) {
        final video = videos[index];
        return AiVideoGridItem(
          index: index,
          videoUrl: video.url,
          coverUrl: video.coverUrl,
        );
      },
    );
  }
}
