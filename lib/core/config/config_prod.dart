import 'package:quick_art/core/config/app_config.dart';
import 'package:quick_art/core/config/environment.dart';

/// 生产环境配置实现
class ProductionConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.production;

  @override
  String get appName => 'QuickArt';

  @override
  String get apiBaseUrl => 'https://api.quickart.com/api/v1'; // 示例生产地址

  @override
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN_PROD');

  @override
  double get tracesSampleRate => 0.2; // 生产环境降低采样率以节省流量

  @override
  bool get enableDebugTools => false;

  @override
  bool get logNetworkRequests => false;

  @override
  String get webSocketUrl => 'wss://api.quickart.com/ws/generation';

  @override
  Duration get connectionTimeout => const Duration(seconds: 30);

  @override
  String get version => '2.3.1.1';
}
