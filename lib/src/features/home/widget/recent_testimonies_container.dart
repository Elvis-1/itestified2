import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';

Widget recentTestimonyContainer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    height: 150.h,
    width: 150.w,
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
          height: 40.h,
        ),
        const Icon(
          Icons.play_arrow,
          color: AppColors.white,
        ),
      ],
    ),
  );
}
