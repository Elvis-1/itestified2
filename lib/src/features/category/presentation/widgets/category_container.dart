import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget categoryContainer() {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.sp),
      color: AppColors.lightBlack,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                textWidget("Healing Testimonies",
                    fontSize: 18, fontWeight: FontWeight.w500),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: Text(
                    "Watch and read about  God's miraculous power to every illness and restore health.",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    softWrap: true,
                    style: normalTextStyle(textColor: AppColors.textColor),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 35,
            )
          ],
        ),
      ],
    ),
  );
}
