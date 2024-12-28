import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

Widget donationsTitle(
    String title, void Function() goToScreen, BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return InkWell(
    onTap: goToScreen,
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: themeProvider.themeData.searchBarTheme.backgroundColor!
              .resolve({})),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: normalTextStyle(
                fontSize: 15,
                textColor: themeProvider.themeData.colorScheme.onTertiary),
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    ),
  );
}
