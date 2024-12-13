import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies.dart';

class TestimonyPostedSuccessfully extends StatelessWidget {
  const TestimonyPostedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Image.asset(AppImages.successImage),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Testimony posted successfully!",
                  textAlign: TextAlign.center,
                  style: normalTextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "You can always view your testimonies by clicking on 'my testimones' in profile page",
                  textAlign: TextAlign.center,
                  style: normalTextStyle(
                      fontSize: 15.sp, textColor: AppColors.textColor),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const MyTestimoniesScreen();
                    }));
                  },
                  child: btnAndText(
                      text: "View My Testimonies",
                      containerWidth: double.infinity,
                      verticalPadding: 15),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const NavBar();
                    }));
                  },
                  child: btnAndText(
                      text: "Back to Home",
                      containerColor: Colors.transparent,
                      containerWidth: double.infinity,
                      verticalPadding: 15,
                      textColor: AppColors.primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
