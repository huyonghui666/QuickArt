import 'package:go_router/go_router.dart';
import 'package:quick_art/features/tools/domain/entities/video_template.dart';
import 'package:quick_art/features/tools/presentation/screens/ai_video_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/start_end_frame_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/text_to_video_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/tools_screen.dart';
import 'package:quick_art/features/tools/presentation/screens/video_template_detail_screen.dart';

List<GoRoute> get toolsRoutes => [
  GoRoute(path: '/tools', builder: (context, state) => const ToolsScreen()),
];

List<GoRoute> get toolsStandaloneRoutes => [
  GoRoute(
    path: '/tools/ai-video',
    builder: (context, state) => const AiVideoScreen(),
  ),
  GoRoute(
    path: '/tools/ai-video/text-to-video',
    builder: (context, state) => const TextToVideoScreen(),
  ),
  GoRoute(
    path: '/tools/ai-video/start-end-frame',
    builder: (context, state) => const StartEndFrameScreen(),
  ),
  GoRoute(
    path: '/tools/ai-video/template-detail',
    builder: (context, state) {
      final template = state.extra as VideoTemplate;
      return VideoTemplateDetailScreen(template: template);
    },
  ),
];
