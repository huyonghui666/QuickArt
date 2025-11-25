
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  final String? iconPath; // 可选的左下角图标

  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 背景图片
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              // 加载和错误时的占位符
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.white,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.white70,
                  ),
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
                          blurRadius: 8.0,
                          color: Colors.black54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  if (iconPath != null)
                    // 如果有图标路径，则显示图标
                    // 注意：这里暂时使用一个占位符图标，您需要替换成实际的 SvgPicture
                    const Icon(
                      Icons.face_retouching_natural, // 临时占位符
                      color: Colors.white,
                      size: 28,
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
