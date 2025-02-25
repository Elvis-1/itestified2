import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/features/animations/page_route_animation.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onboardingImage1),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return constraints.maxWidth > 600
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 450,
                    );
            }),
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
            onboardingText(context),
            // const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MyCustomRouteTransition(
                    route: const NavBar(),
                  ),
                  (route) => false,
                );
                // Navigator.pushNamedAndRemoveUntil(
                //     context, NavBar.routeName, (route) => false);
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
