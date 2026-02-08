/// 应用运行环境枚举
enum AppEnvironment {
  /// 开发环境
  development('开发环境', 'dev'),

  /// 预发布环境
  staging('预发布环境', 'staging'),

  /// 生产环境
  production('生产环境', 'prod');

  /// 环境显示名称
  final String displayName;

  /// 环境简称（dev、staging、prod）
  final String shortName;

  const AppEnvironment(this.displayName, this.shortName);

  /// 从字符串转换为枚举
  static AppEnvironment fromString(String value) {
    return switch (value) {
      'staging' => AppEnvironment.staging,
      'production' => AppEnvironment.production,
      _ => AppEnvironment.development,
    };
  }
}
