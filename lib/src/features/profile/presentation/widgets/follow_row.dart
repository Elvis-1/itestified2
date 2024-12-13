import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget followRow(String icon) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(icon),
            SizedBox(
              width: 10.w,
            ),
            textWidget("@iTestified", fontSize: 14)
          ],
        ),
        Icon(
          Icons.chevron_right_outlined,
          color: AppColors.textColor,
          size: 30.sp,
        )
      ],
    ),
  );
}
