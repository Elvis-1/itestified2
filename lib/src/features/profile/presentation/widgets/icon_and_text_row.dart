import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget iconAndTextRow(String prefixIcon, String title, String suffixIcon) {
  return Container(
    margin: EdgeInsets.only(bottom: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(prefixIcon),
            SizedBox(
              width: 15.w,
            ),
            textWidget(title, fontSize: 17, color: AppColors.textColor),
          ],
        ),
        Image.asset(suffixIcon),
      ],
    ),
  );
}
