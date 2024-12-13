import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context).themeData;
    TextStyle style = normalTextStyle(
        textColor: themeProvider.colorScheme.onTertiary, fontSize: 20);
    return Scaffold(
      backgroundColor: themeProvider.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: themeProvider.colorScheme.background,
        title: textWidget("Create an account",
            color: themeProvider.colorScheme.onTertiary),
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
              Text(
                "Full Name",
                style: style,
              ),
              SizedBox(
                height: 10.h,
              ),
              customTextField(context,
                  prefixIc: Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey.shade700,
                    size: 30.sp,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text("Email Address", style: style),
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
              Text("Password", style: style),
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
                height: 20.h,
              ),
              Text("Confirm Password", style: style),
              SizedBox(
                height: 10.h,
              ),
              customTextField(context,
                  hintText: 'Re-Enter Password',
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
                height: 50.h,
              ),

              // create account btn
              Align(
                  alignment: Alignment.center,
                  child: btnAndText(
                      fontSize: 18,
                      verticalPadding: 14.h,
                      containerWidth: double.infinity,
                      text: "Create Account")),

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
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget("Already have an account?",
                      fontSize: 15.sp,
                      color: themeProvider.colorScheme.onTertiary),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    child: textWidget(
                      " Log in",
                      fontSize: 15,
                      color: themeProvider.primaryColor,
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
