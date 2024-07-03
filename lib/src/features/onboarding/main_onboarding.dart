import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen1.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen2.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen3.dart';
import 'package:itestified/src/features/onboarding/widgets/page.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  PageController pageController = PageController();
  int pageValue = 0;
  onPageChange(index) {
    setState(() {
      pageValue = index;
    });
  }

  // List<Widget>
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            onPageChange(index);
          },
          children: [
            // page(1, context, 'Next', 'Title', 'Subtitle', 'image-path',
            //     pageController),
            // page(2, context, 'Keep', 'Title', 'Subtitle', 'image-path',
            //     pageController),
            // page(3, context, 'Left', 'Title', 'Subtitle', 'image-path',
            //     pageController),
            OnboardingScreen1(
              index: pageValue,
            ),
            OnboardingScreen2(
              index: pageValue,
            ),
            OnboardingScreen3(
              index: pageValue,
            )
          ],
        ),
        Positioned(
            bottom: 170.h,
            child: DotsIndicator(
              position: pageValue,
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              decorator: DotsDecorator(
                  color: AppColors.white,
                  size: Size.square(8.0),
                  activeColor: AppColors.primaryColor,
                  activeSize: Size(18.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ))
      ],
    );
  }
}
