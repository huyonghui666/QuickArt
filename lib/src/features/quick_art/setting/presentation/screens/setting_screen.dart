import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';
import 'package:quick_art/src/shared/localization/l10n/app_localizations.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.settingNavBack, width: 24, height: 24),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.setting, // This will be 'Language' or '语言'
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Material(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _buildSettingItem(icon: AppIcons.settingDiscord, text: '加入 Discord'),
                _buildSettingItem(icon: AppIcons.settingLanguage, text: l10n.language, onTap: () => context.push('/setting/language')),
                _buildSettingItem(icon: AppIcons.settingRateUs, text: '给我们评分'),
                _buildSettingItem(icon: AppIcons.settingPolicy, text: '隐私协议'),
                _buildSettingItem(icon: AppIcons.settingTerms, text: '服务条款'),
                _buildSettingItem(icon: AppIcons.settingMember, text: '会员支持中心'),
                _buildSocialMediaItem(),
                _buildVersionItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({required String icon, required String text, VoidCallback? onTap}) {
    return ListTile(
      leading: SvgPicture.asset(icon, width: 24, height: 24),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      trailing: SvgPicture.asset(AppIcons.settingRatioNext, width: 20, height: 20),
      onTap: onTap,
    );
  }

  Widget _buildSocialMediaItem() {
    return ListTile(
      leading: SvgPicture.asset(AppIcons.settingFollowUs, width: 24, height: 24),
      title: const Text('社媒', style: TextStyle(color: Colors.white, fontSize: 14)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.settingTT, width: 20, height: 20),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
          ),
          IconButton(
            icon: SvgPicture.asset(AppIcons.settingFB, width: 20, height: 20),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
          ),
          IconButton(
            icon: SvgPicture.asset(AppIcons.settingIns, width: 20, height: 20),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionItem() {
    return ListTile(
      leading: SvgPicture.asset(AppIcons.settingVersion, width: 24, height: 24),
      title: const Text('版本号:', style: TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Text('2.3.1.1', style: TextStyle(color: Colors.grey, fontSize: 14)),
    );
  }
}