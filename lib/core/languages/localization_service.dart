import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'language_code.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();
  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'fr',
    'vi',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('vi', 'VN'),
  ];

  static final langs = Map.from({
    'en': 'English',
    'fr': 'Français',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'fr_FR': fr,
        'vi_VN': vi,
      };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (var i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale ?? fallbackLocale;
  }
}
