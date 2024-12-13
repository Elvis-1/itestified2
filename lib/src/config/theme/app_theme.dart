import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        background: AppColors.white,
        brightness: Brightness.light,
        tertiary: AppColors.blackColor,
        onTertiary: AppColors.blackColor,
        onBackground: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.btnColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ));

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      tertiary: AppColors.textColor,
      onTertiary: AppColors.white,
      seedColor: AppColors.white, //AppColors.primaryColor,
      background: AppColors.backgroundColor,
      onBackground: AppColors.lightBlack,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.textColor),
      bodyMedium: TextStyle(color: AppColors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.btnColor,
    ),
  );
}
