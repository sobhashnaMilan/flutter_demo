import 'dart:io';

import '../../util/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PlatformChannel {
  final MethodChannel _platform = const MethodChannel("com.agile.structure");

  void startLocationService() async {
    try {
      final dynamic location = await _platform.invokeMethod(
        "startLocationService",
      );
    } catch (e) {
      rethrow;
    }
  }

  void stopLocationService() async {
    try {
      final dynamic result = await _platform.invokeMethod(
        "stopLocationService",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkForPermission(Permission permission) async {
    if (Platform.isIOS) {
      bool result = await _checkContactPermissionForIOS(permission);
      return result;
    } else if (Platform.isAndroid) {
      bool result = await _checkContactPermissionForAndroid(permission);
      return result;
    } else {
      return false;
    }
  }

  Future<bool> _checkContactPermissionForIOS(Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    Logger().v(" PermissionStatus :: ${permissionStatus.toString()}");
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else if (permissionStatus == PermissionStatus.denied) {
      Logger().v("PermissionGroup :: $permission");
      PermissionStatus status = await permission.request();
      return status == PermissionStatus.granted;
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      Logger().v("PermissionGroup :: $permission");
      openSettings();
      return false;
    } else {
      return false;
    }
  }

  Future<bool> _checkContactPermissionForAndroid(Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    Logger().v(" PermissionStatus :: ${permissionStatus.toString()}");
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else if (permissionStatus == PermissionStatus.denied) {
      PermissionStatus pStatus = await permission.request();
      Logger().v(" PermissionStatus :: ${pStatus.toString()}");
      if (pStatus == PermissionStatus.granted) {
        return true;
      } else if (pStatus == PermissionStatus.permanentlyDenied) {
        return false;
      } else if (pStatus == PermissionStatus.denied) {
        return false;
      } else {
        bool status = await _checkContactPermissionForNeverAsk(permission);
        return status;
      }
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return false;
    }
    return false;
  }

  Future<bool> _checkContactPermissionForNeverAsk(Permission permission) async {
    Logger().v("_check Persmission For NeverAsk");
    PermissionStatus permissionStatus = await permission.request();
    Logger().v(" PermissionStatus :: ${permissionStatus.toString()}");
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return false;
    } else if (permissionStatus == PermissionStatus.denied) {
      return false;
    } else {
      bool status = await _checkContactPermissionForNeverAsk(permission);
      return status;
    }
  }

  Future<bool> openSettings() async {
    bool isOpened = await Geolocator.openAppSettings();
    return isOpened;
  }
}
