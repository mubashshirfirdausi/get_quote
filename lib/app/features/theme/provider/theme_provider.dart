import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;
  ThemeMode get currentThemeMode => _currentThemeMode;

  bool get isSystemTheme => _currentThemeMode == ThemeMode.system;
  bool get isDarkTheme => _currentThemeMode == ThemeMode.dark;
  bool get isLightTheme => _currentThemeMode == ThemeMode.light;
  changeTheme(ThemeMode themeMode) async {
    _currentThemeMode = themeMode;
    notifyListeners();
  }
}
