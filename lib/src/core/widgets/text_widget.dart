import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';

Widget textWidget(String text,
    {Color color = AppColors.white,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.w600}) {
  return Text(
    text,
    style: GoogleFonts.openSans(
        color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}
