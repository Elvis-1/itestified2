
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../app_theme/theme_viewmodel.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  static const routeName = '/delete-account';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: generalAppbar("Delete Account", context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                child: ListView(
                  children: [
                    textWidget(
                      'Are you sure you want to delete your account?',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600, 
                    ),
                    const SizedBox(height: 8),
                    textWidget(
                      'This action cannot be undone, and you will lose all your data and settings associated with your account.',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                    ),
                    const SizedBox(height: 20),
                    textWidget(
                      'Reason for deleting account (Optional)',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600, 
                      color: themeData.colorScheme.onSurface,
                    ),
                    const SizedBox(height: 8),
                    textWidget(
                      'Please let us know the reason why you have decided to delete your account so that we can continue to improve our service.',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      color: themeData.colorScheme.onSurface,
                    ),
                    const SizedBox(height: 20),
                    const MultilineTextField(hintText: 'Type here ..'),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              height: 50,
              child: btnAndText(
                borderColor: AppColors.transparent,
                text: 'Delete account',
                containerWidth: double.infinity,
                
                containerColor: AppColors.redColor,
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    
    
      // floatingActionButton:
    
      // Container(
      //     alignment: Alignment.bottomCenter,
      //     margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),
    
      //     //   padding: EdgeInsets.only(bottom: ),
      //     height: 50,
      //     child: btnAndText(
      //         borderColor: AppColors.transparent,
      //         text: 'Delete account',
      //         containerWidth: double.infinity,
      //         containerColor: AppColors.redColor)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
