// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';// cant use share pref

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newTheme) {
    // final SharedPreferences preferences= await SharedPreferences.getInstance();
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String getBackgroundImage() {
    return (currentTheme == ThemeMode.dark
        ? "assets/images/dart/dark_background.png"
        : "assets/images/lightBackground.png");
  }

  String getSplashImage() {
    return (currentTheme == ThemeMode.dark
        ? "assets/images/dart/dark_plash.png"
        : "assets/images/lightsplash.png");
  }

  bool isDark() {
    return (currentTheme == ThemeMode.dark);
  }

  bool isArabic() {
    return (currentLanguage == "en");
  }
}
