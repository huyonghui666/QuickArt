import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/src/shared/assets/app_icons.dart';
import 'package:quick_art/src/features/quick_art/presentation/notifiers/app_state_notifier.dart';
import 'package:quick_art/src/features/quick_art/presentation/widgets/home/art_style_selector.dart';
import 'package:quick_art/src/features/quick_art/presentation/widgets/home/anime_style_selector.dart';
import 'package:quick_art/src/features/quick_art/presentation/widgets/home/bottom_navigation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(promptProvider);
    final imageCount = ref.watch(imageCountProvider);
    final toggleOption = ref.watch(toggleOptionProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 顶部标题栏
            _buildHeader(context),
            
            // 主要内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 提示词输入区域
                    _buildPromptSection(context, ref),
                    const SizedBox(height: 24),
                    
                    // 切换选项和数量选择
                    _buildOptionsSection(context, ref),
                    const SizedBox(height: 24),
                    
                    // 艺术风格选择
                    const ArtStyleSelector(),
                    const SizedBox(height: 24),
                    
                    // 动漫风格选择
                    _buildAnimeStyleSection(context),
                    const SizedBox(height: 32),
                    
                    // 绘制按钮
                    _buildDrawButton(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIcons.homeTitle,
            height: 50,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.homeVip,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                AppIcons.homeSettings,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromptSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: TextField(
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter your prompt about anything you want to create',
              hintStyle: TextStyle(color: Colors.grey[500]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            onChanged: (value) {
              ref.read(promptProvider.notifier).state = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsSection(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // Image Describe 按钮
        _buildToggleButton(
          context,
          ref,
          ToggleOption.imageDescribe,
          Icons.image,
        ),
        const SizedBox(width: 12),
        
        // Ref Image 按钮
        _buildToggleButton(
          context,
          ref,
          ToggleOption.refImage,
          Icons.photo_library,
        ),
        const SizedBox(width: 12),
        
        // // Count 按钮
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        //   decoration: BoxDecoration(
        //     color: Colors.grey[800],
        //     borderRadius: BorderRadius.circular(12),
        //     border: Border.all(color: Colors.grey[600]!),
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Icon(Icons.grid_view, color: Colors.white70, size: 16),
        //       const SizedBox(width: 8),
        //       Text(
        //         'Count: ${ref.watch(imageCountProvider)}',
        //         style: const TextStyle(
        //           color: Colors.white70,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    WidgetRef ref,
    ToggleOption option,
    IconData icon,
  ) {
    final isSelected = ref.watch(toggleOptionProvider) == option;
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {
        ref.read(toggleOptionProvider.notifier).state = option;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.2) : Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : Colors.grey[600]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? theme.colorScheme.primary : Colors.white70,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              option.label,
              style: TextStyle(
                color: isSelected ? theme.colorScheme.primary : Colors.white70,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimeStyleSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AnimeStyleSelector(),
      ],
    );
  }

  Widget _buildDrawButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.pink.shade400],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ElevatedButton(
          onPressed: () {
            // TODO: 实现绘制功能
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('开始绘制...')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DRAW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}