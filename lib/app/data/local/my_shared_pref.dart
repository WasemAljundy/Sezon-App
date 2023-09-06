import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  MySharedPref._();

  static late SharedPreferences _sharedPreferences;

  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _hashedPassword = 'HASHED_PASSWORD';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;

  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  static Locale getCurrentLocal() {
    String? langCode = _sharedPreferences.getString(_currentLocalKey);
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  static Future<void> clear() async => await _sharedPreferences.clear();

  // static Future<void> hashedPassword(String password) =>
  //     _sharedPreferences.setString(_hashedPassword, password);
  //
  // static String? getHashedPassword() => _sharedPreferences.getString(_hashedPassword);
}
