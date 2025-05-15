import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = const Color(0xFF8844AA);

  static const Color darkPurple = Color(0xFF663380);
  static const Color lightGrayColor = const Color(0xffF7F7F7);
  static const Color backgroundColor = const Color(0xFF000000);
  static const Color pendingColor = const Color(0xFFFFC107);

  static const Color white = const Color(0xFFFFFFFF);
  static const Color textColor = const Color.fromRGBO(255, 255, 255, 0.75);
  static const Color greyColor = const Color.fromRGBO(255, 255, 255, 0.5);
  static const Color grey50 = const Color(0xFF575757);
  static const Color grey30 = Color(0XFF9A9A9A);
  static Color White50 = Colors.white.withOpacity(0.5);
  //
  static const Color btnColor = const Color(0xFF9966CC);
  static const Color transparent = Colors.transparent;
  static const Color blackColor = Colors.black;
  static const Color redColor = Color(0xFFE53935);
  static const Color lineColor = Color(0xFFF8F8F8);
  static const Color darkgrey = Color(0xFFBCBCBC);

  static const Color lightBlack = Color(0xFF171717);
  static const Color lightBlack2 = Color(0xFF575757);
  static const Color whiteSemiTransparent = Color(0xFFFFFFBF);

  static const Color borderColor = Color.fromARGB(100, 255, 255, 255);
  static Color opaqueBlack = const Color.fromARGB(50, 255, 255, 255);
  static Color opaqueBlack2 = const Color(0xFF171717);
}


@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color? donationBtn;
  final Color? grey50;
  // final Color? customSecondary;

  const AppCustomColors({this.donationBtn, this.grey50});

  @override
  AppCustomColors copyWith({
    Color? donationBtn,
  }) {
    return AppCustomColors(
        donationBtn: donationBtn ?? this.donationBtn, grey50: grey50 ?? grey50);
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      donationBtn: Color.lerp(donationBtn, other.donationBtn, t),
    );
  }
}
