import '../../util/app_common_stuffs/preference_keys.dart';
import '../../util/enum_all/enums_all.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';


void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

MediaType getContentType(String type) {
  if (type == "image/jpeg") {
    return MediaType('image', 'JPEG');
  } else if (type == "image/png") {
    return MediaType('image', 'PNG');
  } else if (type == "image/jpg") {
    return MediaType('image', 'JPG');
  } else {
    return MediaType('image', 'JPEG');
  }
}

logoutUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String tempLanguageCode = sharedPreferences.getString(
        PreferenceKeys.prefKeyCurrentLanguageCode,
      ) ??
      LanguageCodeEnum.en.name;
  await sharedPreferences.clear();
  sharedPreferences.setString(
    PreferenceKeys.prefKeyCurrentLanguageCode,
    tempLanguageCode,
  );
}

List<CropAspectRatioPreset> setAspectRatios() {
  return [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9
  ];
}
