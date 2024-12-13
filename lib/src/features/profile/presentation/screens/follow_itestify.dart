import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/profile/presentation/widgets/follow_row.dart';

class FollowItestify extends StatelessWidget {
  const FollowItestify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2("Follow iTestified", context),
            SizedBox(
              height: 20.h,
            ),
            textWidget(
                "Stay Connected with us on social media for updates, inspiration and more. Follow us on our platforms",
                fontSize: 14.sp,
                color: AppColors.textColor),
            SizedBox(
              height: 20.h,
            ),
            followRow(AppIcons.facebookIcon),
            followRow(AppIcons.instagramIcon),
            followRow(AppIcons.twitterIcon),
            followRow(AppIcons.youtubeIcon),
          ],
        ),
      ),
    );
  }
}
