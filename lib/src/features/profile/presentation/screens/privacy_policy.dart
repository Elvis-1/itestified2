import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/terms.dart';
import 'package:provider/provider.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  static const routeName = '/privacy-policy';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var color = themeProvider.themeData.colorScheme;

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          const appbar2(
            "Privacy Policy",
          ),
          SizedBox(
            height: 20.h,
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 2),
                shrinkWrap: true,
                children: [
                  textWidget("Effective Date: 28th August, 2024.",
                      fontSize: 15.sp),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("1. Introduction",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Welcome to ",
                        style: normalTextStyle(textColor: color.tertiary),
                        children: [
                          TextSpan(
                              text: 'iTestified!.',
                              style: normalTextStyle(
                                  textColor: color.onTertiary,
                                  fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                    text:
                                        ' This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our mobile application. By accessing or using our application, you agree to the collection and use of information following this policy',
                                    style: normalTextStyle(
                                        textColor: color.tertiary))
                              ])
                        ]),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("2. Information we collect",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 15.h,
                  ),
                  const terms(
                    'Personal Information: When you create an account, we collect personal information such as your name, email address, and profile picture.',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Usage Data: We collect information about how you use the Service, including your activity on the app, preferences, and interactions with other users.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Device Information: We collect information about the device you use to access the Service, including hardware model, operating system, and IP address.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("3. How we use your information",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms('We use the information we collect to:'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2('Provide, maintain, and improve our Service.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Communicate with you about your account, activities, or updates to our Service.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Protect our users, investigate fraudulent activity, and enforce our Terms of Use.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Send you inspirational content, newsletters, and promotional materials (you may opt out of these communications at any time).'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("4. Sharing your information",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  terms('We may share your information with:'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Service Providers: Third-party vendors who help us operate the Service (e.g., hosting, analytics).'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Legal Authorities: To comply with legal obligations or respond to lawful requests.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms2(
                      'Other Users: Limited information (such as your name and profile picture) may be visible to other users when you interact with them on the Service.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("5. Data Security",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'We implement reasonable security measures to protect your personal information from unauthorized access, disclosure, or misuse. However, no method of transmission over the Internet or electronic storage is 100% secure and we cannot guarantee absolute security.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("6. Monitoring and Enforcement",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'We may monitor your activities on the Service to ensure compliance with our Terms of Use. We reserve the right to remove any content that violates these terms or our policies, and to take appropriate action, including suspending or terminating your account if necessary'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("7. Your Rights",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Access and Update: You can access and update your personal information within the app settings.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Delete Account: Simply navigate to the "Settings" page and select the "Delete Account" option. You will be prompted to confirm your decision. You may also provide a reason for deleting your account, which is entirely optional. Upon confirming the deletion, your account and all associated data will be permanently removed from our system, and you will no longer have access to the app’s features and content'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("8. Third Party Links",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Our Service may contain links to third-party websites or services that are not owned or controlled by us. We are not responsible for the privacy practices of such third parties.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("9. Changes to this Privacy Policy",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on the Service. Your continued use of the Service after any changes indicates your acceptance of the updated policy.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("10. Contact Information",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'If you have any questions about these privacy Policy, please contact us at itestified.com'),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}
