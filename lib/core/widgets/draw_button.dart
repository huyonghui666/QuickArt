import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';
import 'package:quick_art/src/shared/provider/prompt_provider.dart';

class DrawButton extends ConsumerWidget {
  const DrawButton({
    super.key,
    required this.family,
    required this.onTap,
  });

  final String family;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(promptProvider(family)).text;

    return GestureDetector(
      onTap: () {
        if (prompt.isNotEmpty) {
          onTap();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('请输入提示词！')),
          );
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppIcons.homeBtnStartUnable, fit: BoxFit.cover),
            const Text(
              '绘制',
              style: TextStyle(
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
