import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: themeProvider.themeData.colorScheme.background,
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
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Password",
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              customTextField(
                  hintText: "Enter Password",
                  prefixIc: Icon(
                    Icons.lock_outline,
                    color: Colors.grey.shade700,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
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
                            fontSize: 15,
                            textColor:
                                themeProvider.themeData.colorScheme.onTertiary),
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
                          fontWeight: FontWeight.w700),
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
                  lineWidget(
                      color: themeProvider.themeData.colorScheme.outline,
                      width: 180.w),
                  Text(
                    " OR ",
                    style: normalTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      textColor: themeProvider.themeData.colorScheme.tertiary,
                    ),
                  ),
                  lineWidget(
                      color: themeProvider.themeData.colorScheme.outline,
                      width: 180.w),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // social login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  themeProvider.themeData == AppThemes.darkTheme
                      ? Image.asset(AppIcons.googleIcon)
                      : Image.asset(AppIcons.googleLightIcon),
                  SizedBox(
                    width: 25.w,
                  ),
                  themeProvider.themeData == AppThemes.darkTheme
                      ? Image.asset(AppIcons.appleIcon)
                      : Image.asset(AppIcons.appleLightIcon),
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
