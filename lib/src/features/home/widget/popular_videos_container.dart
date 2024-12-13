import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget popularVideosContainer({double rightPadding = 15}) {
  return Container(
    margin: EdgeInsets.only(right: rightPadding.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // video container
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          height: 170,
          width: 270,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(AppImages.popularPrayingVideoImage),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Image.asset(
                      AppIcons.favoriteIcon,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              const Icon(
                Icons.play_arrow,
                color: AppColors.white,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.blackColor),
                    child: textWidget(
                      "09:30",
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // itestify pic and text

        Row(
          children: [
            Image.asset(AppIcons.itestifyIcon),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Prophetic Prayers for open doors", fontSize: 13.sp),
                textWidget("Redeemed Christian Church of God",
                    fontSize: 10.sp, color: AppColors.textColor),
                Row(
                  children: [
                    textWidget("504 Views ",
                        fontSize: 10.sp, color: AppColors.textColor),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      color: AppColors.textColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    textWidget("14/4/2024",
                        fontSize: 10.sp, color: AppColors.textColor),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
