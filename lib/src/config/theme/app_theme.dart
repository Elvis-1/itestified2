import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      searchBarTheme: SearchBarThemeData(
        backgroundColor: MaterialStateProperty.all(AppColors.lightGrayColor),
      ),
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        outline: AppColors.lineColor,
        seedColor: AppColors.primaryColor,
        background: AppColors.white,
        brightness: Brightness.light,
        tertiary: AppColors.blackColor,
        onTertiary: AppColors.blackColor,
        onBackground: AppColors.lightGrayColor,
      ),
      scaffoldBackgroundColor: AppColors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.btnColor,
      ),
      extensions: const [
        AppCustomColors(
          donationBtn: AppColors.lightBlack2, // Dark theme custom color
        ),
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: MaterialStateProperty.all(AppColors.opaqueBlack),
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      outline: AppColors.opaqueBlack,
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
    extensions: const [
      AppCustomColors(
        donationBtn: AppColors.greyColor, // Dark theme custom color
      ),
    ],
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.btnColor,
    ),
  );
}
