import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/authprovider.dart';
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
                image: AssetImage(AppImages.onboardingImage3),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return constraints.maxWidth > 600
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 570,
                    );
            }),
            Text(
              'Join a Commuity',
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
            onboardingText(
                context, 'Connect with believers and grow together in faith. '),
            const SizedBox(
              height: 30,
            ),
            // const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MyCustomRouteTransition(
                    route: const LoginScreen(),
                  ),
                  (route) => false,
                );
                // Navigator.pushNamedAndRemoveUntil(
                //     context, NavBar.routeName, (route) => false);
              },
              child: btnAndText(
                  text: "Login",
                  containerWidth: double.infinity,
                  verticalPadding: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, SignUpScreen.routeName, (route) => false);
              },
              child: btnAndText(
                  text: "Create Account",
                  containerColor: Colors.transparent,
                  containerWidth: double.infinity,
                  verticalPadding: 15,
                  textColor: AppColors.primaryColor),
            ),

            InkWell(
           onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isOnboardingComplete', true);
                Provider.of<AuthProvider>(context, listen: false)
                    .setGuestMode(true);
                Navigator.of(context).pushAndRemoveUntil(
                  MyCustomRouteTransition(
                    route: const NavBar(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2))),
                child: textWidget(
                  'Continue as Guest',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
