import 'package:flutter/material.dart';

/// tools页面的图片Card
class ImageCard extends StatelessWidget {
  /// 构造
  const ImageCard({
    required this.imageUrl, required this.title, super.key,
    this.onTap,
  });
  /// 图片url
  final String imageUrl;
  /// 标题
  final String title;
  /// 点击回调
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 背景图片
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // 本地资源加载失败时的占位符
                return const Center(
                  child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white70)
                );
              },
            ),

            // 底部渐变
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.5, 0.7, 1.0],
                ),
              ),
            ),

            // 标题和图标
            Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
