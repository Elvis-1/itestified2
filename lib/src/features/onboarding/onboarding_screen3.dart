import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/features/animations/page_route_animation.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/onboarding/widgets/onboarding_text.dart';

class OnboardingScreen1 extends StatefulWidget {
  OnboardingScreen1(
      {super.key, required this.index, required this.pageController});
  int index;
  PageController pageController = PageController();

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onboardingImage1),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Watch Inspiring Testimonies',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            onboardingText(context,
                'Witness real-life stories of healing, breakthroughs,  divine intervention and many more. '),
            const SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () {
                  if (widget.index < 3) {
                    widget.pageController.animateToPage(widget.index + 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  }
                },
                child: btnAndText(
                    containerWidth: double.infinity, verticalPadding: 15)),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MyCustomRouteTransition(
                    route: const NavBar(),
                  ),
                  (route) => false,
                );

                // Navigator.pushNamedAndRemoveUntil(
                //                 context, NavBar.routeName, (route) => false);
              },
              child: btnAndText(
                  text: "Skip",
                  containerColor: Colors.transparent,
                  containerWidth: double.infinity,
                  verticalPadding: 15,
                  textColor: AppColors.primaryColor),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
