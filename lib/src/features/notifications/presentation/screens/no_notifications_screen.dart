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

class NoNotificationsScreen extends StatelessWidget {
  const NoNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2(
              "Notifications",
            ),
            Column(
              //              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Image.asset(AppImages.notificationImage),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "No Notificatins Yet",
                  style: normalTextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "You will get notifications when they are available",
                  textAlign: TextAlign.center,
                  style: normalTextStyle(
                      fontSize: 23.sp, textColor: AppColors.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
