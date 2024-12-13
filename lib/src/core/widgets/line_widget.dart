import 'package:flutter/material.dart';

Widget lineWidget(
    {Color color = const Color(0xFF007AFF),
    double width = 40,
    double height = 1}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
    child: Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Container(
        width: width,
        height: height,
      ),
    ),
  );
}
