import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/nav/navbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              appbar2(
                "Change my password",
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Current Password",
                style:
                    normalTextStyle(textColor: AppColors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lightBlack,
                    border: Border.all(color: AppColors.transparent)),
                child: customTextField(
                    prefixIc: Icon(
                      Icons.lock_outline,
                      color: Colors.grey.shade700,
                    ),
                    context,
                    borderColor: AppColors.lightBlack,
                    hintText: "Enter Current Password",
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      size: 30.sp,
                      color: Colors.white38,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "New Password",
                style:
                    normalTextStyle(textColor: AppColors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lightBlack,
                    border: Border.all(color: AppColors.transparent)),
                child: customTextField(
                    prefixIc: Icon(
                      Icons.lock_outline,
                      color: Colors.grey.shade700,
                    ),
                    context,
                    borderColor: AppColors.lightBlack,
                    hintText: "Enter New Password",
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      size: 30.sp,
                      color: Colors.white38,
                    )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Confirm Password",
                style:
                    normalTextStyle(textColor: AppColors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lightBlack,
                    border: Border.all(color: AppColors.transparent)),
                child: customTextField(
                    prefixIc: Icon(
                      Icons.lock_outline,
                      color: Colors.grey.shade700,
                    ),
                    context,
                    borderColor: AppColors.lightBlack,
                    hintText: "Re-enter new Password",
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      size: 30.sp,
                      color: Colors.white38,
                    )),
              ),
              SizedBox(
                height: 250.h,
              ),
              // login account btn
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context)
              //         .pushReplacement(MaterialPageRoute(builder: (context) {
              //       return const NavBar();
              //     }));
              //   },
              //   child: Align(
              //       alignment: Alignment.center,
              //       child: btnAndText(
              //           fontSize: 18,
              //           verticalPadding: 14.h,
              //           containerWidth: double.infinity,
              //           text: "Change my  password")),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.symmetric(horizontal: 20.w),

        //   padding: EdgeInsets.only(bottom: ),
        height: 50.h,
        child: Align(
            alignment: Alignment.center,
            child: btnAndText(
                fontSize: 18,
                verticalPadding: 14.h,
                containerWidth: double.infinity,
                text: "Change my  password")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
