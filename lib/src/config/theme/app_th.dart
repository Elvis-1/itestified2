import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF023E8A);
  static const Color secondaryColor = Color(0xFFFF6F1E);
  static const Color tertiaryColor = Color(0xFF4CAF50); // Example: Green
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFECECEC);
  static const Color errorColor = Color(0xFFD72638);
  static const Color textGray = Color(0xFF767677);
  static const Color textBlack = Color(0xFF1E1E1E);
  static const Color lightTextGray = Color(0xFF9B9EA4);
  static const Color veryLightGrey = Color(0xFFD9D9D9);
  static const Color successColor = Color(0xFF2D9C5E);

  static const Color lightGreenColor = Color(0xFFE6F7EF);

  static const Color textGray2 = Color(0xFF67696D);
  static const Color textGray3 = Color(0xFF343537);

  static const Color gray10 = Color(0xFFEBECED);
  static const Color gray80 = Color(0xFF4E4F52);
  static const Color gray90 = Color(0xFF343537);

  static const Color gray70 = Color(0xFF67696D);
  static const Color gray60 = Color(0xFF818489);

  static const Color gray20 = Color(0xFFDEDFE1);
  static const Color gray30 = Color(0xFFCDCED1);

  static const Color outlineColor = Color(0xFFCDCED1);
  static const Color lightSecondaryColor = Color(0xFFFFF6F1);
  static const Color flightContainerColor = Color(0xFFF2F8FC);
  static const Color carsContainerColor = Color(0xFFFFEBFF);
  static const Color warningYellowColor = Color(0xFFEFB608);

  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),
    headlineMedium:
        GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold),
  );

  static final FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          const WidgetStatePropertyAll(primaryColor), // Use primary color
      foregroundColor: const WidgetStatePropertyAll(Colors.white), // Text color
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)), // Rounded corners
      ),
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 14, horizontal: 24)), // Padding
      textStyle: const MaterialStatePropertyAll(
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Text style
    ),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
      background: backgroundColor,
      surface: surfaceColor,
      onSurfaceVariant: textGray, // light text color
      onSurface: Colors.black,
      outline: outlineColor, // main text color

      error: errorColor,
      brightness: Brightness.light,
    ),
    filledButtonTheme: filledButtonTheme,
    useMaterial3: true,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppTheme.primaryColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        foregroundColor: AppTheme.primaryColor, // Text color
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    scaffoldBackgroundColor: backgroundColor,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
      background: Colors.black,
      surface: Colors.grey[900]!,
      error: errorColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
