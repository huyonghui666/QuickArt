import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/provider/prompt_provider.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class DrawButton extends ConsumerWidget {
  const DrawButton({super.key, required this.family, required this.onTap});

  final String family;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(promptProvider(family)).text;
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        if (prompt.isNotEmpty) {
          onTap();
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.common_enter_prompt)));
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppIcons.homeBtnStartUnable, fit: BoxFit.cover),
            Text(
              l10n.common_draw,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
