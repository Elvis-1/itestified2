import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget textRow(String first, String second) {
  return Row(
    children: [
      textWidget(first,
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 13),
      SizedBox(
        width: 50.w,
      ),
      textWidget(second, color: AppColors.textColor, fontSize: 15)
    ],
  );
}
