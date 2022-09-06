import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as map_location;
import 'package:location/location.dart';

import '../util/app_logger.dart';

class LocationController extends GetxController {
  var location = map_location.Location();
  var latitude = 23.021833.obs;
  var longitude = 72.545019.obs;
  var destinationLatitude = 23.0219006.obs;
  var destinationLongitude = 72.5372323.obs;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  List<LatLng> polylineCoordinates = <LatLng>[].obs;
  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{}.obs;
  PolylinePoints polylinePoints = PolylinePoints();

  /// polyline point
  /// 23.0219006
  /// 72.5372323

  @override
  void onInit() async {
    super.onInit();
    Logger().d( "onInit");
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      Logger().d( "check permission");
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        Logger().d( "permission granted");
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    location.enableBackgroundMode(enable: true);
    latitude.value = locationData.latitude!;
    longitude.value = locationData.longitude!;
    Logger().d( "permission ${latitude.value} ${longitude.value}");
    // addMarks();

    /// origin marker and info
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latitude.value, longitude.value);
    _addMarker(LatLng(latitude.value, longitude.value), "origin",
        BitmapDescriptor.defaultMarker, placeMarks[0].name!);

    /// destination marker
    List<Placemark> polylineMarks = await placemarkFromCoordinates(
        destinationLatitude.value, destinationLongitude.value);

    _addMarker(
        LatLng(destinationLatitude.value, destinationLongitude.value),
        "destination",
        BitmapDescriptor.defaultMarkerWithHue(90),
        polylineMarks[0].name!);

    _getPolyline();

    if (_permissionGranted == PermissionStatus.granted) {
      Logger().d( "permission granted");
      return;
    }
  }

  _getPolyline() async {

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        StringConstant.googleMapKey,
        PointLatLng(latitude.value, longitude.value),
        PointLatLng(destinationLatitude.value, destinationLongitude.value),
        travelMode: TravelMode.walking);

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polyLines[id] = polyline;
  }

  _addMarker(
    LatLng position,
    String id,
    BitmapDescriptor descriptor,
    String name,
  ) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: InfoWindow(title: name));
    markers[markerId] = marker;
  }

/*void addMarks() async {
    List<Placemark> polylineMarks = await placemarkFromCoordinates(
        destinationLatitude.value, destinationLongitude.value);

    customMarkers.add(Marker(
        markerId: const MarkerId('2'),
        position: LatLng(destinationLatitude.value, destinationLongitude.value),
        infoWindow: InfoWindow(title: polylineMarks[0].name)));

    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latitude.value, longitude.value);

    customMarkers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latitude.value, longitude.value),
        infoWindow: InfoWindow(title: placeMarks[0].name)));

    Logger().d( "initState ${polylineMarks[0].name}");
    Logger().d( "initState length ${customMarkers.length}");
    addPolyline();
  }

  void addPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        appString.googleMapKey,
        PointLatLng(latitude.value, longitude.value),
        PointLatLng(destinationLatitude.value, destinationLongitude.value),
        travelMode: TravelMode.driving);
    Logger().d( "get line" + result.points.toString());
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polyLines[id] = polyline;
  }*/
}
