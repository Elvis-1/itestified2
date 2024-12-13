import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget likeOrShare(String icon, String text,
    {Color containerColor = Colors.black, double width = 3}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: containerColor),
    child: Row(
      children: [
        Image.asset(
          icon,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: width.w,
        ),
        textWidget(text, fontSize: 15)
      ],
    ),
  );
}
