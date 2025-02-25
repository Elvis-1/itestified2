import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 20,
              ),
              LayoutBuilder(builder: (context, constraints) {
                bool isLargeScreen = constraints.maxWidth > 600;
                return !isLargeScreen
                    ? Column(
                        children: [
                          Text(
                            "Email Address",
                            style: normalTextStyle(
                                textColor: themeProvider
                                    .themeData.colorScheme.onTertiary,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextField(
                              hintText: "Enter Email Address",
                              prefixIc: Icon(
                                Icons.email_outlined,
                                size: 30,
                                color: Colors.grey.shade700,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Password",
                            style: normalTextStyle(
                                textColor: themeProvider
                                    .themeData.colorScheme.onTertiary,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextField(
                              hintText: "Enter Password",
                              prefixIc: Icon(
                                Icons.lock_outline,
                                color: Colors.grey.shade700,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off_outlined,
                                size: 30,
                                color: Colors.grey.shade700,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     Checkbox(value: false, onChanged: (value) {}),
                              //     Text(
                              //       "Remember me",
                              //       style: normalTextStyle(
                              //           fontSize: 15,
                              //           textColor:
                              //               themeProvider.themeData.colorScheme.onTertiary),
                              //     ),
                              //   ],
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen()));
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
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email Address",
                                      style: normalTextStyle(
                                          textColor: themeProvider
                                              .themeData.colorScheme.onTertiary,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(
                                        hintText: "Enter Email Address",
                                        prefixIc: Icon(
                                          Icons.email_outlined,
                                          size: 30,
                                          color: Colors.grey.shade700,
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Password",
                                      style: normalTextStyle(
                                          textColor: themeProvider
                                              .themeData.colorScheme.onTertiary,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(
                                        hintText: "Enter Password",
                                        prefixIc: Icon(
                                          Icons.lock_outline,
                                          color: Colors.grey.shade700,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.visibility_off_outlined,
                                          size: 30,
                                          color: Colors.grey.shade700,
                                        )),

                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     // Row(
                                    //     //   children: [
                                    //     //     Checkbox(value: false, onChanged: (value) {}),
                                    //     //     Text(
                                    //     //       "Remember me",
                                    //     //       style: normalTextStyle(
                                    //     //           fontSize: 15,
                                    //     //           textColor:
                                    //     //               themeProvider.themeData.colorScheme.onTertiary),
                                    //     //     ),
                                    //     //   ],
                                    //     // ),
                                    //     GestureDetector(
                                    //       onTap: () {
                                    //         Navigator.of(context).push(
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     const ForgotPasswordScreen()));
                                    //       },
                                    //       child: Text(
                                    //         "Forgot password?",
                                    //         style: normalTextStyle(
                                    //             textColor: AppColors.primaryColor,
                                    //             fontWeight: FontWeight.w700),
                                    //       ),
                                    //     ),

                                    //   ],
                                    // ),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()));
                            },
                            child: Text(
                              "Forgot password?",
                              style: normalTextStyle(
                                  textColor: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      );
              }),

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
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                        verticalPadding: 14,
                        containerWidth: double.infinity,
                        text: "Log in")),
              ),

              const SizedBox(
                height: 20,
              ),
              // horizontal line
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lineWidget(
                      color: themeProvider.themeData.colorScheme.outline,
                      width: 170),
                  Text(
                    " OR ",
                    style: normalTextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      fontWeight: FontWeight.w300,
                      textColor: themeProvider.themeData.colorScheme.tertiary,
                    ),
                  ),
                  lineWidget(
                      color: themeProvider.themeData.colorScheme.outline,
                      width: 170),
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
                  const SizedBox(
                    width: 25,
                  ),
                  themeProvider.themeData == AppThemes.darkTheme
                      ? Image.asset(AppIcons.appleIcon)
                      : Image.asset(AppIcons.appleLightIcon),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget(
                    "Don't have an account?",
                    fontWeight: FontWeight.w600,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }));
                    },
                    child: textWidget(
                      " Create account",
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
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
