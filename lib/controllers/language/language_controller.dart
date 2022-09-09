import 'package:flutter_demo/models/app_language/app_language_model.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var isLocalImageSelected = false.obs,
      isLanguagesLoaded = false.obs,
      isLanguageChange = false.obs;

  AppLanguage? selectedAppLanguage;

  void updateLocalImageFlag() {
    isLocalImageSelected.value = !isLocalImageSelected.value;
    update();
  }

  void updateLanguagesFlag() {
    isLanguagesLoaded.value = !isLanguagesLoaded.value;
    update();
  }

  void changeSelectedAppLanguage(AppLanguage appLanguage) {
    isLanguageChange.value = false;
    selectedAppLanguage = appLanguage;
    isLanguageChange.value = true;
  }
}
