import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/core/di/config/config_provider.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final config = ref.watch(appConfigProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.settingNavBack,
            width: 24,
            height: 24,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.setting, // This will be 'Language' or '语言'
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
                _buildSettingItem(
                  icon: AppIcons.settingDiscord,
                  text: l10n.setting_discord,
                ),
                _buildSettingItem(
                  icon: AppIcons.settingLanguage,
                  text: l10n.language,
                  onTap: () => context.push('/setting/language'),
                ),
                _buildSettingItem(
                  icon: AppIcons.settingRateUs,
                  text: l10n.setting_rate_us,
                ),
                _buildSettingItem(
                  icon: AppIcons.settingPolicy,
                  text: l10n.setting_privacy_policy,
                ),
                _buildSettingItem(
                  icon: AppIcons.settingTerms,
                  text: l10n.setting_terms_of_service,
                ),
                _buildSettingItem(
                  icon: AppIcons.settingMember,
                  text: l10n.setting_member_center,
                ),
                _buildSocialMediaItem(l10n),
                _buildVersionItem(l10n, config.version),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(icon, width: 24, height: 24),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      trailing: SvgPicture.asset(
        AppIcons.settingRatioNext,
        width: 20,
        height: 20,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSocialMediaItem(AppLocalizations l10n) {
    return ListTile(
      leading: SvgPicture.asset(
        AppIcons.settingFollowUs,
        width: 24,
        height: 24,
      ),
      title: Text(
        l10n.setting_social_media,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
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

  Widget _buildVersionItem(AppLocalizations l10n, String version) {
    return ListTile(
      leading: SvgPicture.asset(AppIcons.settingVersion, width: 24, height: 24),
      title: Text(
        l10n.setting_version,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Text(
        version,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
