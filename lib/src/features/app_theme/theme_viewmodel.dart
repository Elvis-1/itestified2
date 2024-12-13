import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';

class ThemeViewmodel extends ChangeNotifier {
  ThemeData _themeData;

  ThemeViewmodel(this._themeData);
  bool status = true;
  ThemeData get themeData => _themeData;

  toggleTheme() {
    if (status == true) {
      status = false;
    } else {
      status = true;
    }
    if (_themeData == AppThemes.lightTheme) {
      _themeData = AppThemes.darkTheme;
      notifyListeners();
      print("Thiis is dark theme");
      print(_themeData.colorScheme.background);
    } else {
      _themeData = AppThemes.lightTheme;
      notifyListeners();
      print("Thiis is light theme");

      print(_themeData.colorScheme.background);
    }

    //  notifyListeners();
  }
}
