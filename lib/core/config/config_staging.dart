import 'package:quick_art/core/config/app_config.dart';
import 'package:quick_art/core/config/environment.dart';

/// 预发布环境配置实现
class StagingConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.staging;

  @override
  String get appName => 'QuickArt (Staging)';

  @override
  String get apiBaseUrl => 'https://api-staging.quickart.com/api/v1'; // 示例预发布地址

  @override
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN_STAGING');

  @override
  double get tracesSampleRate => 1.0;

  @override
  bool get enableDebugTools => true;

  @override
  bool get logNetworkRequests => true;

  @override
  String get webSocketUrl => 'wss://api-staging.quickart.com/ws/generation';

  @override
  Duration get connectionTimeout => const Duration(seconds: 30);

  @override
  String get version => '2.3.1.1';
}
