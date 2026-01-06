class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // API URL
  static const String apiBaseUrl = 'http://192.168.178.214:8080/api/v1';

  // WebSocket URL
  static const String webSocketBaseUrl = 'ws://192.168.21.214:8080';
  static const String webSocketImagePath = '/ws/image-generation';
  static const String webSocketVideoPath = '/ws/video-generation';
  static const String webSocketPath = '/ws/generation';

  //websocket超时
  static const Duration timeout = Duration(seconds: 30);

  //最大重试
  static const int maxRetries = 3;
}
