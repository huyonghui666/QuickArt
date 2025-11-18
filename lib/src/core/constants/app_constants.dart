class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // API URL
  static const String apiBaseUrl = 'http://192.168.178.214:8080/api/v1';

  // WebSocket URL
  static const String webSocketBaseUrl = 'ws://192.168.178.214:8080';
  static const String webSocketPath = '/ws/image-generation';
}