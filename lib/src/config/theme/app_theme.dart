import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final TextTheme textTheme = TextTheme(
    displayLarge:
        GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium:
        GoogleFonts.openSans(fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall:
        GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold),
    headlineLarge:
        GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
    headlineMedium:
        GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall:
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge:
        GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium:
        GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall:
        GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold),
    labelMedium:
        GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold),
  );
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      searchBarTheme: const SearchBarThemeData(
        backgroundColor: MaterialStatePropertyAll(AppColors.lightGrayColor),
      ),
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        surface: AppColors.white,
        outline: AppColors.lineColor,
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,
        tertiary: AppColors.blackColor,
        onTertiary: AppColors.blackColor,
      ),
      scaffoldBackgroundColor: AppColors.white,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.btnColor,
      ),
      textTheme: textTheme,
      extensions: const [
        AppCustomColors(
          grey50: AppColors.grey50,
          donationBtn: AppColors.lightBlack2, // Dark theme custom color
        ),
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: MaterialStatePropertyAll(AppColors.opaqueBlack),
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      surface: AppColors.blackColor,
      outline: AppColors.lightBlack,
      tertiary: AppColors.textColor,
      onTertiary: AppColors.white,
      seedColor: AppColors.white, //AppColors.primaryColor,

      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textTheme,
    extensions: const [
      AppCustomColors(
        grey50: AppColors.textColor,
        donationBtn: AppColors.greyColor, // Dark theme custom color
      ),
    ],
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.btnColor,
    ),
  );
}
