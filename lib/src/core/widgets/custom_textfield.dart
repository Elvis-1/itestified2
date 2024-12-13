import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

Widget customTextField(
  BuildContext context, {
  String hintText = "Enter your full name",
  Widget? prefixIc,
  Widget suffixIcon = const SizedBox.shrink(),
  double borderWidth = 1,
  Color borderColor = AppColors.lightBlack,
}) {
  var themeProvider = Provider.of<ThemeViewmodel>(context).themeData;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
      color: themeProvider.colorScheme.onBackground,
    ),
    width: double.infinity,
    child: TextFormField(
      style: normalTextStyle(
          fontSize: 18, textColor: themeProvider.colorScheme.tertiary),
      decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIc,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
          hintText: hintText,
          hintStyle: normalTextStyle(
              textColor: AppColors.opaqueBlack, fontSize: 18.sp)),
    ),
  );
}
