import 'package:flutter/material.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/ai_video_template_card.dart';

class VideoTemplateGrid extends StatelessWidget {
  const VideoTemplateGrid({super.key});

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
      itemCount: 12, // More items for better scrolling
      itemBuilder: (context, index) {
        return VideoTemplateCard(index: index);
      },
    );
  }
}
