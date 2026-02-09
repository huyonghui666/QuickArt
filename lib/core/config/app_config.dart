import 'package:quick_art/core/config/environment.dart';

/// 应用配置抽象基类
/// 定义所有环境必须实现的配置项
abstract class AppConfig {
  /// 当前环境
  AppEnvironment get environment;

  /// 应用名称
  String get appName;

  /// API 基础地址
  String get apiBaseUrl;

  /// Sentry 错误监控 DSN
  String get sentryDsn;

  /// Sentry 采样率 (0.0 - 1.0)
  double get tracesSampleRate;

  /// 是否启用调试工具
  bool get enableDebugTools;

  /// 是否打印网络请求日志
  bool get logNetworkRequests;

  /// WebSocket 连接地址
  String get webSocketUrl;

  /// 网络连接超时时间
  Duration get connectionTimeout;
}
