import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/notifications/presentation/widgets/notifications_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2("Notifications", context),
            SizedBox(
              height: 50.h,
            ),
            customTextField(context,
                prefixIc: const Icon(Icons.search), hintText: "Search"),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: textWidget("Today", fontSize: 18.sp)),

                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  SizedBox(
                      // height: 400,
                      child: ListView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    //  itemCount: 20,
                    children: [
                      notificationsContainer(),
                      notificationsContainer(),
                      notificationsContainer(),
                      notificationsContainer(),
                      notificationsContainer(),
                      notificationsContainer(),
                    ],
                  )),

                  Align(
                      alignment: Alignment.topLeft,
                      child: textWidget("Last 7 days", fontSize: 18.sp)),
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          padding:
                              EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 20.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppIcons.userIcon),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      textWidget(
                                        "Uchechukwu Uzoachi",
                                        fontSize: 14,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      textWidget("Liked your post",
                                          fontSize: 14,
                                          color: AppColors.textColor),
                                    ],
                                  ),
                                  textWidget("x",
                                      fontSize: 17.sp,
                                      color: AppColors.opaqueBlack)
                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
