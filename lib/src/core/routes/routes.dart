import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/add_testimony.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/new_password.dart';
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart'
    as otp_screen;
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:itestified/src/features/category/presentation/screens/categories_screen.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/home/presentation/home_screen.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/profile/presentation/screens/account_details_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/delete_account.dart';
import 'package:itestified/src/features/profile/presentation/screens/donation_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/profile/presentation/screens/privacy_policy.dart';
import 'package:itestified/src/features/profile/presentation/screens/terms_of_use.dart';
import 'package:itestified/src/features/splashscreen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_list_screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/written_testimonies.dart';

import '../../features/profile/presentation/screens/donation_details.dart';
import '../../features/profile/presentation/screens/donation_history.dart';

Route onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    NavBar.routeName => MaterialPageRoute(
        builder: (_) {
          final args = settings.arguments as Map<String, dynamic>?;
          return NavBar(
            initialPage: args?['initialPage'] as Widget?,
            initialIndex: args?['initialIndex'] as int? ?? 0,
          );
        },
        settings: const RouteSettings(name: NavBar.routeName),
      ),
    // AUTH SCREENS
    LoginScreen.routeName => MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      ),
    otp_screen.OTPScreen.routeName => MaterialPageRoute(
        builder: (_) => otp_screen.OTPScreen(
          args: settings.arguments as otp_screen.Arguments,
        ),
        settings: const RouteSettings(name: otp_screen.OTPScreen.routeName),
      ),
    VerifyEmailScreen.routeName => MaterialPageRoute(
        builder: (_) => VerifyEmailScreen(
          args: settings.arguments as Arguments,
        ),
        settings: const RouteSettings(name: VerifyEmailScreen.routeName),
      ),
    SignUpScreen.routeName => MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
        settings: const RouteSettings(name: SignUpScreen.routeName),
      ),
    NewPasswordScreen.routeName => MaterialPageRoute(
        builder: (_) => NewPasswordScreen(
          args: settings.arguments as otp_screen.Arguments,
        ),
        settings: const RouteSettings(name: NewPasswordScreen.routeName),
      ),
    // HOME SCREEN
    HomeScreen.routeName => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: HomeScreen.routeName),
      ),
    // VIDEO SCREEN
    VideoScreen.routeName => MaterialPageRoute(
        builder: (_) => VideoScreen(
          heroIndex: settings.arguments as int,
        ),
        settings: const RouteSettings(name: VideoScreen.routeName),
      ),
    // VIDEO AND WRITTEN TESTIMONY SCREEN
    VideoAndWrittenTestimonieScreen.routeName => MaterialPageRoute(
        builder: (_) => const VideoAndWrittenTestimonieScreen(),
        settings: const RouteSettings(
            name: VideoAndWrittenTestimonieScreen.routeName),
      ),
    VideoListScreen.routeName => MaterialPageRoute(
        builder: (_) => const VideoListScreen(),
        settings: const RouteSettings(name: VideoListScreen.routeName),
      ),
    WrittenTestimonies.routeName => MaterialPageRoute(
        builder: (_) => const WrittenTestimonies(),
        settings: const RouteSettings(name: WrittenTestimonies.routeName),
      ),
    // TESTIMONY CATEGORIES LIST SCREEN
    CategoriesListScreen.routeName => MaterialPageRoute(
        builder: (_) => const CategoriesListScreen(),
        settings: const RouteSettings(name: CategoriesListScreen.routeName),
      ),
    // TESTIMONY DETAILS SCREEN
    MyTestimoniesDetailsScreen.routeName => MaterialPageRoute(
        builder: (_) => const MyTestimoniesDetailsScreen(),
        settings:
            const RouteSettings(name: MyTestimoniesDetailsScreen.routeName),
      ),
    // ADD TESTIMONY SCREEN
    AddTestimonyScreen.routeName => MaterialPageRoute(
        builder: (_) => AddTestimonyScreen(
          action: settings.arguments as TestimonyAction,
        ),
        settings: const RouteSettings(name: AddTestimonyScreen.routeName),
      ),
    // DONATION SCREEN
    DonationScreen.routeName => MaterialPageRoute(
        builder: (_) => const DonationScreen(),
        settings: const RouteSettings(name: DonationScreen.routeName),
      ),
    // DONATION HISTORY SCREEN
    DonationHistoryScreen.routeName => MaterialPageRoute(
        builder: (_) => const DonationHistoryScreen(),
        settings: const RouteSettings(name: DonationHistoryScreen.routeName),
      ),
    // DONATION DETAILS SCREEN
    DonationDetailsScreen.routeName => MaterialPageRoute(
        builder: (_) => DonationDetailsScreen(
          transaction: settings.arguments as Map<String, dynamic>,
        ),
        settings: const RouteSettings(name: DonationDetailsScreen.routeName),
      ),
    // ACCOUNT DETAILS SCREEN
    AccountDetailsScreen.routeName => MaterialPageRoute(
        builder: (_) => AccountDetailsScreen(
          transferType: settings.arguments as TransferType,
        ),
        settings: const RouteSettings(name: AccountDetailsScreen.routeName),
      ),
    // ABOUT
    TermsOfUse.routeName => MaterialPageRoute(
        builder: (_) => const TermsOfUse(),
        settings: const RouteSettings(name: TermsOfUse.routeName),
      ),
    PrivacyPolicy.routeName => MaterialPageRoute(
        builder: (_) => const PrivacyPolicy(),
        settings: const RouteSettings(name: PrivacyPolicy.routeName),
      ),
    DeleteAccount.routeName => MaterialPageRoute(
        builder: (_) => const DeleteAccount(),
        settings: const RouteSettings(name: DeleteAccount.routeName),
      ),
    _ => MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      ),
  };
}
