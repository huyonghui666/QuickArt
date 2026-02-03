import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/provider/prompt_provider.dart';
import 'package:quick_art/core/widgets/draw_button.dart';
import 'package:quick_art/core/widgets/prompt_text_field.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';
import 'package:quick_art/features/home/presentation/widgets/art_style_selector.dart';
import 'package:quick_art/features/home/presentation/widgets/inspiration_section.dart';
import 'package:quick_art/core/theme/app_icons.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _outerScrollController;

  @override
  void initState() {
    super.initState();
    final categories = ref.read(inspirationCategoriesProvider);
    _tabController = TabController(length: categories.length, vsync: this);
    _outerScrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _outerScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(inspirationCategoriesProvider);
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          NestedScrollView(
            controller: _outerScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: _buildTopSection(context, ref)),
                SliverPersistentHeader(
                  delegate: _InspirationTabHeaderDelegate(
                    controller: _tabController,
                    categories: categories,
                    statusBarHeight: statusBarHeight,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                return CustomScrollView(
                  key: PageStorageKey(category.type.name),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        100,
                      ), // Bottom padding for DrawButton
                      sliver: _InspirationGrid(cards: category.cards),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
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
    );
  }

  Widget _buildTopSection(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(
          child: Consumer(
            builder: (context, ref, child) {
              final selectedStyle = ref.watch(artStyleNotifierProvider);
              return Image.asset(
                selectedStyle.backgroundAsset,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              );
            },
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
                  const ArtStyleSelector(),
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
        _buildActionItem(
          AppIcons.homeDescribe,
          AppLocalizations.of(context)!.home_describe,
        ),
        _buildActionItem(
          AppIcons.homePhoto,
          AppLocalizations.of(context)!.home_add_photo,
        ),
        _buildActionItem(
          AppIcons.homeRatio11,
          '1:1',
          trailingIconPath: AppIcons.homeRatioNext,
        ),
        _buildActionItem(
          AppIcons.homeHistory,
          AppLocalizations.of(context)!.home_history,
        ),
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

class _InspirationTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _InspirationTabHeaderDelegate({
    required this.controller,
    required this.categories,
    required this.statusBarHeight,
  });

  final TabController controller;
  final List<InspirationCategoryModel> categories;
  final double statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: statusBarHeight),
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10), // Adjust padding
        tabs: categories.map((e) => Tab(text: e.type.getLabel(AppLocalizations.of(context)!)),).toList(),
      ),
    );
  }

  @override
  double get maxExtent => 48.0 + statusBarHeight;

  @override
  double get minExtent => 48.0 + statusBarHeight;

  @override
  bool shouldRebuild(_InspirationTabHeaderDelegate oldDelegate) {
    return controller != oldDelegate.controller ||
        categories != oldDelegate.categories ||
        statusBarHeight != oldDelegate.statusBarHeight;
  }
}

class _InspirationGrid extends StatelessWidget {
  const _InspirationGrid({required this.cards});

  final List<InspirationCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final card = cards[index];
        return InspirationCard(card: card);
      },
      itemCount: cards.length,
    );
  }
}
