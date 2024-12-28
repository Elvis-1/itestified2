import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/faq_container.dart';
import 'package:provider/provider.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({super.key});

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  bool showDetails = false;
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const appbar2(
                "Help",
              ),
              SizedBox(
                height: 20.h,
              ),
              textWidget("Frequently Asked Questions", fontSize: 19.sp),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    one = !one;
                  });
                },
                child: faqContainer(
                    "How do I post testimonies",
                    "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                    one),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    two = !two;
                  });
                },
                child: faqContainer(
                    "How can I donate to iTestified",
                    "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                    two),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    three = !three;
                  });
                },
                child: faqContainer(
                    "How can I change the app theme",
                    "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                    three),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    four = !four;
                  });
                },
                child: faqContainer(
                    "How can I edit my profile information",
                    "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                    four),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      textWidget("Contact our support team", fontSize: 19.sp)),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                decoration: BoxDecoration(
                    color: themeProvider
                        .themeData.searchBarTheme.backgroundColor
                        ?.resolve({}),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      "Email address",
                      fontSize: 15.sp,
                    ),
                    textWidget("itestified2022@gmail.com",
                        fontSize: 14.sp,
                        color: themeProvider.themeData.colorScheme.onTertiary),
                    SizedBox(
                      height: 10.h,
                    ),
                    textWidget(
                      "Phone Number",
                      fontSize: 15.sp,
                    ),
                    textWidget("090090999909",
                        fontSize: 14.sp,
                        color: themeProvider.themeData.colorScheme.onTertiary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
