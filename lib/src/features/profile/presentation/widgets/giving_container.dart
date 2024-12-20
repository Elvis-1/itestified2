import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/profile/presentation/widgets/text_row.dart';

Widget givingContainer(List<TextRow> widgets, {String title = ''}) {
  List<TextRow> rows = [];
  for (int i = 0; i < widgets.length; i++) {
    // Check if there's a second widget in the current pair
    if (widgets[i].title.toLowerCase() == 'account number') {
      widgets[i].isAccNumber = true;
    }
    rows.add(widgets[i]);
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    margin: const EdgeInsets.only(bottom: 10),
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
          ],
        ),
        SizedBox(height: 10.h),
        lineWidget(width: double.infinity, color: AppColors.darkPurple),
        Column(children: rows),
      ],
    ),
  );
}
