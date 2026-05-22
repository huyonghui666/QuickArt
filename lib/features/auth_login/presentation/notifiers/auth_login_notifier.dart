import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'auth_login_notifier.g.dart';

/// 认证登录状态
class AuthLoginState {
  /// 构造
  const AuthLoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isLoginSuccess = false,
  });

  /// 是否加载中（请求登录链接阶段）
  final bool isLoading;

  /// 错误信息，非空时展示给用户
  final String? errorMessage;

  /// 登录成功标志
  final bool isLoginSuccess;

  /// 拷贝
  AuthLoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isLoginSuccess,
    bool clearError = false,
  }) {
    return AuthLoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}

/// 认证登录状态管理
@riverpod
class AuthLoginNotifier extends _$AuthLoginNotifier {
  StreamSubscription<Uri>? _deepLinkSub;

  @override
  AuthLoginState build() {
    _listenDeepLink();
    ref.onDispose(() => _deepLinkSub?.cancel());
    return const AuthLoginState();
  }

  /// 发起微信登录：请求后端获取授权链接，然后拉起外部浏览器
  Future<void> startWechatLogin() async {
    if (state.isLoading) return;

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      isLoginSuccess: false,
    );

    try {
      final loginUrl = await ref
          .read(getAuthLoginUrlUseCaseProvider)
          .call(type: 'wx');

      final uri = Uri.parse(loginUrl.url);
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '无法打开授权页面，请检查是否安装了浏览器',
        );
        return;
      }

      // 等待 deep link 回调，保持 loading 状态
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// 清除错误
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void _listenDeepLink() {
    final appLinks = AppLinks();

    // 处理冷启动时已有的 deep link
    appLinks.getInitialLink().then((uri) {
      if (uri != null) _handleCallbackUri(uri);
    });

    // 持续监听热启动 deep link
    _deepLinkSub = appLinks.uriLinkStream.listen(
      _handleCallbackUri,
      onError: (_) {},
    );
  }

  Future<void> _handleCallbackUri(Uri uri) async {
    if (uri.scheme != 'quickart' || uri.host != 'oauth') return;

    final token = uri.queryParameters['token'];
    final error = uri.queryParameters['error'];

    if (token != null && token.isNotEmpty) {
      await ref.read(saveAuthJwtTokenUseCaseProvider).call(token);
      await ref.read(clearUserProfileCacheUseCaseProvider).call();
      state = state.copyWith(
        isLoading: false,
        isLoginSuccess: true,
        clearError: true,
      );
      return;
    }

    state = state.copyWith(
      isLoading: false,
      errorMessage: (error?.isNotEmpty ?? false) ? error : '登录失败，请重试',
    );
  }
}
