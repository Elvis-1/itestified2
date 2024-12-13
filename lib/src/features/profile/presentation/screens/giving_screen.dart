import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/profile/presentation/widgets/giving_container.dart';
import 'package:itestified/src/features/profile/presentation/widgets/text_row.dart';

class GivingScreen extends StatelessWidget {
  const GivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2("Giving", context),
          SizedBox(
            height: 20.h,
          ),

          // into to giving
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: AppColors.darkPurple),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppIcons.logoIcon),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                textWidget(
                    "Your generous support helps us continue our mission to spread the word of God. Thank you for your contribution and God bless You!",
                    fontSize: 15.sp,
                    color: AppColors.textColor),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: textWidget("CEO: Elvis Igiebor",
                      fontSize: 15.sp, color: AppColors.textColor),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("Account Details",
                fontSize: 17.sp, color: AppColors.white),
          ),
          SizedBox(height: 20.h),

          Expanded(
            child: ListView(
              padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
              physics: const BouncingScrollPhysics(),
              children: [
                givingContainer([
                  textRow("Account Holder", "Raenest/Elvis Aisosa  Igiebor"),
                  textRow("Bank Name", "Kredi Money  MFB LTD"),
                  textRow("Account Number", "1830029269"),
                ], title: "For NGN Payments"),
                SizedBox(height: 20.h),
                givingContainer([
                  textRow("Account Holder", "Elvis Aisosa  Igiebor"),
                  textRow("Bank Name", "Wells Fargo"),
                  textRow("Account Number", "40630232503732813"),
                  textRow("Routing Number", "121000248"),
                  textRow("Swift Code", "WFBIUS6S"),
                  textRow("Address", "651 N"),
                ], title: "For USD Payments"),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
