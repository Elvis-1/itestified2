import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';

Widget textWidget(String text,
    {Color color = AppColors.white,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.w600,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: GoogleFonts.openSans(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}
