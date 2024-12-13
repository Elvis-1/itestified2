import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/about.dart';
import 'package:itestified/src/features/profile/presentation/screens/change_password.dart';
import 'package:itestified/src/features/profile/presentation/screens/display_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/edit_profile.dart';
import 'package:itestified/src/features/profile/presentation/screens/follow_itestify.dart';
import 'package:itestified/src/features/profile/presentation/screens/giving_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/help_desk.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies.dart';
import 'package:itestified/src/features/profile/presentation/screens/rate_itestified.dart';
import 'package:itestified/src/features/profile/presentation/widgets/icon_and_text_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            textWidget("Profile", fontSize: 25.sp),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        AppIcons.userIcon,
                      ),
                      fit: BoxFit.cover)),
            ),
            textWidget("Chika Amaka", fontSize: 23.sp),
            textWidget("chikaamaka200@gmail.com",
                fontSize: 17.sp, color: AppColors.textColor),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const EditProfileScreen();
                }));
              },
              child: btnAndText(
                  text: "Edit Profile",
                  containerWidth: 110.w,
                  fontSize: 15.sp,
                  verticalPadding: 8.h),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const MyTestimoniesScreen();
                }));
              },
              child: iconAndTextRow(
                  AppIcons.articleIcon, "My Testimonies", AppIcons.nextIcon),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DisplayScreen();
                  }));
                },
                child: iconAndTextRow(
                    AppIcons.displayIcon, "Display", AppIcons.nextIcon)),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const GivingScreen();
                  }));
                },
                child: iconAndTextRow(
                    AppIcons.givingIcon, "Giving", AppIcons.nextIcon)),
            lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NotificationsScreen();
                }));
              },
              child: iconAndTextRow(AppIcons.notification1Icon, "Notifications",
                  AppIcons.nextIcon),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangePasswordScreen();
                }));
              },
              child: iconAndTextRow(AppIcons.passwordIcon, "Change My Password",
                  AppIcons.nextIcon),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const FollowItestify();
                }));
              },
              child: iconAndTextRow(
                  AppIcons.givingIcon, "Follow @iTestified", AppIcons.nextIcon),
            ),
            lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const About();
                  }));
                },
                child: iconAndTextRow(
                    AppIcons.aboutIcon, "About", AppIcons.nextIcon)),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const RateItestified();
                }));
              },
              child: iconAndTextRow(
                  AppIcons.rateIcon, "Rate iTestified", AppIcons.nextIcon),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HelpDesk();
                  }));
                },
                child: iconAndTextRow(
                    AppIcons.helpIcon, "Help", AppIcons.nextIcon)),
            lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
            GestureDetector(
                onTap: () async {
                  await showLogoutDialogOverlay(context, "Log Out");
                },
                child: iconAndTextRow(
                    AppIcons.helpIcon, "Log Out", AppIcons.nextIcon)),
          ],
        ),
      ),
    );
  }
}
