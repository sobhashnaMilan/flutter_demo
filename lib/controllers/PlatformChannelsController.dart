import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlatformChannelsController extends GetxController {
  var name = "check data".obs;
  var namePlatformChannels = "wait....".obs;
  var textField = "0".obs;

  var platform = const MethodChannel('flutter.native/helper');
}
