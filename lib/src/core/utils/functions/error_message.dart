import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

errorMessage(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: GoogleFonts.mulish(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  ));
}
