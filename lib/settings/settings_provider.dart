import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode defultThemeMode = ThemeMode.light;
  String languageCode = 'en';
  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('language')!;
    notifyListeners();
  }
  Future<void> changeLanguage(String selectedLanguage) async {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', selectedLanguage == 'en' ? 'en' : 'ar');
    notifyListeners();
  }
}
