import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

/// 权限管理
class PermissionManager {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Request photos permission based on Android version
  static Future<bool> requestPhotosPermission() async {
    Permission permission;

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      // Android 13 (API 33) and above use Permission.photos
      if (androidInfo.version.sdkInt >= 33) {
        permission = Permission.photos;
      } else {
        // Android < 13 uses Permission.storage
        permission = Permission.storage;
      }
    } else if (Platform.isIOS) {
      permission = Permission.photos;
    } else {
      // For other platforms, assume true
      return true;
    }

    return _requestPermission(permission, '相册');
  }

  static Future<bool> _requestPermission(
    Permission permission,
    String name,
  ) async {
    final status = await permission.status;

    if (status.isGranted || status.isLimited) {
      return true;
    }

    // If denied or restricted, request it
    final result = await permission.request();
    if (result.isGranted || result.isLimited) {
      return true;
    }

    // If permanently denied, open app settings directly
    if (result.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return false;
  }
}
