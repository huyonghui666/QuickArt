import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Request photos permission based on Android version
  static Future<bool> requestPhotosPermission(BuildContext context) async {
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

    return _requestPermission(context, permission, '相册');
  }

  static Future<bool> _requestPermission(
    BuildContext context,
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

    // If permanently denied, show dialog
    if (result.isPermanentlyDenied) {
      if (context.mounted) {
        _showPermissionDialog(context, name);
      }
      return false;
    }

    return false;
  }

  static void _showPermissionDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('需要$name权限'),
            content: Text('请在设置中开启$name权限，以便我们访问您的数据。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('去设置'),
              ),
            ],
          ),
    );
  }
}
