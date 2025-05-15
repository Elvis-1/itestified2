import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen1.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen2.dart';
import 'package:itestified/src/features/onboarding/onboarding_screen3.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  PageController pageController = PageController();
  int pageValue = 0;

  void onPageChange(int index) {
    setState(() {
      pageValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        onPageChange(index);
      },
      children: [
        OnboardingScreen1(
          pageController: pageController,
          index: pageValue,
          pageCount: 3,
        ),
        OnboardingScreen2(
          pageController: pageController,
          index: pageValue,
          pageCount: 3,
        ),
        OnboardingScreen3(
          index: pageValue,
          pageCount: 3, 
        ),
      ],
    );
  }
}