import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ThemeNotifier extends ValueNotifier<ThemeMode> {
//   ThemeNotifier() : super(ThemeMode.system);
//
//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     final themeString = prefs.getString("themeMode") ?? "system";
//     switch (themeString) {
//       case "light":
//         value = ThemeMode.light;
//         break;
//       case "dark":
//         value = ThemeMode.dark;
//         break;
//       default:
//         value = ThemeMode.system;
//     }
//   }
//
//   Future<void> changeAppTheme(bool isDark) async {
//     value = isDark ? ThemeMode.dark : ThemeMode.light;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("themeMode", isDark ? "dark" : "light");
//   }
// }


class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _loadAppTheme();
  }

  Future<void> _loadAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString("themeMode") ?? "system";
    _themeMode = _mapStringToThemeMode(theme);
    notifyListeners();
  }

  Future<void> setAppTheme(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("themeMode", _mapThemeModeToString(mode));
    notifyListeners();
  }

  String _mapThemeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return "light";
      case ThemeMode.dark:
        return "dark";
      default:
        return "system";
    }
  }

  ThemeMode _mapStringToThemeMode(String value) {
    switch (value) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

}

