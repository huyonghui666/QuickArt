import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/start_end_frame_provider.dart';
import 'package:quick_art/src/shared/widgets/draw_button.dart';
import 'package:quick_art/src/shared/widgets/prompt_text_field.dart';
import 'package:quick_art/src/shared/provider/prompt_provider.dart';

class StartEndFrameScreen extends ConsumerWidget {
  const StartEndFrameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startEndFrameState = ref.watch(startEndFrameProvider);
    final notifier = ref.read(startEndFrameProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(-12, 0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () => context.pop(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Title
                    const Text(
                      '首尾帧',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Image Upload Cards
                    Row(
                      children: [
                        Expanded(
                          child: _ImageUploadCard(
                            title: '上传首帧图片',
                            imagePath: startEndFrameState.startFramePath,
                            onTap: () async {
                              final picker = ImagePicker();
                              final image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image != null) {
                                notifier.setStartFrame(image.path);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _ImageUploadCard(
                            title: '上传尾帧图片',
                            imagePath: startEndFrameState.endFramePath,
                            onTap: () async {
                              final picker = ImagePicker();
                              final image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image != null) {
                                notifier.setEndFrame(image.path);
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Prompt Section
                    const Text(
                      '提示',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const PromptTextField(family: 'start_end_frame'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  // Draw Button
                  Center(
                    child: DrawButton(
                      family: 'start_end_frame',
                      onTap: () {
                        if (startEndFrameState.startFramePath == null ||
                            startEndFrameState.endFramePath == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('请上传首尾帧图片')),
                          );
                          return;
                        }

                        final prompt = ref
                            .read(promptProvider('start_end_frame'))
                            .text;

                        context.pushNamed(
                          'Wait',
                          pathParameters: {'taskType': 'start_end_frame'},
                          queryParameters: {'prompt': prompt},
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageUploadCard extends StatelessWidget {
  const _ImageUploadCard({
    required this.title,
    required this.onTap,
    this.imagePath,
  });

  final String title;
  final VoidCallback onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
            style: BorderStyle
                .none, // We simulate dashed border if needed, but keeping it simple for now
          ),
        ),
        child: Stack(
          children: [
            // Dashed border effect (simplified with just border for now or we can use CustomPaint)
            Positioned.fill(
              child: CustomPaint(
                painter: _DashedBorderPainter(
                  color: Colors.white.withValues(alpha: 0.3),
                ),
              ),
            ),
            if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.file(File(imagePath!), fit: BoxFit.cover),
                ),
              )
            else
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add, color: Colors.white, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 14,
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

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DashedBorderPainter({
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
          const Radius.circular(16),
        ),
      );

    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashedPath.addPath(
          metric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
