import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/features/home/presentation/notifiers/remote_art_style_config_provider.dart';

/// 艺术风格选择器
///
/// 风格列表完全由服务端驱动：
/// 从 [remoteArtStyleConfigNotifierProvider] 读取风格列表，不再依赖本地枚举。
/// 列表首位固定插入"无风格"选项，其余按服务端返回顺序排列。
class ArtStyleSelector extends ConsumerWidget {
  /// 构造
  const ArtStyleSelector({super.key});

  String _styleLabel(AppLocalizations l10n, ArtStyle style) {
    if (style.isNoStyle) {
      return l10n.home_style_no_style;
    }

    switch (_normalizeStyleId(style.id)) {
      case 'cutecartoon':
        return l10n.home_style_cute_cartoon;
      case 'ancientstyle':
        return l10n.home_style_ancient_style;
      case 'graffiti':
        return l10n.home_style_graffiti;
      case 'popart':
        return l10n.home_style_pop_art;
      case 'vividrealism':
        return l10n.home_style_vivid_realism;
      case 'color':
        return l10n.home_style_color;
      case 'eighties':
        return l10n.home_style_eighties;
      case 'showa':
        return l10n.home_style_showa;
      case 'model3d':
        return l10n.home_style_model_3d;
      case 'photography':
      case 'photophotography':
        return l10n.home_style_photography;
      case 'japaneseanime':
        return l10n.home_style_japanese_anime;
      case 'tattoo':
        return l10n.home_style_tattoo;
      case 'retroarcade':
        return l10n.home_style_retro_arcade;
      case 'blackwhite':
        return l10n.home_style_black_white;
      case 'pixar':
        return l10n.home_style_pixar;
      case 'cyberpunk':
        return l10n.home_style_cyberpunk;
      case 'lineart':
        return l10n.home_style_line_art;
      case 'watercolor':
        return l10n.home_style_watercolor;
      default:
        return style.name;
    }
  }

  String _normalizeStyleId(String id) {
    return id.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // 从远程配置读取风格列表；加载中或出错时显示空列表
    final remoteConfig = ref.watch(remoteArtStyleConfigNotifierProvider);
    final remoteStyles = remoteConfig.valueOrNull?.styles ?? [];

    // 首位插入"无风格"占位符，其余为服务端风格
    final styles = [ArtStyle.noStyle, ...remoteStyles];

    final selectedStyle = ref.watch(artStyleNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.home_art_style,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: styles.map((style) {
              final isSelected = selectedStyle.id == style.id;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    ref.read(artStyleNotifierProvider.notifier).setStyle(style);
                  },
                  child: Column(
                    children: [
                      _StyleCard(style: style, selected: isSelected),
                      const SizedBox(height: 6),
                      Text(
                        _styleLabel(l10n, style),
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : const Color(0xFFCECECE),
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _StyleCard extends StatelessWidget {
  const _StyleCard({required this.style, required this.selected});

  final ArtStyle style;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 84,
      height: 74,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? theme.colorScheme.primary : const Color(0xFF4A4A4A),
          width: selected ? 2 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: _content(),
    );
  }

  Widget _content() {
    // 无风格：显示本地 SVG 占位图
    if (style.isNoStyle) {
      return Center(
        child: SvgPicture.asset(AppIcons.homeBgStyleNo, width: 84, height: 74),
      );
    }
    // 服务端风格：thumbnailUrl 为 CDN 签名 URL，使用网络图片加载
    return CachedNetworkImage(
      imageUrl: style.thumbnailUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(color: Colors.grey[900]),
      errorWidget: (context, url, error) => Container(color: Colors.grey[900]),
    );
  }
}
