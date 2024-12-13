import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';

Widget multilineTextField(
    {String hintText = "Enter details of your testimony ..."}) {
  return Container(
    height: 250.h,
    decoration: BoxDecoration(
        color: AppColors.lightBlack,
        border: Border.all(color: AppColors.transparent)),
    width: double.infinity,
    child: TextFormField(
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: normalTextStyle(fontSize: 18, textColor: AppColors.textColor),
      decoration: InputDecoration(
          border: InputBorder.none,
          //  suffixIcon: suffixIcon,
          //    prefixIcon: prefixIc,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
          hintText: hintText,
          hintStyle:
              normalTextStyle(textColor: AppColors.textColor, fontSize: 18.sp)),
    ),
  );
}
