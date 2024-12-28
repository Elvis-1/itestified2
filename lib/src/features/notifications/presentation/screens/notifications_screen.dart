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
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/notifications/presentation/widgets/notifications_container.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const appbar2(
              "Notifications",
            ),
            SizedBox(
              height: 20.h,
            ),
            // customTextField(context,
            //     prefixIc: const Icon(Icons.search), hintText: "Search"),

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
                    physics: const AlwaysScrollableScrollPhysics(),
                    //  itemCount: 20,
                    children: const [
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
                            return const notificationsContainer();
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
