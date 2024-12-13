import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget appBar(VoidCallback gotoSearchPage, VoidCallback gotoNotificationPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // profile pic and name
      Row(
        children: [
          Image.asset(AppIcons.userIcon),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
              onTap: () {}, child: textWidget("Welcome, Amaka", fontSize: 15)),
        ],
      ),

      Row(
        children: [
          // search and notificatins
          GestureDetector(
              onTap: () {
                gotoSearchPage();
              },
              child: Image.asset(AppIcons.searchIcon)),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
              onTap: () {
                gotoNotificationPage();
              },
              child: Image.asset(AppIcons.notificationIcon))
        ],
      ),
    ],
  );
}
