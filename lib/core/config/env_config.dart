class EnvConfig {
  const EnvConfig._();

  //---------------------sentry配置-----------------------------
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'development',
  );

  static const String _sentryDsnFromEnv = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );
  static const String _defaultSentryDsn =
      'https://978a9c75528df7c5baa40634fb4ec54e@o4510808410226688.ingest.us.sentry.io/4510808535269376';

  static String get sentryDsn {
    if (_sentryDsnFromEnv.isNotEmpty) {
      return _sentryDsnFromEnv;
    }
    return _defaultSentryDsn;
  }

  static double get sentryTracesSampleRate {
    // 根据 Flavor 自动回退
    switch (flavor) {
      case 'production':
        return 0.2; // 生产环境 20%
      case 'staging':
        return 0.5; // 预发环境 50%
      default:
        return 1.0; // 开发环境 100%
    }
  }



}
