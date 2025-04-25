// import 'package:flutter/material.dart';

// class SettingsProvider extends ChangeNotifier {
//   ThemeMode _currentThemeMode = ThemeMode.system;
//   ThemeMode get currentThemeMode => _currentThemeMode;

//   bool get isSystemTheme => _currentThemeMode == ThemeMode.system;
//   bool get isDarkTheme => _currentThemeMode == ThemeMode.dark;
//   bool get isLightTheme => _currentThemeMode == ThemeMode.light;
//   changeTheme(ThemeMode themeMode) async {
//     _currentThemeMode = themeMode;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeColor {
  blue(Colors.blue, 'Blue'),
  red(Colors.red, 'Red'),
  green(Colors.green, 'Green'),
  purple(Colors.purple, 'Purple'),
  orange(Colors.orange, 'Orange'),
  teal(Colors.teal, 'Teal');

  final Color primaryColor;
  final String name;

  const ThemeColor(this.primaryColor, this.name);
}

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  bool _useMaterial3 = true;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeColor _themeColor = ThemeColor.blue;

  SettingsProvider() {
    _loadPreferences();
  }

  // Getters
  bool get useMaterial3 => _useMaterial3;
  ThemeMode get themeMode => _themeMode;
  ThemeColor get themeColor => _themeColor;

  // Initialize preferences
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _useMaterial3 = _prefs.getBool('useMaterial3') ?? true;
    _themeMode = ThemeMode.values[_prefs.getInt('themeMode') ?? 0];
    _themeColor = ThemeColor.values[_prefs.getInt('themeColor') ?? 0];

    notifyListeners();
  }

  // Setters
  void setUseMaterial3(bool value) {
    _useMaterial3 = value;
    _prefs.setBool('useMaterial3', value);
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _prefs.setInt('themeMode', mode.index);
    notifyListeners();
  }

  void setThemeColor(ThemeColor color) {
    _themeColor = color;
    _prefs.setInt('themeColor', color.index);
    notifyListeners();
  }

  // Get theme data based on current settings
  ThemeData getTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: _useMaterial3,
      // brightness: brightness,
      // primarySwatch: _getMaterialColor(_themeColor.primaryColor),
      primaryColor: _themeColor.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _themeColor.primaryColor,
        brightness: brightness,
      ),
    );
  }

  // // Helper method to create MaterialColor from a Color
  // MaterialColor _getMaterialColor(Color color) {
  //   final int red = color.red;
  //   final int green = color.green;
  //   final int blue = color.blue;

  //   final Map<int, Color> shades = {
  //     50: Color.fromRGBO(red, green, blue, .1),
  //     100: Color.fromRGBO(red, green, blue, .2),
  //     200: Color.fromRGBO(red, green, blue, .3),
  //     300: Color.fromRGBO(red, green, blue, .4),
  //     400: Color.fromRGBO(red, green, blue, .5),
  //     500: Color.fromRGBO(red, green, blue, .6),
  //     600: Color.fromRGBO(red, green, blue, .7),
  //     700: Color.fromRGBO(red, green, blue, .8),
  //     800: Color.fromRGBO(red, green, blue, .9),
  //     900: Color.fromRGBO(red, green, blue, 1),
  //   };

  //   return MaterialColor(color.value, shades);
  // }
}
