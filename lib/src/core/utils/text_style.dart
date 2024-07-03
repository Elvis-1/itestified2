import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {double fontSize = 12,
    Color color = const Color(0xFF242426),
    FontWeight fontWeight = FontWeight.normal}) {
  return GoogleFonts.lusitana(
      fontSize: fontSize, color: color, fontWeight: fontWeight);
}
