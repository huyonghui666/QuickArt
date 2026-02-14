import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/core/widgets/draw_button.dart';
import 'package:quick_art/features/tools/domain/entities/video_template.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_template_generation_provider.dart';

/// 视频模板详情页
class VideoTemplateDetailScreen extends ConsumerStatefulWidget {
  final VideoTemplate template;

  const VideoTemplateDetailScreen({super.key, required this.template});

  @override
  ConsumerState<VideoTemplateDetailScreen> createState() =>
      _VideoTemplateDetailScreenState();
}

class _VideoTemplateDetailScreenState
    extends ConsumerState<VideoTemplateDetailScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  /// 选择图片
  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 获取当前语言环境以显示名称
    final locale = Localizations.localeOf(context).languageCode;
    final name =
        widget.template.name[locale] ?? widget.template.name['en'] ?? '';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.settingNavBack),
          onPressed: () => context.pop(),
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // 图片选择区域
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: _selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : CustomPaint(
                            painter: _DashedRectPainter(
                              color: Colors.grey,
                              strokeWidth: 1.5,
                              gap: 5.0,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 48,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // 绘制按钮
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: DrawButton(
              family: 'video_template_detail',
              onTap: () {
                if (_selectedImage != null &&
                    widget.template.description != null) {
                  // 设置生成参数
                  ref
                      .read(videoTemplateInputProvider.notifier)
                      .setInput(
                        _selectedImage!.path,
                        widget.template.description!,
                      );
                  // 导航到等待页面
                  context.push(
                    '/wait/template_video?prompt=${Uri.encodeComponent(widget.template.description!)}',
                  );
                }
              },
              isEnabled: _selectedImage != null,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DashedRectPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(12),
        ),
      );

    final Path dashedPath = _dashPath(path, width: 10, space: gap);
    canvas.drawPath(dashedPath, paint);
  }

  Path _dashPath(Path source, {required double width, required double space}) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dest.addPath(
          metric.extractPath(distance, distance + width),
          Offset.zero,
        );
        distance += width + space;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(_DashedRectPainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        gap != oldDelegate.gap;
  }
}
