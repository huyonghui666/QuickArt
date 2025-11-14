import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/prompt_provider.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/art_style_selector.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/bottom_navigation.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/inspiration_section.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/sliver_persistent_header_delegate.dart';

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
                    statusBarHeight: statusBarHeight),
                pinned: true,
              ),
              const SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: InspirationGrid(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 76.0),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: _buildDrawButton(context),
            ),
          ),
        ],
      ),
    ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  Widget _buildTopSection(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(artStyleProvider);
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
                  _buildPromptSection(context, ref),
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
              SvgPicture.asset(AppIcons.homeSettings, width: 24, height: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromptSection(BuildContext context, WidgetRef ref) {
    final promptState = ref.watch(promptProvider);

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
                hintText: '输入你的提示词, 可以是任何你想创造的东西',
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
                        ref.read(promptProvider.notifier).clear();
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


  Widget _buildDrawButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: 实现绘制功能
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('开始绘制...')),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.homeBtnStartUnable,
              fit: BoxFit.cover,
            ),
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
