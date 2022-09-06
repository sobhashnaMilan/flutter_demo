import 'dart:io';

import '../../helper_manager/platform_channel/platform_channel.dart';
import '../../ui/style/components/dialog_component.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  factory LocationManager() {
    return _instance;
  }

  static final LocationManager _instance = LocationManager._internal();
  Position? position;

  LocationManager._internal();

  /// Request Permission -*-*-*-*--**-*-*-*-*-*--*-*-*-*--**-*-*-*-*-*--*-*-*-*--**-*-*-*-*-*--*-*-*-*--**-*-*-*-*-*--*-*-*-*--
  Future requestLocationPermissions(
      {BuildContext? context, ValueChanged<Position>? completion}) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
    var status = statuses[Permission.location];

    /// Permission Status Denied
    if (status == PermissionStatus.denied) {
      position = Position(
          latitude: double.parse(StringConstant.appLatitude),
          longitude: double.parse(StringConstant.appLongitude),
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 10.0,
          speedAccuracy: 0.0,
          floor: 0,
          isMocked: false,
          timestamp: DateTime.now());
      completion!(position!);

      /// Permission Status Permanently Denied
    } else if (status == PermissionStatus.permanentlyDenied) {
      DialogComponent.showAlert(
        context!,
        message:
            "EZSection needs location permission to get your current location. So we can displaying near by venues and events , please go to settings and allow access.",
        arrButton: ["Setting", "Cancel"],
        callback: (index) {
          if (index == 0) {
            PlatformChannel().openSettings();
          } else {
            position = Position(
              latitude: double.parse(StringConstant.appLatitude),
              longitude: double.parse(StringConstant.appLongitude),
              accuracy: 0.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 10.0,
              speedAccuracy: 0.0,
              floor: 0,
              isMocked: false,
              timestamp: DateTime.now(),
            );
            completion!(position!);
          }
        },
      );
    } else {
      bool serviceEnabled;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        DialogComponent.showAlert(
          context!,
          message:
              "Location services are disabled. Please enable from settings.",
          arrButton: ["Setting"],
          barrierDismissible: false,
          callback: (index) {
            if (index == 0) {
              PlatformChannel().openSettings();
            }
          },
        );
        return Future.error('Location services are disabled.');
      }

      try {
        if (Platform.isIOS) {
          position = await Geolocator.getPositionStream().first;
        } else {
          position = await Geolocator.getCurrentPosition();
        }

        completion!(position!);
      } catch (error) {
        throw Exception("Error on server");
      }
    }
  }
}
