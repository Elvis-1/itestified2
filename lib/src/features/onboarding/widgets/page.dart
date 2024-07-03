import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';

Widget page(int index, BuildContext context, String buttonName, String title,
    String subTitle, String imagePath, PageController pageController) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.textColor),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn);
          } else {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: ((context) => MyHomePage(title: "String"))));

            Navigator.of(context)
                .pushNamedAndRemoveUntil('/sign_in', (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5))
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
        ),
      )
    ],
  );
}
