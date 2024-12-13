import 'package:flutter/cupertino.dart';
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

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  static const routeName = '/new-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: textWidget("Create New Password"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    textWidget(
                        "Your new password must be different from previously used passwords",
                        fontWeight: FontWeight.w100,
                        fontSize: 15,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "New Password",
                      style: normalTextStyle(
                          textColor: AppColors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    customTextField(context,
                        hintText: "Enter Password",
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          size: 30.sp,
                          color: Colors.grey.shade700,
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Confirm Password",
                      style: normalTextStyle(
                          textColor: AppColors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    customTextField(context,
                        hintText: "Enter Password",
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          size: 30.sp,
                          color: Colors.grey.shade700,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    textWidget(
                      "Password must be at least 8 characters",
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
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
                      text: "Create New Password")),
            ),

            SizedBox(
              height: 20.h,
            ),
            // horizontal line
          ],
        ),
      ),
    );
  }
}
