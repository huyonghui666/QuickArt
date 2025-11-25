import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/widgets/home/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}
