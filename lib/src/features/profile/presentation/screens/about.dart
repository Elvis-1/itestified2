import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2("About", context),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("Welcome to iTestified",
                fontSize: 18.sp, color: AppColors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          textWidget(
              "Itestified is a platform designed to share inspiring testimonies and uplifting stories from around the world. Our mission is to spread hope and faith through real-life experiences.",
              fontSize: 15.sp,
              color: AppColors.textColor),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("Our Mission",
                fontSize: 18.sp, color: AppColors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          textWidget(
              "At Itestified, our mission is to create a community where people can share and find inspiration through testimonies of faith, and transformation. We believe in the power of stories to change lives and bring people closer to God.",
              fontSize: 15.sp,
              color: AppColors.textColor),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("Key Features",
                fontSize: 18.sp, color: AppColors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: textWidget("- Browse a vast collection of testimonies",
                  fontSize: 15.sp, color: AppColors.textColor)),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("- Share your own story",
                fontSize: 15.sp, color: AppColors.textColor),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget(
                "- Watch videos that can strengthen your journey with christ",
                fontSize: 15.sp,
                color: AppColors.textColor),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("- Follow us on social media for updates",
                fontSize: 15.sp, color: AppColors.textColor),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: textWidget("- Support the ministry through donations",
                fontSize: 15.sp, color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
