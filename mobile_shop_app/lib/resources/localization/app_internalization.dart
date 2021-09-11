import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_shop_app/@core/data/local/storage/data.storage.dart';

class AppInternalization {
  AppInternalization._();
  static final _singleton = AppInternalization._();
  static AppInternalization get instance => _singleton;

  Map<String, dynamic>? _internalizationData;
  int? _selectLocale;

  String get selectLocale {
    if (_selectLocale == 0) return 'en';
    if (_selectLocale == 1) return 'cn';
    if (_selectLocale == 2) return 'ru';
    if (_selectLocale == 3) return 'ar';
    if (_selectLocale == 4) return 'es';
    return '';
  }

  void loadEn() {
    final lo = Locale('en');
    _chooseLanguage(lo, 'en', 0);
    Get.updateLocale(lo);
  }

  void loadCn() {
    final lo = Locale('cn');
    _chooseLanguage(lo, 'cn', 1);
    Get.updateLocale(lo);
  }

  void loadRus() {
    final lo = Locale('ru');
    _chooseLanguage(lo, 'ru', 2);
    Get.updateLocale(lo);
  }

  void loadAr() {
    final lo = Locale('ar');
    _chooseLanguage(lo, 'ar', 3);
    Get.updateLocale(lo);
  }

  void loadEs() {
    final lo = Locale('es');
    _chooseLanguage(lo, 'es', 4);
    Get.updateLocale(lo);
  }

  void _chooseLanguage(Locale lc, String short, int pos) {
    _selectLocale = pos;
    DataStorage().setLanguage(lc.languageCode);
  }

  void _conditionLastUserSelectLanguage(Locale lc) async {
    final String? userSelect = await DataStorage().getLanguage();
    if (userSelect != null) {
      if (userSelect == 'cn') {
        _chooseLanguage(Locale('cn'), 'cn', 1);
      } else if (userSelect == 'en') {
        _chooseLanguage(Locale('en'), 'en', 0);
      } else if (userSelect == 'ru') {
        _chooseLanguage(Locale('ru'), 'ru', 2);
      } else if (userSelect == 'ar') {
        _chooseLanguage(Locale('ar'), 'ar', 3);
      } else if (userSelect == 'es') {
        _chooseLanguage(Locale('es'), 'es', 4);
      }
    } else {
      _chooseLanguage(Locale('en'), 'en', 0);
    }
  }

  Future<AppInternalization> _load(Locale lc) async {
    print('locale ${lc.languageCode} country ${lc.countryCode}');
    _conditionLastUserSelectLanguage(lc);
    String jsonContent =
        await rootBundle.loadString("assets/langs/internalization.json");
    _internalizationData = json.decode(jsonContent);
    return this;
  }

  String? _text(String key) {
    if (_internalizationData == null || _internalizationData![key] == null)
      return '';

    return _internalizationData![key][_selectLocale];
  }
}

extension AppInternalizationExtension on String {
  String? get intl => AppInternalization.instance._text(this);
}

class AppInternalizationlegate
    extends LocalizationsDelegate<AppInternalization> {
  const AppInternalizationlegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'cn', 'es', 'ru', 'ar'].contains(locale.languageCode);

  @override
  Future<AppInternalization> load(Locale locale) {
    return AppInternalization.instance._load(locale);
  }

  @override
  bool shouldReload(AppInternalizationlegate old) => true;
}
