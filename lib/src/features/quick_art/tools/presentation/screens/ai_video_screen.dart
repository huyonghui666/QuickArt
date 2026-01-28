import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/ai_video_tab_bar_provider.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/ai_video_action_card.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/widgets/ai_video_template_grid.dart';

class AiVideoScreen extends ConsumerStatefulWidget {
  const AiVideoScreen({super.key});

  @override
  ConsumerState<AiVideoScreen> createState() => _AiVideoScreenState();
}

class _AiVideoScreenState extends ConsumerState<AiVideoScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _scrollController;
  //标题透明度
  double _titleOpacity = 0.0;

  //AI 视频 (大标题)和[文生视频]的组件高度
  static const double _contentBlockHeight =
      168.0; // fontSize 32(~40) + padding 24 + cardRow(~80) + padding 24

  @override
  void initState() {
    super.initState();
    final tabs = ref.read(aiVideoTabsProvider);
    _tabController = TabController(length: tabs.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // kToolbarHeight表示 Material Design 应用栏的标准高度（56.0），appBarMinHeight：应用标题栏高度+系统状态栏高度（因为系统状态栏被允许占用了）
    final double appBarMinHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    // 250是SliverAppBar的expandedHeight，也就是应用栏展开高度。scrollForAppBarCollapse：需要滚动的距离：250 - appBarMinHeight
    final double scrollForAppBarCollapse = 250.0 - appBarMinHeight;
    // titleTriggerOffset：计算标题显示的触发点高度
    final double titleTriggerOffset =
        scrollForAppBarCollapse + _contentBlockHeight;
    // 获取当前滚动位置
    final scrollOffset = _scrollController.offset;

    // 计算新状态，是否修改透明度以显示标题
    final double newOpacity = (scrollOffset >= titleTriggerOffset) ? 1.0 : 0.0;

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
                    Image.network(
                      'https://picsum.photos/seed/ai_video_bg/800/1200',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
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
                          stops: const [0.0, 0.4, 0.7],
                        ),
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                title: Text(
                  'AI 视频',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: _titleOpacity),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              expandedHeight: 250,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AI 视频',
                      style: TextStyle(
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
                          title: '文生视频',
                          onTap: () =>
                              context.push('/tools/ai-video/text-to-video'),
                        ),
                        AiVideoActionCard(
                          icon: Icons.movie_filter_outlined,
                          title: '首尾帧',
                          onTap: () =>
                              context.push('/tools/ai-video/start-end-frame'),
                        ),
                        const AiVideoActionCard(
                          icon: Icons.collections_bookmark_outlined,
                          title: '多主体',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  tabs: tabs.map((String name) => Tab(text: name)).toList(),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((String name) {
            return const VideoTemplateGrid();
          }).toList(),
        ),
      ),
    );
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
    return Container(color: Colors.black, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
