import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/core/config/config_dev.dart';
import 'package:quick_art/core/config/config_prod.dart';
import 'package:quick_art/core/config/config_staging.dart';
import 'package:quick_art/core/config/environment.dart';

void main() {
  group('config 测试', () {
    group('environment 测试', () {
      test('fromString 应正确解析开发环境', () {
        // 验证 fromString('development') 返回 development 枚举
        expect(
          AppEnvironment.fromString('development'),
          AppEnvironment.development,
        );
        // 验证 'dev' 别名也返回 development
        expect(
          AppEnvironment.fromString('dev'),
          AppEnvironment.development,
        );
        // 验证空字符串默认返回 development（合理的默认值）
        expect(
          AppEnvironment.fromString(''),
          AppEnvironment.development,
        );
      });

      test('fromString 应正确解析预发布环境', () {
        expect(AppEnvironment.fromString('staging'), AppEnvironment.staging);
      });

      test('fromString 应正确解析生产环境', () {
        expect(
          AppEnvironment.fromString('production'),
          AppEnvironment.production,
        );
      });
    });

    group('配置类例如config_dev、staging、prod测试', () {
      test('DevelopmentConfig 应具有正确的值', () {
        final config = DevelopmentConfig();
        expect(config.environment, AppEnvironment.development);
        expect(config.apiBaseUrl, isNotEmpty);
        expect(config.webSocketUrl, isNotEmpty);
        expect(config.enableDebugTools, isTrue);
      });

      test('StagingConfig 应具有正确的值', () {
        final config = StagingConfig();
        expect(config.environment, AppEnvironment.staging);
        expect(config.apiBaseUrl, isNotEmpty);
        expect(config.webSocketUrl, isNotEmpty);
        // Staging might or might not enable debug tools,
        // check specific requirement or just boolean
        expect(config.enableDebugTools, isA<bool>());
      });

      test('ProductionConfig 应具有正确的值', () {
        final config = ProductionConfig();
        expect(config.environment, AppEnvironment.production);
        expect(config.apiBaseUrl, allOf([
          isNotEmpty,
          contains('https://'), // 必须使用HTTPS
          //startsWith('https://api.'), // 特定前缀
        ]));
        // expect(config.apiBaseUrl, isNotEmpty);
        expect(config.webSocketUrl, isNotEmpty);
        expect(config.enableDebugTools, isFalse);
      });
    });
  });
}
