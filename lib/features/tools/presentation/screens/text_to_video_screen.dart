import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/di/prompt_provider.dart';
import 'package:quick_art/core/widgets/draw_button.dart';
import 'package:quick_art/core/widgets/prompt_text_field.dart';

class TextToVideoScreen extends ConsumerStatefulWidget {
  const TextToVideoScreen({super.key});

  @override
  ConsumerState<TextToVideoScreen> createState() => _TextToVideoScreenState();
}

class _TextToVideoScreenState extends ConsumerState<TextToVideoScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/svg/Setting/btn_nav_back.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top Section with Background
          Stack(
            children: [
              Positioned.fill(
                child: RepaintBoundary(
                  child: Image.asset(
                    'assets/images/bg/blurred-image.webp',
                    fit: BoxFit.cover,
                  ),
                  // ImageFiltered(
                  //   imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  //   child: Image.asset(
                  //     'assets/images/bg/no_style.webp',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        l10n.tools_text_to_video,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const PromptTextField(family: 'textToVideo'),
                      const SizedBox(height: 24),
                      _buildOptions(context, theme, l10n),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Bottom Section
          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Spacer(),
                    DrawButton(
                      family: 'textToVideo',
                      onTap: () {
                        final prompt = ref
                            .read(promptProvider('textToVideo'))
                            .text;
                        if (prompt.isEmpty) return;

                        context.pushNamed(
                          'Wait',
                          pathParameters: {'taskType': 'video'},
                          queryParameters: {'prompt': prompt},
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    return Row(
      children: [
        _buildOptionItem(
          context,
          theme,
          iconPath: 'assets/icons/svg/Home/home_nav_explore_press.svg',
          label: l10n.tools_random,
        ),
        const SizedBox(width: 16),
        _buildOptionItem(
          context,
          theme,
          iconPath: 'assets/icons/svg/Home/ratio_ic_11.svg',
          label: '1:1',
        ),
      ],
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    ThemeData theme, {
    required String iconPath,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 16,
            height: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
