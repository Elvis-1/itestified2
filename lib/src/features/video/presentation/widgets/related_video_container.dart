import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget relatedVideoContainer() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // video container
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          height: 150.h,
          width: 350.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(AppImages.recentTestimonyImage),
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
                height: 50.h,
              ),
              const Icon(
                Icons.play_arrow,
                color: AppColors.white,
              ),
              // SizedBox(
              //   height: 40.h,
              // ),
              Spacer(),
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
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                ],
              ),

              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 5.h,
        // ),
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
                textWidget("Prophetic Prayers for open doors", fontSize: 15.sp),
                textWidget("Redeemed Christian Church of God",
                    fontSize: 11.sp, color: AppColors.textColor),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
