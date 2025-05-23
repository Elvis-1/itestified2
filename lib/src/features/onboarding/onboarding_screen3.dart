import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/page_route_animation.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/onboarding/widgets/onboarding_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen3 extends StatefulWidget {
  OnboardingScreen3({super.key, required this.index, required this.pageCount});
  final int index;
  final int pageCount;

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
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
            image: AssetImage(AppImages.onboardingImage3),
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
                'Join a Community',
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
                'Connect with believers and grow together in faith.',
              ),
              SizedBox(height: screenHeight * 0.015),
              DotsIndicator(
                position: double.parse(widget.index.toString()),
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
                    Navigator.of(context).pushAndRemoveUntil(
                      MyCustomRouteTransition(route: const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: btnAndText(
                    text: "Login",
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignUpScreen.routeName,
                      (route) => false,
                    );
                  },
                  child: btnAndText(
                    text: "Create Account",
                    containerColor: Colors.transparent,
                    containerWidth: double.infinity,
                    verticalPadding: 15,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isOnboardingComplete', true);
                  Provider.of<AuthViewModel>(context, listen: false)
                      .setGuestMode(true);
                  Navigator.of(context).pushAndRemoveUntil(
                    MyCustomRouteTransition(route: const NavBar()),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: textWidget(
                    'Continue as Guest',
                    color: Colors.white,
                    fontSize: isLargeScreen ? 14 : 12,
                    fontWeight: FontWeight.w600,
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
