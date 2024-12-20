import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class textWidget extends StatelessWidget {
  textWidget(
    this.text, {
    super.key,
    this.color,
    this.fontSize = 28,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontWeight,
  });

  final String? text;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  Color? color;
  FontWeight? fontWeight = FontWeight.w600;
  double fontSize = 28;

  @override
  Widget build(BuildContext context) {
    color = color ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.tertiary;
    return Text(
      text ?? '',
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
}

// Widget textWidget(String text,
//     {Color color = AppColors.white,
//     double fontSize = 28,
//     FontWeight fontWeight = FontWeight.w600,
//     TextAlign? textAlign,
//     TextOverflow? overflow,
//     int? maxLines}) {
//   return Text(
//     text,
//     textAlign: textAlign,
//     overflow: overflow,
//     maxLines: maxLines,
//     style: GoogleFonts.openSans(
//       color: color,
//       fontWeight: fontWeight,
//       fontSize: fontSize.sp,
//     ),
//   );
// }
