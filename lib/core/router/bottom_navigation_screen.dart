import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/provider/show_bottom_sheet_notifier.dart';
import 'package:quick_art/core/router/bottom_navigation.dart';
import 'package:quick_art/core/widgets/generated_image_bottom_sheet.dart';
import 'package:quick_art/core/widgets/generated_video_bottom_sheet.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends ConsumerState<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: widget.navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: widget.navigationShell,
      ),
    );
  }
}
