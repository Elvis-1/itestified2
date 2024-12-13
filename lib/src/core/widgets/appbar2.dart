import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget appbar2(String title, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(AppIcons.backIcon)),
        textWidget(title, fontSize: 25.sp),
        Container()
      ],
    ),
  );
}
