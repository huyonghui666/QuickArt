import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/localization/notifiers/locale_provider.dart';
import 'package:quick_art/core/theme/app_icons.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  static const Map<String, String> _languageMap = {
    '简体中文': 'zh',
    '繁體中文': 'zh', // Note: GoRouter does not distinguish between zh-CN and zh-TW, so we use 'zh' for both
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedLocale = ref.watch(localeProvider);
    final selectedLanguage = _languageMap.entries
        .firstWhere((entry) => entry.value == selectedLocale.languageCode,
            orElse: () => _languageMap.entries.first)
        .key;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.settingNavBack),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.language,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                groupValue: selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    final localeCode = _languageMap[value];
                    if (localeCode != null) {
                      ref.read(localeProvider.notifier).state =
                          Locale(localeCode);
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