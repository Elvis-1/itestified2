import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget favoriteVideoContainer() {
  return Container(
    margin: EdgeInsets.only(bottom: 25.h),
    child: Row(
      children: [
        Container(
            width: 150.w,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.popularPrayingVideoImage,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.sp)),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                // favorite
                Row(
                  children: [
                    const Spacer(),
                    const Icon(
                      Icons.favorite_outline,
                      color: AppColors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
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
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                  ],
                ),
              ],
            )),

        SizedBox(
          width: 10.w,
        ),
        // title, description, views and date
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                "Prophetic Prayers for Open Doors",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: normalTextStyle(
                    textColor: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            textWidget("Redeemed Christian Church of God",
                color: AppColors.textColor, fontSize: 15.sp),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textWidget(" 504 Views ",
                    fontSize: 12.sp, color: AppColors.textColor),
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
                    fontSize: 12.sp, color: AppColors.textColor),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
