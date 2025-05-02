import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/features/animations/page_route_animation.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/onboarding/widgets/onboarding_text.dart';

class OnboardingScreen2 extends StatefulWidget {
  OnboardingScreen2({
    super.key,
    required this.index,
    required this.pageController,
    required this.pageCount,
  });
  final int index;
  final PageController pageController;
  final int pageCount;

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onboardingImage2),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Text(
                'Share Your Own Testimony',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isLargeScreen
                      ? Theme.of(context).textTheme.headlineLarge?.fontSize
                      : Theme.of(context).textTheme.headlineMedium?.fontSize,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              onboardingText(
                context,
                'Your story matters. Share your journey of faith and encourage others to believe and grow.',
              ),
              SizedBox(height: screenHeight * 0.015),
              DotsIndicator(
                position: widget.index,
                dotsCount: widget.pageCount,
                mainAxisAlignment: MainAxisAlignment.center,
                decorator: DotsDecorator(
                  color: AppColors.white,
                  size: const Size.square(8.0),
                  activeColor: AppColors.primaryColor,
                  activeSize: const Size(25.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.035),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: InkWell(
                  onTap: () {
                    if (widget.index < widget.pageCount - 1) {
                      widget.pageController.animateToPage(
                        widget.index + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: btnAndText(
                    text: "Next",
                    containerWidth: double.infinity,
                    verticalPadding: 15,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MyCustomRouteTransition(route: const NavBar()),
                      (route) => false,
                    );
                  },
                  child: btnAndText(
                    text: "Skip",
                    containerColor: Colors.transparent,
                    containerWidth: double.infinity,
                    verticalPadding: 15,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
