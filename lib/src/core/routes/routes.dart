import 'package:flutter/material.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/new_password.dart';
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/category/presentation/screens/categories_screen.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/home/presentation/home_screen.dart';
import 'package:itestified/src/features/splashscreen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    // AUTH SCREENS
    LoginScreen.routeName => MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      ),
    OTPScreen.routeName => MaterialPageRoute(
        builder: (_) => OTPScreen(),
        settings: const RouteSettings(name: OTPScreen.routeName),
      ),
    SignUpScreen.routeName => MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
        settings: const RouteSettings(name: SignUpScreen.routeName),
      ),
    NewPasswordScreen.routeName => MaterialPageRoute(
        builder: (_) => const NewPasswordScreen(),
        settings: const RouteSettings(name: NewPasswordScreen.routeName),
      ),

// HOME SCREEN

    HomeScreen.routeName => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: HomeScreen.routeName),
      ),
// VIDEO SCREEN
    VideoScreen.routeName => MaterialPageRoute(
        builder: (_) => const VideoScreen(),
        settings: const RouteSettings(name: VideoScreen.routeName),
      ),

    // VIDEO AND WRITTEN TESTIMONY SCREEN
    VideoAndWrittenTestimonieScreen.routeName => MaterialPageRoute(
        builder: (_) => const VideoAndWrittenTestimonieScreen(),
        settings: const RouteSettings(
            name: VideoAndWrittenTestimonieScreen.routeName),
      ),

    // TESTIMONY CATEGORIES LIST SCREEN
    CategoriesListScreen.routeName => MaterialPageRoute(
        builder: (_) => const CategoriesListScreen(),
        settings: const RouteSettings(name: CategoriesListScreen.routeName),
      ),
    _ => MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      ),
  };
}
