import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/provider/prompt_provider.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class PromptTextField extends ConsumerWidget {
  const PromptTextField({super.key, required this.family});

  final String family;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptState = ref.watch(promptProvider(family));
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(
        1.5,
      ), // This padding creates the border effect
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Colors.purpleAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            TextField(
              controller: promptState.controller,
              maxLines: 4,
              maxLength: 500,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1A1A1A),
                hintText: l10n.common_prompt_hint,
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                counterText: '', // Hide the default counter
              ),
            ),
            if (promptState.text.isNotEmpty)
              Positioned(
                bottom: 12,
                left: 16,
                child: Text(
                  '${promptState.wordCount}/500',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ),
            if (promptState.text.isNotEmpty)
              Positioned(
                bottom: 12,
                right: 16,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.promptBack,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 15),
                    SvgPicture.asset(
                      AppIcons.promptNextUnable,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        ref.read(promptProvider(family).notifier).clear();
                      },
                      child: SvgPicture.asset(
                        AppIcons.promptDelete,
                        width: 20,
                        height: 20,
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
