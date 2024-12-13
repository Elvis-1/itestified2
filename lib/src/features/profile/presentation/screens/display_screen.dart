import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/config/theme/app_theme.dart';

import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return Scaffold(
      backgroundColor: themeProvider
          .themeData.colorScheme.background, //  AppColors.background,
      //  backgroundColor: themeProvider.themeData.scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2("Display", context),
            SizedBox(
              height: 20.h,
            ),
            textWidget(
                "Select your preferred theme for the best experience with iTestified",
                fontSize: 13.sp,
                color: AppColors.textColor),
            // checkboxes

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  "Dark Mode",
                  fontSize: 14.sp,
                ),
                Radio(
                    value: true,
                    groupValue: themeProvider.status,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  "Light Mode",
                  fontSize: 14.sp,
                ),
                Radio(
                    value: false,
                    groupValue: themeProvider.status,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
