import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';

class ThemeViewmodel extends ChangeNotifier with WidgetsBindingObserver {
  ThemeData _themeData;

  ThemeViewmodel({ThemeData? initialTheme})
      : _themeData = initialTheme ?? AppThemes.lightTheme {
    WidgetsBinding.instance
        .addObserver(this); // Start observing system theme changes
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Stop observing
    super.dispose();
  }

  ThemeData get themeData => _themeData;

  @override
  void didChangePlatformBrightness() {
    // Called when the system theme changes (e.g., light/dark mode)
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      _themeData = AppThemes.darkTheme;
    } else {
      _themeData = AppThemes.lightTheme;
    }
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == AppThemes.lightTheme
        ? AppThemes.darkTheme
        : AppThemes.lightTheme;
    notifyListeners();
  }

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
