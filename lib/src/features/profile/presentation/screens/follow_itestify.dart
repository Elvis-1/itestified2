import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/follow_row.dart';
import 'package:provider/provider.dart';

class FollowItestify extends StatelessWidget {
  const FollowItestify({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const appbar2(
              "Follow iTestified",
            ),
            SizedBox(
              height: 20.h,
            ),
            textWidget(
              "Stay Connected with us on social media for updates, inspiration and more. Follow us on our platforms",
              fontSize: 15.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            followRow(AppIcons.facebookIcon),
            followRow(AppIcons.instagramIcon),
            followRow(themeProvider.themeData == AppThemes.darkTheme
                ? AppIcons.twitterIcon
                : AppIcons.twitterLightIcon),
            followRow(themeProvider.themeData == AppThemes.darkTheme
                ? AppIcons.youtubeIcon
                : AppIcons.youtubeLightIcon),
          ],
        ),
      ),
    );
  }
}
