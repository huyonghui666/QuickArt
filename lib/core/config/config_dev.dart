import 'package:quick_art/core/config/app_config.dart';
import 'package:quick_art/core/config/environment.dart';

/// 开发环境配置实现
class DevelopmentConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.development;

  @override
  String get appName => 'QuickArt (Dev)';

  @override
  String get apiBaseUrl => 'http://192.168.62.214:8080/api/v1'; // 开发环境本地地址

  @override
  String get sentryDsn => '';

  @override
  double get tracesSampleRate => 1.0; // 开发环境全量采样

  @override
  bool get enableDebugTools => true;

  @override
  bool get logNetworkRequests => true;

  @override
  String get webSocketUrl => 'ws://192.168.62.214:8080/ws/generation';

  @override
  Duration get connectionTimeout => const Duration(seconds: 30);

  @override
  String get version => '2.3.1.1';
}
