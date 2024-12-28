import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/terms.dart';
import 'package:provider/provider.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  static const routeName = '/terms-of-use';

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
          appbar2(
            "Terms of Use",
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
                      fontWeight: FontWeight.w500,
                      color: color.onTertiary,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 15.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Welcome to ",
                        style: normalTextStyle(textColor: color.tertiary),
                        children: [
                          TextSpan(
                              text: 'iTestified!.',
                              style: normalTextStyle(
                                  fontWeight: FontWeight.w600,
                                  textColor: color.onTertiary),
                              children: [
                                TextSpan(
                                    text:
                                        ' These Terms of Use govern your access to and use of our mobile application. By accessing or using iTestified, you agree to comply with these Terms. Please read them carefully.',
                                    style: normalTextStyle(
                                        textColor: color.tertiary))
                              ])
                        ]),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget(
                    "2. Use of the service",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const terms(
                    'Eligibility: You must be at least 15 years old to use the iTestified app. By using the Service, you represent that you meet this age requirement.',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const terms(
                      'User Account: To access certain Service features, you may be required to register for an account. You agree to provide accurate, current, and complete information during the registration process and to keep your account information up-to-date'),
                  SizedBox(
                    height: 15.h,
                  ),
                  const terms(
                      'Responsibility for Content: You are responsible for any content (such as testimonies, comments, or other user-generated content) you post or share on the Service. You agree not to:'),
                  SizedBox(
                    height: 5.h,
                  ),
                  const terms(
                      'Post content that is false, defamatory, obscene, hateful, offensive, or violent.'),
                  const terms(
                      'Post content that promotes illegal activities or involves commercial activities, such as sales or advertising'),
                  const terms('Impersonate another person or entity.'),
                  const terms(
                      'Disrupt or interfere with the security or use of the Service.'),
                  const terms(
                      'Use the Service for any unauthorized commercial purpose'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget(
                    "3. Testimony Submissions and Content Guidelines",
                    color: color.onTertiary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'By submitting a testimony through the platform, you agree that your submission will be subject to review and approval by our team. We reserve the right to reject or remove any testimony that contains offensive, foul, or vulgar language, or any content that we deem inappropriate, harmful, or not in line with our community standards. Testimonies that do not comply with these guidelines will not be published or made available to the public.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget(
                    "4. Account Security",
                    color: color.onTertiary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Security of Your Account: You are responsible for maintaining the confidentiality of your account information, including your password, and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Our Responsibility: While we take reasonable measures to protect your information, we cannot guarantee absolute security. You agree that we will not be liable for any loss or damage arising from your failure to comply with these security obligations'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget(
                    "5. Content and intellectual property",
                    color: color.onTertiary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'User Content: By posting content on iTestified, you grant us a non-exclusive, royalty-free, worldwide license to use, display, reproduce, and distribute your content within the app'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Our Content: All other content provided by iTestified, including text, graphics, logos, images, and designs, is the property of iTestified or its licensors and is protected by copyright, trademark, and other intellectual property laws. You agree not to use, reproduce, or distribute our content without our prior written permission.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Trademarks: The iTestified logo and design elements are trademarks of iTestified. You may not use our trademarks in any manner without our prior written consent'),
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
                      'We reserve the right to monitor user content on the Service and to remove or refuse to upload any content that we find, in our sole discretion, violates these Terms, is inappropriate, or opposes the values of iTestified. We may also terminate or suspend your account if you violate these Terms or engage in any conduct we deem unacceptable.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget(
                    "7. Termination",
                    color: color.onTertiary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'We reserve the right to terminate or suspend your access to the Service at our discretion, without notice, if you violate these Terms or for any other reason deemed appropriate by us.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("8. Disclaimer",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'The Service is provided "as is" without warranties of any kind. We do not guarantee that the Service will be error-free, or uninterrupted.'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'Limitation of Liability: To the fullest extent permitted by law, iTestified and its affiliates, employees, or agents will not be liable for any direct, indirect, incidental, special, or consequential damages, arising from or in connection with your use or inability to use the Service.'),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget("9. Changes to these terms",
                      color: color.onTertiary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  const terms(
                      'We may modify these Terms from time to time. If we make changes, we will provide notice by posting the updated Terms on the Service. Your continued use of the Service after any changes signifies your acceptance of the new Terms.'),
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
                      'If you have any questions about these Terms, please contact us at itestified.com')
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
