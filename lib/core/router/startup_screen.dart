import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/di/injection_container.dart';

/// 应用冷启动引导页
class StartupScreen extends ConsumerStatefulWidget {
  /// 构造
  const StartupScreen({super.key});

  @override
  ConsumerState<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends ConsumerState<StartupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restoreSession();
    });
  }

  Future<void> _restoreSession() async {
    try {
      await ref.read(clearUserProfileCacheUseCaseProvider).call();
      await ref.read(getUserProfileUseCaseProvider).call();
      if (!mounted) return;
      context.go('/');
    } on Exception {
      await ref.read(clearAuthJwtTokenUseCaseProvider).call();
      await ref.read(clearUserProfileCacheUseCaseProvider).call();
      if (!mounted) return;
      context.go('/auth/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
