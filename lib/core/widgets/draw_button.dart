import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/provider/prompt_provider.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class DrawButton extends ConsumerWidget {
  const DrawButton({
    super.key,
    required this.family,
    required this.onTap,
    this.isEnabled,
  });

  final String family;
  final VoidCallback onTap;

  /// 外部控制是否启用，如果为null则使用 prompt.isNotEmpty 判断
  final bool? isEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(promptProvider(family)).text;
    final l10n = AppLocalizations.of(context)!;
    // 优先使用外部传入的 isEnabled，否则检查 prompt 是否为空
    final active = isEnabled ?? prompt.isNotEmpty;

    return GestureDetector(
      onTap: () {
        if (active) {
          onTap();
        } else {
          // 如果没有启用，提示用户
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
            SvgPicture.asset(
              active ? AppIcons.homeBtnStart : AppIcons.homeBtnStartUnable,
              fit: BoxFit.cover,
            ),
            Text(
              l10n.common_draw,
              style: TextStyle(
                color: active ? Colors.white : Colors.grey,
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
