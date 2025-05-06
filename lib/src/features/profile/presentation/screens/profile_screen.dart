import 'package:flutter/material.dart';
import 'package:itestified/src/config/authprovider.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/about.dart';
import 'package:itestified/src/features/profile/presentation/screens/change_password.dart';
import 'package:itestified/src/features/profile/presentation/screens/delete_account.dart';
import 'package:itestified/src/features/profile/presentation/screens/display_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/donation_history.dart';
import 'package:itestified/src/features/profile/presentation/screens/edit_profile.dart';
import 'package:itestified/src/features/profile/presentation/screens/follow_itestify.dart';
import 'package:itestified/src/features/profile/presentation/screens/donation_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/help_desk.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies.dart';
import 'package:itestified/src/features/profile/presentation/screens/rate_itestified.dart';
import 'package:itestified/src/features/profile/presentation/widgets/icon_and_text_row.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/screens/signup_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    final isGuest = authProvider.isGuest;

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: textWidget(
          "Profile",
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          color: themeProvider.themeData.colorScheme.onTertiary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: FadeInTransitionWidget(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Consumer<ThemeViewmodel>(
                  builder: (context, themeProvider, child) {
                    final isDarkMode =
                        themeProvider.themeData.brightness == Brightness.dark;
                    return CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        isGuest
                            ? (isDarkMode
                                ? AppIcons.guestIconDark
                                : AppIcons.guestIconLight)
                            : AppIcons.userIcon,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
                textWidget(
                  isGuest ? "Guest Mode" : "Chika Amaka",
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                ),
                textWidget(
                  isGuest
                      ? "You are currently browsing as guest"
                      : "chikaamaka200@gmail.com",
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return isGuest
                          ? const SignUpScreen()
                          : const EditProfileScreen();
                    }));
                  },
                  child: btnAndText(
                    text: isGuest ? "Create Account" : "Edit Profile",
                    containerWidth: isGuest ? 150 : 110,
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    verticalPadding: 8,
                  ),
                ),
                const SizedBox(height: 30),
                if (!isGuest) ...[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const MyTestimoniesScreen();
                      }));
                    },
                    child: iconAndTextRow(AppIcons.articleIcon,
                        "My Testimonies", AppIcons.nextIcon),
                  ),
                ],
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DisplayScreen();
                    }));
                  },
                  child: iconAndTextRow(
                      AppIcons.displayIcon, "Display", AppIcons.nextIcon),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const DonationScreen();
                    }));
                  },
                  child: iconAndTextRow(
                      AppIcons.donationIcon, "Donations", AppIcons.nextIcon),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const DonationHistoryScreen();
                    }));
                  },
                  child: iconAndTextRow(AppIcons.donationHistory,
                      "Donation History", AppIcons.nextIcon),
                ),
                lineWidget(
                  width: double.infinity,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.White50
                      : AppColors.grey30,
                ),
                if (!isGuest) ...[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const NotificationsScreen();
                      }));
                    },
                    child: iconAndTextRow(AppIcons.notification1Icon,
                        "Notifications", AppIcons.nextIcon),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ChangePasswordScreen();
                      }));
                    },
                    child: iconAndTextRow(AppIcons.passwordIcon,
                        "Change My Password", AppIcons.nextIcon),
                  ),
                ],
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const FollowItestify();
                    }));
                  },
                  child: iconAndTextRow(
                      AppIcons.follow, "Follow @iTestified", AppIcons.nextIcon),
                ),
                lineWidget(
                  width: double.infinity,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.White50
                      : AppColors.grey30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const About();
                    }));
                  },
                  child: iconAndTextRow(
                      AppIcons.aboutIcon, "About", AppIcons.nextIcon),
                ),
                if (!isGuest)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RateItestified();
                      }));
                    },
                    child: iconAndTextRow(AppIcons.rateIcon, "Rate iTestified",
                        AppIcons.nextIcon),
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HelpDesk();
                    }));
                  },
                  child: iconAndTextRow(
                      AppIcons.helpIcon, "Help", AppIcons.nextIcon),
                ),
                lineWidget(
                  width: double.infinity,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.White50
                      : AppColors.grey30,
                ),
                if (!isGuest) ...[
                  lineWidget(
                    width: double.infinity,
                    color: themeProvider.themeData.colorScheme.outline,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DeleteAccount.routeName);
                    },
                    child: iconAndTextRow(AppIcons.deleteIcon, "Delete Account",
                        AppIcons.nextIcon),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showLogoutDialogOverlay(context, "Log Out");
                    },
                    child: iconAndTextRow(
                        AppIcons.helpIcon, "Log Out", AppIcons.nextIcon),
                  ),
                  lineWidget(
                    width: double.infinity,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.White50
                        : AppColors.grey30,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
