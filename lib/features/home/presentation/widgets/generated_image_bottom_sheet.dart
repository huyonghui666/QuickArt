import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneratedImageBottomSheet extends StatelessWidget {
  final String imageUrl;

  const GeneratedImageBottomSheet({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 42),
          const Text(
            '可以艾特我们官方社媒 @quickartai',
            style: TextStyle(color: Colors.white70),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialButton('assets/icons/svg/Home/home_ic_history.svg', '保存'),
              _buildSocialButton('assets/icons/svg/Setting/setting_ic_tt.svg', 'TikTok'),
              _buildSocialButton('assets/icons/svg/Setting/setting_ic_ins.svg', 'Instagram'),
              _buildSocialButton('assets/icons/svg/Setting/setting_ic_fb.svg', 'Facebook'),
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
        Text(label),
      ],
    );
  }
}