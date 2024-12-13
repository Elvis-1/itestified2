import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget givingContainer(List<Widget> widgets, {String title = ''}) {
  List<Widget> rows = [];
  for (int i = 0; i < widgets.length; i++) {
    // Check if there's a second widget in the current pair

    rows.add(Row(
      children: [
        widgets[i],
        //  SizedBox(width: 10), // Optional spacing between widgets
      ],
    ));

    rows.add(SizedBox(height: 20.h)); // Optional spacing between rows
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(10.sp)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(title, fontSize: 18, color: AppColors.textColor),
            Icon(
              Icons.copy,
              color: AppColors.textColor,
              size: 20,
            )
          ],
        ),
        SizedBox(height: 10.h),
        lineWidget(width: double.infinity, color: AppColors.darkPurple),
        Column(children: rows),
      ],
    ),
  );
}
