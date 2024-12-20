import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  static const routeName = '/delete-account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2(
            "Delete Account",
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                textWidget(
                  'Are you sure you want to delete your account?',
                  fontSize: 15.sp,
                ),
                textWidget(
                    'This action cannot be undone, and you will lose all your data and settings associated with your account.',
                    fontSize: 15.sp,
                    color: AppColors.textColor),
                SizedBox(
                  height: 20.h,
                ),
                textWidget(
                  'Reason for deleting account (Optional)',
                  fontSize: 15.sp,
                ),
                textWidget(
                    'Please let us know the reason why you have decided to delete you account so that we can continue to improve our service.',
                    fontSize: 15.sp,
                    color: AppColors.textColor),
                SizedBox(
                  height: 20.h,
                ),
                multilineTextField(hintText: 'Type here ..'),
              ],
            ),
          ))
        ],
      ),
      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(horizontal: 20.w),

          //   padding: EdgeInsets.only(bottom: ),
          height: 50,
          child: btnAndText(
              borderColor: AppColors.transparent,
              text: 'Delete account',
              containerWidth: double.infinity,
              containerColor: AppColors.redColor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
