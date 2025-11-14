import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.settingNavBack, width: 24, height: 24),
          // onPressed: () => context.go('/'),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          '设置',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingItem(icon: AppIcons.settingDiscord, text: '加入 Discord'),
          _buildSettingItem(icon: AppIcons.settingLanguage, text: '选择语言'),
          _buildSettingItem(icon: AppIcons.settingRateUs, text: '给我们评分'),
          _buildSettingItem(icon: AppIcons.settingPolicy, text: '隐私协议'),
          _buildSettingItem(icon: AppIcons.settingTerms, text: '服务条款'),
          _buildSettingItem(icon: AppIcons.settingMember, text: '会员支持中心'),
          _buildSocialMediaItem(),
          _buildVersionItem(),
        ],
      ),
    );
  }

  Widget _buildSettingItem({required String icon, required String text}) {
    return ListTile(
      leading: SvgPicture.asset(icon, width: 24, height: 24),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: SvgPicture.asset(AppIcons.settingRatioNext, width: 24, height: 24),
      onTap: () {
        // 暂时不实现点击功能
      },
    );
  }

  Widget _buildSocialMediaItem() {
    return ListTile(
      leading: SvgPicture.asset(AppIcons.settingFollowUs, width: 24, height: 24),
      title: const Text('社媒', style: TextStyle(color: Colors.white, fontSize: 16)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: SvgPicture.asset(AppIcons.settingTT), onPressed: () {}),
          IconButton(icon: SvgPicture.asset(AppIcons.settingFB), onPressed: () {}),
          IconButton(icon: SvgPicture.asset(AppIcons.settingIns), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildVersionItem() {
    return ListTile(
      leading: SvgPicture.asset(AppIcons.settingVersion, width: 24, height: 24),
      title: const Text('版本号:', style: TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Text('2.3.1.1', style: TextStyle(color: Colors.grey, fontSize: 16)),
    );
  }
}