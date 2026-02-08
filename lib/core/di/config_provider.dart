import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/config/app_config.dart';
import 'package:quick_art/core/config/config_dev.dart';
import 'package:quick_art/core/config/config_prod.dart';
import 'package:quick_art/core/config/config_staging.dart';
import 'package:quick_art/core/config/environment.dart';

/// 应用配置 Provider
/// 根据编译参数 `APP_ENVIRONMENT` 动态返回对应的配置实现
final appConfigProvider = Provider<AppConfig>((ref) {
  // 从编译参数读取环境标识，默认为开发环境
  const envString = String.fromEnvironment(
    'APP_ENVIRONMENT',
    defaultValue: 'development',
  );

  final environment = AppEnvironment.fromString(envString);

  // 根据环境返回对应配置实例
  return switch (environment) {
    AppEnvironment.development => DevelopmentConfig(),
    AppEnvironment.staging => StagingConfig(),
    AppEnvironment.production => ProductionConfig(),
  };
});

// 派生Provider：方便直接获取特定配置，减少样板代码
/// API 基础地址 Provider
final apiBaseUrlProvider = Provider<String>((ref) {
  return ref.watch(appConfigProvider).apiBaseUrl;
});

/// 是否启用调试工具 Provider
final enableDebugToolsProvider = Provider<bool>((ref) {
  return ref.watch(appConfigProvider).enableDebugTools;
});
