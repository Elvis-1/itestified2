import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle normalTextStyle(
    {FontWeight fontWeight = FontWeight.normal,
    // String fontFamily = 'Mulish',
    Color textColor = const Color(0xFF252525),
    double? fontSize = 13,
    double height = 1.5}) {
  return GoogleFonts.openSans(
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height);
}
