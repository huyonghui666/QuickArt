import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/di/provider/prompt_provider.dart';
import 'package:quick_art/core/widgets/draw_button.dart';
import 'package:quick_art/core/widgets/prompt_text_field.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/features/home/presentation/widgets/art_style_selector.dart';
import 'package:quick_art/features/home/presentation/widgets/inspiration_section.dart';
import 'package:quick_art/features/home/presentation/widgets/sliver_persistent_header_delegate.dart';
import 'package:quick_art/core/theme/app_icons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildTopSection(context, ref)),
                SliverPersistentHeader(
                  delegate: InspirationTabHeaderDelegate(
                    statusBarHeight: statusBarHeight,
                  ),
                  pinned: true,
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: InspirationGrid(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 76.0)),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                //TODO 跳转到等待页面，需不需要防抖？
                child: DrawButton(
                  family: 'textToImage',
                  onTap: () {
                    final prompt = ref.read(promptProvider('textToImage')).text;
                    if (prompt.isEmpty) return;

                    context.pushNamed(
                      'Wait',
                      pathParameters: {'taskType': 'image'},
                      queryParameters: {'prompt': prompt},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(artStyleNotifierProvider);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            selectedStyle.backgroundAsset,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const PromptTextField(family: 'textToImage'),
                  const SizedBox(height: 12),
                  _buildOptionsSection(context),
                  const SizedBox(height: 12),
                  // 艺术风格选择
                  const ArtStyleSelector(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.homeTitle, height: 50),
          Row(
            children: [
              SvgPicture.asset(AppIcons.homeVip, width: 20, height: 20),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => context.push('/setting'),
                child: SvgPicture.asset(
                  AppIcons.homeSettings,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionItem(AppIcons.homeDescribe, '图生文'),
        _buildActionItem(AppIcons.homePhoto, '添加照片'),
        _buildActionItem(
          AppIcons.homeRatio11,
          '1:1',
          trailingIconPath: AppIcons.homeRatioNext,
        ),
        _buildActionItem(AppIcons.homeHistory, '历史'),
      ],
    );
  }

  Widget _buildActionItem(
    String iconPath,
    String label, {
    String? trailingIconPath,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF4A4A4A)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: 12, height: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFCECECE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (trailingIconPath != null) ...[
            const SizedBox(width: 4),
            SvgPicture.asset(trailingIconPath, width: 12, height: 12),
          ],
        ],
      ),
    );
  }
}
