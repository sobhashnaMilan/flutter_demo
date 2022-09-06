import '../../language/ar_AR.dart';
import '../../language/de_DE.dart';
import '../../language/en_US.dart';
import '../../language/hi_HI.dart';
import '../../language/locale_util.dart';
import '../../util/app_common_stuffs/preference_keys.dart';
import '../../util/enum_all/enums_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageUtil extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'de_DE': de_DE,
        'ar_AR': ar_AR,
        'hi_HI': hi_HI,
      };

  static Locale defaultLocale = const Locale('en', 'US');

  static Locale fallbackLocale = const Locale('en', 'US');

  static late SharedPreferences sharedPreferences;

  static Future<Locale> loadCurrentLanguage() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String languageCode = sharedPreferences.getString(
      PreferenceKeys.prefKeyCurrentLanguageCode,
        ) ??
        "";

    if (languageCode == LanguageCodeEnum.en.name) {
      return LocaleUtil.englishLocale;
    } else if (languageCode == LanguageCodeEnum.de.name) {
      return LocaleUtil.germanyLocale;
    } else if (languageCode == LanguageCodeEnum.ar.name) {
      return LocaleUtil.arabLocale;
    } else if (languageCode == LanguageCodeEnum.hi.name) {
      return LocaleUtil.hindiLocale;
    } else {
      return Get.deviceLocale!;
    }
  }

  static changeLocale(String languageCode) {
    Locale locale;
    if (languageCode == LanguageCodeEnum.en.name) {
      locale = LocaleUtil.englishLocale;
    } else if (languageCode == LanguageCodeEnum.de.name) {
      locale = LocaleUtil.germanyLocale;
    } else if (languageCode == LanguageCodeEnum.ar.name) {
      locale = LocaleUtil.arabLocale;
    } else if (languageCode == LanguageCodeEnum.hi.name) {
      locale = LocaleUtil.hindiLocale;
    } else {
      locale = Get.deviceLocale!;
    }
    Get.updateLocale(locale);
  }
}
