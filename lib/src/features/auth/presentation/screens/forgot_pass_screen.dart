import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot-password';
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  const appbar2(
                    "Forgot Password",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  textWidget(
                      "Enter your email below and we will send you instrutions on how to reset your password",
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    "Email Address",
                    style: normalTextStyle(
                        textColor:
                            themeProvider.themeData.colorScheme.onTertiary,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customTextField(
                      hintText: "Enter Email Address",
                      prefixIc: Icon(
                        Icons.email_outlined,
                        size: 30.sp,
                        color: Colors.grey.shade700,
                      )),
                ],
              ),
            ),
            // login account btn

            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, OTPScreen.routeName);
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: btnAndText(
                            fontSize: 18,
                            verticalPadding: 14.h,
                            containerWidth: double.infinity,
                            text: "Reset Password")),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: btnAndText2(
                            container: const Icon(
                              Icons.chevron_left,
                              color: AppColors.primaryColor,
                            ),
                            fontSize: 18,
                            textColor: AppColors.primaryColor,
                            containerColor: AppColors.transparent,
                            verticalPadding: 14.h,
                            containerWidth: double.infinity,
                            text: "Back to login")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
