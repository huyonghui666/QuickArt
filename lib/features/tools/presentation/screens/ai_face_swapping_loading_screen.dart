import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/features/tools/presentation/notifilers/face_detect_notifier.dart';
import 'package:quick_art/features/tools/presentation/screens/ai_face_swapping_screen.dart';

/// AI 换脸加载页面（人脸检测中）
class AiFaceSwappingLoadingScreen extends ConsumerStatefulWidget {
  /// 构造
  const AiFaceSwappingLoadingScreen({required this.imagePath, super.key});

  /// 用户选择的本地图片路径
  final String imagePath;

  @override
  ConsumerState<AiFaceSwappingLoadingScreen> createState() =>
      _AiFaceSwappingLoadingScreenState();
}

class _AiFaceSwappingLoadingScreenState
    extends ConsumerState<AiFaceSwappingLoadingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(faceDetectProvider.notifier).detect(widget.imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    ref.listen(faceDetectProvider, (_, next) {
      next.whenOrNull(
        data: (result) {
          if (!context.mounted) return;
          if (result == null) return;
          if (result.faces.isEmpty) {
            context.pop();
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.tools_ai_face_swap_no_face_hint),
                ),
              );
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (_) => const FaceSwapGuideBottomSheet(),
              );
            });
          } else {
            context.pushReplacement(
              '/tools/ai-face-swapping/select',
              extra: result,
            );
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            File(widget.imagePath),
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withValues(alpha: 0.6)),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, top: 8),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppIcons.backPreviousPage,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 加载图标占位（后续替换为实际动画资源）
              const SizedBox(height: 80, width: 80),
              const SizedBox(height: 16),
              Text(
                l10n.tools_ai_face_swap_loading,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
