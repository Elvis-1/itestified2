import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/nav/navbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: textWidget("Welcome Back"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),

              SizedBox(
                height: 20.h,
              ),
              Text(
                "Email Address",
                style:
                    normalTextStyle(textColor: AppColors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              customTextField(context,
                  hintText: "Enter Email Address",
                  prefixIc: Icon(
                    Icons.email_outlined,
                    size: 30.sp,
                    color: Colors.grey.shade700,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Password",
                style:
                    normalTextStyle(textColor: AppColors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              customTextField(context,
                  hintText: "Enter Password",
                  prefixIc: Icon(
                    Icons.lock_outline,
                    color: Colors.grey.shade700,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    size: 30.sp,
                    color: Colors.grey.shade700,
                  )),

              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text(
                        "Remember me",
                        style: normalTextStyle(
                            fontSize: 15, textColor: AppColors.white),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot password?",
                      style: normalTextStyle(
                          textColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),
              // login account btn
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const NavBar();
                  }));
                },
                child: Align(
                    alignment: Alignment.center,
                    child: btnAndText(
                        fontSize: 18,
                        verticalPadding: 14.h,
                        containerWidth: double.infinity,
                        text: "Log in")),
              ),

              SizedBox(
                height: 20.h,
              ),
              // horizontal line
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lineWidget(color: AppColors.textColor, width: 180.w),
                  Text(
                    "OR",
                    style: normalTextStyle(
                      fontSize: 18.sp,
                      textColor: AppColors.textColor,
                    ),
                  ),
                  lineWidget(color: AppColors.textColor, width: 180.w)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // social login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.googleIcon),
                  SizedBox(
                    width: 25.w,
                  ),
                  Image.asset(AppIcons.appleIcon),
                ],
              ),
              SizedBox(
                height: 200.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget("Don't have an account?", fontSize: 15.sp),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }));
                    },
                    child: textWidget(
                      " Create account",
                      fontSize: 15,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
