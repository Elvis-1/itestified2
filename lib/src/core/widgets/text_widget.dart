import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  double? fontSize = 28;

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
        fontSize: fontSize,
      ),
    );
  }
}

class textWidget2 extends StatelessWidget {
  textWidget2(
    this.text, {
    super.key,
    this.color,
    this.fontSize = 28,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontWeight,
    this.lineHeight,
    this.letterSpacing,
  });

  final String? text;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  Color? color;
  FontWeight? fontWeight = FontWeight.w600;
  double? fontSize = 28;
  double? lineHeight = 19.07 / 14;
  double? letterSpacing = 0;

  @override
  Widget build(BuildContext context) {
    color = color ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.tertiary;
    return Text(text ?? '',
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: GoogleFonts.openSans(
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: lineHeight, //19.07 / 14,
          letterSpacing: letterSpacing,
          color: color,
        ));
  }

//   Text(
//   "Written testimonies.",
//   style: TextStyle(
//     fontFamily: 'OpenSans',  // Ensure Open Sans is added to pubspec.yaml
//     fontWeight: FontWeight.w600, // 600 weight
//     fontSize: 14, // 14px
//     height: 19.07 / 14, // Line height conversion
//     letterSpacing: 0, // No letter spacing
//     color: Colors.white, // Adjust based on design
//   ),
// ),
}
