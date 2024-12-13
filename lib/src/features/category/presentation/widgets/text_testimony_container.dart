import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget textTestimonyContainer() {
  return Container(
    padding: EdgeInsets.only(top: 10, right: 10, left: 10),
    color: AppColors.opaqueBlack2,
    // height: 400,
    width: 300,
    margin: EdgeInsets.symmetric(
      horizontal: 10.w,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget("Jesus Changed my Genotype", fontSize: 13.sp),
            CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.opaqueBlack,
                child: Image.asset(
                  AppIcons.favoriteIcon,
                  width: 12,
                ))
          ],
        ),
        Text(
          "For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in ... see more",
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          textAlign: TextAlign.left,
          style: normalTextStyle(textColor: AppColors.textColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        // image and text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppIcons.userIcon),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget("Chika Amaka", fontSize: 13),
                    Row(
                      children: [
                        textWidget("Healing ",
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
                        textWidget(" 30 minutes ago",
                            fontSize: 5.sp, color: AppColors.textColor),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(AppIcons.likeIcon),
                SizedBox(
                  width: 5,
                ),
                textWidget('30', fontSize: 10)
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
