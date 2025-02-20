import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:provider/provider.dart';

Future showDeleteDialogOverlay(BuildContext context, message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return delete(message: message);
      });
}

Future showLogoutDialogOverlay(BuildContext context, message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return logout(message: message);
      });
}

Future showJoinOurCommunityDialogOverlay(BuildContext context, message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const joinCommunity();
      });
}

Future showRateSubmittedDialogOverlay(BuildContext context, message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const rate();
      }).then((value) => Navigator.of(context).pop());
}

// WIDGETS
class rate extends StatelessWidget {
  const rate({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return AlertDialog(
      elevation: 0,
      backgroundColor: themeProvider.themeData.colorScheme.onBackground,
      content: SingleChildScrollView(
        child: Container(
          color: themeProvider.themeData.colorScheme.onBackground,
          // height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              Text(
                "Rating Submitted",
                style: GoogleFonts.mulish(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: themeProvider.themeData.colorScheme.onTertiary),
              ),
              const SizedBox(
                height: 10,
              ),
              textWidget(
                "Thank you for your time",
                fontSize: 14.sp,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class logout extends StatelessWidget {
  const logout({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return AlertDialog(
      elevation: 0,
      backgroundColor: themeProvider.themeData.colorScheme.background,
      content: SingleChildScrollView(
        child: Container(
          color: themeProvider.themeData.colorScheme.background,
          // height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                message,
                style: GoogleFonts.mulish(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              textWidget(
                "Are you sure you want to logout this",
                fontSize: 14.sp,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  btnAndText(containerWidth: 130.w, text: "Yes"),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: btnAndText(
                      textColor: AppColors.primaryColor,
                      containerWidth: 130.w,
                      containerColor:
                          themeProvider.themeData.colorScheme.background,
                      text: "No",
                      //  horizontalPadding: 20
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class delete extends StatelessWidget {
  const delete({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return AlertDialog(
      elevation: 0,
      backgroundColor: themeProvider.themeData.colorScheme.background,
      content: SingleChildScrollView(
        child: Container(
          color: themeProvider.themeData.colorScheme.background,
          // height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CircleAvatar(
              //   backgroundColor: AppColors.primaryColor,
              //   child: Icon(
              //     Icons.check,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),

              Text(
                message,
                style: GoogleFonts.mulish(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: themeProvider.themeData.colorScheme.onTertiary),
              ),
              const SizedBox(
                height: 10,
              ),
              textWidget("Are you sure you want to delete this post",
                  fontSize: 14.sp,
                  color: themeProvider.themeData.colorScheme.tertiary),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: btnAndText(
                      textColor: AppColors.primaryColor,
                      containerWidth: 130.w,
                      containerColor:
                          themeProvider.themeData.colorScheme.background,
                      text: "Cancel",
                      //  horizontalPadding: 20
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  btnAndText(containerWidth: 130.w, text: "Delete")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class joinCommunity extends StatelessWidget {
  const joinCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return AlertDialog(
      elevation: 0,
      backgroundColor: themeProvider.themeData.colorScheme.onBackground,
      content: SingleChildScrollView(
        child: Container(
          color: themeProvider.themeData.colorScheme.onBackground,
          // height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.clear,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Join Our Community",
                style: GoogleFonts.mulish(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: themeProvider.themeData.colorScheme.onTertiary),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Create an account or log in to watch testimonies and access other features",
                textAlign: TextAlign.center,
                style: normalTextStyle(
                  textColor: themeProvider.themeData.colorScheme.tertiary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
                child: btnAndText(
                  textColor: AppColors.white,
                  containerWidth: 250.w,
                  verticalPadding: 10,
                  containerColor: AppColors.primaryColor,
                  text: "Create an account",
                  //  horizontalPadding: 20
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
