import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const THEME_KEY = "theme_key";

  static Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(THEME_KEY, themeMode.toString());
  }

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString =
        prefs.getString(THEME_KEY) ?? ThemeMode.system.toString();
    return ThemeMode.values.firstWhere((e) => e.toString() == themeString);
  }
}
