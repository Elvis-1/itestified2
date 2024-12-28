import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
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
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),

              customTextField(
                hintText: "Enter Current Password",
                prefixIc: Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade700,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),
              Text(
                "New Password",
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),

              customTextField(
                hintText: "Enter New Password",
                prefixIc: Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade700,
                ),
              ),

              SizedBox(
                height: 30.h,
              ),
              Text(
                "Confirm Password",
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),

              customTextField(
                hintText: "Re-enter new Password",
                prefixIc: Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade700,
                ),
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
        margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),

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
