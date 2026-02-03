import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/provider/show_bottom_sheet_notifier.dart';
import 'package:quick_art/features/main/presentation/widgets/bottom_navigation.dart';
import 'package:quick_art/features/home/presentation/widgets/generated_image_bottom_sheet.dart';
import 'package:quick_art/features/tools/presentation/widgets/generated_video_bottom_sheet.dart';

class MainScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(showBottomSheetNotifierProvider, (previous, next) {
      if (next != null) {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          backgroundColor: const Color(0xFF1A1A1A),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (sheetContext) {
            return SizedBox(
              height: MediaQuery.of(sheetContext).size.height * 0.75,
              child: next.type == BottomSheetType.video
                  ? GeneratedVideoBottomSheet(videoUrl: next.url)
                  : GeneratedImageBottomSheet(imageUrl: next.url),
            );
          },
        ).then((_) {
          ref.read(showBottomSheetNotifierProvider.notifier).reset();
        });
      }
    });

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}
