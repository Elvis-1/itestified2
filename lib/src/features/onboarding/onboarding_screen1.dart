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
import 'package:itestified/src/features/home/presentation/home_screen.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/onboarding/widgets/onboarding_text.dart';

class OnboardingScreen3 extends StatefulWidget {
  OnboardingScreen3({super.key, required this.index});
  int index;
  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        // height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onboardingImage1),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 450.h,
            ),
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
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, NavBar.routeName, (route) => false);
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return const SignUpScreen();
                // }));
              },
              child: btnAndText(
                  text: "Get Started",
                  containerWidth: double.infinity,
                  verticalPadding: 15),
            ),
          ],
        ),
      ),
    );
  }
}
