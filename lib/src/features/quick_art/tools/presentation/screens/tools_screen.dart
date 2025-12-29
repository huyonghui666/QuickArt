import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/image_card.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/video_card.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'AI 工具',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            // AI 视频卡片
            SizedBox(
              height: 150,
              child: VideoCard(
                videoPath: 'assets/videos/ai_video.mp4',
                title: 'AI 视频',
                onTap: () => context.push('/tools/ai-video'),
              ),
            ),
            const SizedBox(height: 24),
            // 艺术照卡片
            SizedBox(
              height: 150,
              child: VideoCard(
                videoPath: 'assets/videos/artisticPhoto_video.mp4',
                title: '艺术照',
                onTap: () {
                  // TODO: 实现导航到艺术照页面
                },
              ),
            ),
            const SizedBox(height: 24),
            // AI 换脸卡片
            SizedBox(
              height: 150,
              child: ImageCard(
                imageUrl: 'assets/images/tools/AIFaceSwapping.webp',
                title: 'AI 换脸',
                onTap: () {
                  // TODO: 实现导航到 AI 换脸页面
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
