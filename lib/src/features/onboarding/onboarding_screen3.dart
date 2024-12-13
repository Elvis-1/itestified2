import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/onboarding/widgets/onboarding_text.dart';

class OnboardingScreen1 extends StatefulWidget {
  OnboardingScreen1(
      {super.key, required this.index, required this.pageController});
  int index;
  PageController pageController = PageController();

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        // height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onboardingImage1),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Watch Inspiring Testimonies',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            onboardingText(),
            SizedBox(
              height: 70.h,
            ),
            GestureDetector(
                onTap: () {
                  if (widget.index < 3) {
                    widget.pageController.animateToPage(widget.index + 1,
                        duration: Duration(microseconds: 1000),
                        curve: Curves.easeIn);
                  }
                },
                child: btnAndText(
                    containerWidth: double.infinity, verticalPadding: 15)),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
              child: btnAndText(
                  text: "Skip",
                  containerColor: Colors.transparent,
                  containerWidth: double.infinity,
                  verticalPadding: 15,
                  textColor: AppColors.primaryColor),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
