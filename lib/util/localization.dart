import '../../util/zh_local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Translations implements WidgetsLocalizations {
  const Translations();

  static Translations? current;

  // Helper method to keep the code in the widgets concise Localizations are accessed using an InheritedWidget "of" syntax
  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations) ??
        const Translations();
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<Translations> delegate =
      _TranslationsDelegate();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => 'D2G Mover';

  /* SerVice Message */

  String strGeEmptyData(String name) => 'Please enter your $name';

  String strGeValidData(String name) => 'Please enter valid $name';
}

class _TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const _TranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    if (locale.languageCode.toLowerCase() == 'en') {
      Translations.current = const Translations();
      return SynchronousFuture<Translations>(
          Translations.current ?? const Translations());
    } else if (locale.languageCode.toLowerCase() == 'zh') {
      Translations.current = const $zh();
      return SynchronousFuture<Translations>(
          Translations.current ?? const $zh());
    }
    Translations.current = const Translations();
    return SynchronousFuture<Translations>(
        Translations.current ?? const Translations());
  }

  @override
  bool shouldReload(_TranslationsDelegate old) => false;
}
