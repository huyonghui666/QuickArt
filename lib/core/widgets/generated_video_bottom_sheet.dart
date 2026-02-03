import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/features/tools/presentation/widgets/tools_video_card.dart';

class GeneratedVideoBottomSheet extends StatelessWidget {
  final String videoUrl;

  const GeneratedVideoBottomSheet({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // 视频播放区域
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9, // 视频通常使用 16:9
              child: VideoCard(videoPath: videoUrl),
            ),
          ),
          const SizedBox(height: 42),
          // 提示文本
          Text(
            l10n.tools_social_hint,
            style: const TextStyle(color: Colors.white70),
          ),
          const Spacer(),
          // 社交分享按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialButton(
                'assets/icons/svg/Home/home_ic_history.svg',
                l10n.tools_save,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_tt.svg',
                l10n.tools_tiktok,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_ins.svg',
                l10n.tools_instagram,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_fb.svg',
                l10n.tools_facebook,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String iconPath, String label) {
    return Column(
      children: [
        SvgPicture.asset(iconPath, width: 50, height: 50),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
