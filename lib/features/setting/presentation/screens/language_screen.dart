import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/di/localization/locale_provider.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';

/// 语言页面
class LanguageScreen extends ConsumerStatefulWidget {
  /// 构造
  const LanguageScreen({super.key});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  static const Map<String, String> _languageMap = {
    '简体中文': 'zh',
    '繁體中文':
        'zh', // Note: GoRouter does not distinguish between zh-CN and zh-TW, so
    // we use 'zh' for both
    'English': 'en',
    '日本語': 'ja',
    '한국어': 'ko',
    'Français': 'fr',
    'Deutsch': 'de',
    'Español': 'es',
    'Português': 'pt',
    'Русский': 'ru',
    'Italiano': 'it',
    'Nederlands': 'nl',
    'Svenska': 'sv',
    'Norsk': 'no',
    'Dansk': 'da',
  };

  // 用于防止快速点击导致的多次触发
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedLocale = ref.watch(localeProvider);
    final selectedLanguage = _languageMap.entries
        .firstWhere(
          (entry) => entry.value == selectedLocale.languageCode,
          orElse: () => _languageMap.entries.first,
        )
        .key;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.backPreviousPage),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.language, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Material(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: ListView.builder(
            itemCount: _languageMap.length,
            itemBuilder: (context, index) {
              final language = _languageMap.keys.elementAt(index);
              return RadioListTile<String>(
                title: Text(
                  language,
                  style: const TextStyle(color: Colors.white),
                ),
                value: language,
                // ignore: deprecated_member_use
                groupValue: selectedLanguage,
                // ignore: deprecated_member_use
                onChanged: (String? value) {
                  if (value != null) {
                    final localeCode = _languageMap[value];
                    if (localeCode != null &&
                        localeCode != selectedLocale.languageCode) {
                      // 立即更新全局状态会触发全量重建，导致卡顿
                      // 让 Radio 的点击动画（波纹）先跑完一帧，再触发重建
                      _debounceTimer?.cancel();
                      _debounceTimer = Timer(
                        const Duration(milliseconds: 150),
                        () {
                          if (mounted) {
                            ref.read(localeProvider.notifier).state = Locale(
                              localeCode,
                            );
                          }
                        },
                      );
                    }
                  }
                },
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.trailing,
              );
            },
          ),
        ),
      ),
    );
  }
}
