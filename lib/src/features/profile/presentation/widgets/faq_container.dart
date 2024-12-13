import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget faqContainer(String title, String details, bool showDetails) {
  return Container(
    margin: EdgeInsets.only(bottom: 15.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    decoration: BoxDecoration(
        color: AppColors.lightBlack, borderRadius: BorderRadius.circular(10)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              title,
              fontSize: 13.sp,
              color: AppColors.textColor,
            ),
            showDetails
                ? Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                      width: 350,
                      child: Text(
                        details,
                        style: normalTextStyle(
                          fontSize: 13.sp,
                          textColor: AppColors.textColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        !showDetails
            ? Icon(
                Icons.arrow_drop_down,
                color: AppColors.textColor,
              )
            : Icon(
                Icons.arrow_drop_up_rounded,
                color: AppColors.textColor,
              )
      ],
    ),
  );
}
