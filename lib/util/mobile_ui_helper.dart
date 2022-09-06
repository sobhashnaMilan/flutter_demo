import '../../util/app_common_stuffs/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
  return [
    AndroidUiSettings(
      toolbarTitle: 'Cropper',
      toolbarColor: AppColors.primaryColor,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false,
    ),
    IOSUiSettings(
      title: 'Cropper',
    ),
  ];
}
