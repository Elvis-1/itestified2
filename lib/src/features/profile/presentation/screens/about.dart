import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/privacy_policy.dart';
import 'package:itestified/src/features/profile/presentation/screens/terms_of_use.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2(
            "About",
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: textWidget("Welcome to iTestified",
                  fontSize: 18.sp,
                  color: themeProvider.themeData.colorScheme.onTertiary),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: textWidget(
              "Itestified is a platform designed to share inspiring testimonies and uplifting stories from around the world. Our mission is to spread hope and faith through real-life experiences.",
              fontSize: 15.sp,
            ),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: textWidget("Our Mission",
                  fontSize: 18.sp,
                  color: themeProvider.themeData.colorScheme.onTertiary),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: textWidget(
              "At Itestified, our mission is to create a community where people can share and find inspiration through testimonies of faith, and transformation. We believe in the power of stories to change lives and bring people closer to God.",
              fontSize: 15.sp,
            ),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: textWidget("Key Features",
                  fontSize: 18.sp,
                  color: themeProvider.themeData.colorScheme.onTertiary),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: textWidget(
                      "- Browse a vast collection of testimonies",
                      fontSize: 15.sp,
                    )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: textWidget(
                    "- Share your own story",
                    fontSize: 15.sp,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: textWidget(
                    "- Watch videos that can strengthen your journey with christ",
                    fontSize: 15.sp,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: textWidget(
                    "- Follow us on social media for updates",
                    fontSize: 15.sp,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: textWidget("- Support the ministry through donations",
                      fontSize: 15.sp),
                ),
              ],
            ),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, TermsOfUse.routeName);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget("Terms of Use", fontSize: 15.sp),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PrivacyPolicy.routeName);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget("Privacy Policy", fontSize: 15.sp),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
