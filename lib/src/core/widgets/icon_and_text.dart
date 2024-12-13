import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget iconAndText(String text, String icon, Color bottomBorderColor) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: bottomBorderColor))),
    child: Row(
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(icon),
              SizedBox(
                width: 8.sp,
              ),
              textWidget(text,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                  fontSize: 15.sp)
            ],
          ),
        )
      ],
    ),
  );
}
