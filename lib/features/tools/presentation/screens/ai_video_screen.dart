import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/features/tools/presentation/notifilers/ai_video_tab_bar_provider.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_template_notifier.dart';
import 'package:quick_art/features/tools/presentation/widgets/ai_video_action_card.dart';
import 'package:quick_art/features/tools/presentation/widgets/ai_video_header_player.dart';
import 'package:quick_art/features/tools/presentation/widgets/ai_video_template_grid.dart';

/// AiVideo页面
class AiVideoScreen extends ConsumerStatefulWidget {
  /// 构造
  const AiVideoScreen({super.key});

  @override
  ConsumerState<AiVideoScreen> createState() => _AiVideoScreenState();
}

class _AiVideoScreenState extends ConsumerState<AiVideoScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _scrollController;
  //标题透明度
  double _titleOpacity = 0;
  String _currentTabKey = '';

  //AI 视频 (大标题)和[文生视频]的组件高度
  static const double _contentBlockHeight =
      168; // fontSize 32(~40) + padding 24 + cardRow(~80) + padding 24

  @override
  void initState() {
    super.initState();
    final tabs = ref.read(aiVideoTabsProvider);
    if (tabs.isNotEmpty) {
      _currentTabKey = tabs.first;
    }
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController..removeListener(_onTabChanged)
    ..dispose();
    _scrollController..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      // Wait for animation to finish or update immediately?
      // Usually better to update when index changes to feel responsive
    }
    // Update current tab key based on index
    final tabs = ref.read(aiVideoTabsProvider);
    if (_tabController.index < tabs.length) {
      final newKey = tabs[_tabController.index];
      if (newKey != _currentTabKey) {
        setState(() {
          _currentTabKey = newKey;
        });
      }
    }
  }

  void _onScroll() {
    // kToolbarHeight表示 Material Design 应用栏的标准高度（56.0），appBarMinHeight：
    // 应用标题栏高度+系统状态栏高度（因为系统状态栏被允许占用了）
    final appBarMinHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    // 250是SliverAppBar的expandedHeight，也就是应用栏展开高度。scrollForAppBarCollapse：
    // 需要滚动的距离：250 - appBarMinHeight
    final scrollForAppBarCollapse = 250.0 - appBarMinHeight;
    // titleTriggerOffset：计算标题显示的触发点高度
    final titleTriggerOffset =
        scrollForAppBarCollapse + _contentBlockHeight;
    // 获取当前滚动位置
    final scrollOffset = _scrollController.offset;

    // 计算新状态，是否修改透明度以显示标题
    final newOpacity = (scrollOffset >= titleTriggerOffset) ? 1.0 : 0.0;

    // 只在状态变化时更新UI
    if (newOpacity != _titleOpacity) {
      setState(() {
        _titleOpacity = newOpacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ref.watch(aiVideoTabsProvider);
    final l10n = AppLocalizations.of(context)!;
    // 获取当前 Tab 对应的视频模板数据，用于头部展示
    final headerTemplatesAsync = ref.watch(
      videoTemplatesProvider(category: _currentTabKey),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        controller: _scrollController, // Attach the scroll controller
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              pinned: true,
              leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/svg/Setting/btn_nav_back.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: () => context.pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // TODO(user): 这是兜底图片应该使用覆盖图
                    // 头部背景视频/图片展示
                    headerTemplatesAsync.when(
                      data: (page) {
                        // 如果有数据，展示列表中的第一个视频作为头部背景
                        if (page.items.isNotEmpty) {
                          return AiVideoHeaderPlayer(
                            videoUrl: page.items.first.videoUrl,
                          );
                        }
                        // 兜底图片
                        return Image.network(
                          'https://picsum.photos/seed/ai_video_bg/800/1200',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        );
                      },
                      loading: () => Image.network(
                        'https://picsum.photos/seed/ai_video_bg/800/1200',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      error: (_, _) => Image.network(
                        'https://picsum.photos/seed/ai_video_bg/800/1200',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.1),
                            Colors.black.withValues(alpha: 0.6),
                            Colors.black,
                          ],
                          stops: const [0.0, 0.4, 1.0],
                        ),
                      ),
                    ),
                    // 内容区域：标题 + 功能卡片
                    Padding(
                      padding: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).padding.top + kToolbarHeight,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.tools_ai_video,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AiVideoActionCard(
                                icon: Icons.text_fields,
                                title: l10n.tools_text_to_video,
                                onTap: () => context.push(
                                  '/tools/ai-video/text-to-video',
                                ),
                              ),
                              AiVideoActionCard(
                                icon: Icons.movie_filter_outlined,
                                title: l10n.tools_start_end_frame,
                                onTap: () => context.push(
                                  '/tools/ai-video/start-end-frame',
                                ),
                              ),
                              AiVideoActionCard(
                                icon: Icons.collections_bookmark_outlined,
                                title: l10n.tools_multi_subject,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                title: Text(
                  l10n.tools_ai_video,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: _titleOpacity),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              expandedHeight: 380,
            ),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  tabs: tabs
                      .map((String key) => Tab(text: _getTabTitle(key, l10n)))
                      .toList(),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((String key) {
            return VideoTemplateGrid(category: key);
          }).toList(),
        ),
      ),
    );
  }

  String _getTabTitle(String key, AppLocalizations l10n) {
    switch (key) {
      case 'popular':
        return l10n.tools_tab_popular;
      case 'kiss':
        return l10n.tools_tab_kiss;
      case 'hug':
        return l10n.tools_tab_hug;
      case 'ai_effects':
        return l10n.tools_tab_ai_effects;
      case 'style_transfer':
        return l10n.tools_tab_style_transfer;
      case 'rich_life':
        return l10n.tools_tab_rich_life;
      case 'cross_dimension':
        return l10n.tools_tab_cross_dimension;
      case 'animal_effects':
        return l10n.tools_tab_animal_effects;
      case 'romantic_day':
        return l10n.tools_tab_romantic_day;
      case 'movie_life':
        return l10n.tools_tab_movie_life;
      case 'cross_dressing':
        return l10n.tools_tab_cross_dressing;
      case 'dance':
        return l10n.tools_tab_dance;
      case 'micro_world':
        return l10n.tools_tab_micro_world;
      default:
        return key;
    }
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(color: Colors.black, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
