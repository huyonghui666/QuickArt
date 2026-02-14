import 'package:flutter/material.dart';

/// 文生图、首尾帧、多主体的Card
class AiVideoActionCard extends StatelessWidget {
  /// 构造
  const AiVideoActionCard({
    required this.icon, required this.title, super.key,
    this.onTap,
  });
  /// icon
  final IconData icon;
  /// 标题
  final String title;
  /// 点击回调
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 32 - 24) / 3, // (Screen width - padding - spacing) / 3
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
