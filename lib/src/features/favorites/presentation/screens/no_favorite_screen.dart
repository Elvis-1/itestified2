import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

class NoFavoriteScreen extends StatelessWidget {
  const NoFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Image.asset(AppImages.favoriteImage),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Your Favorite List is Empty",
                  style: normalTextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Browse testimonies and  videos and add them to favorites",
                  textAlign: TextAlign.center,
                  style: normalTextStyle(
                      fontSize: 23.sp, textColor: AppColors.textColor),
                ),
              ],
            ),
          ],
        ));
  }
}
