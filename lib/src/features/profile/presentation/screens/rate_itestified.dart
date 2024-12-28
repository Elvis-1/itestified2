import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/snack_bar.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class RateItestified extends StatelessWidget {
  const RateItestified({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const appbar2(
                "Rate iTestified",
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Tap the stars below to rate your experience with iTesfied",
                textAlign: TextAlign.center,
                style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 17),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      5,
                      (index) => Image.asset(
                            width: 50,
                            // scale: 0.5,
                            AppIcons.ratingIcon,
                            color: AppColors.primaryColor,
                            fit: BoxFit.cover,
                          ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: textWidget("Review(optional)", fontSize: 17.sp)),
              SizedBox(
                height: 10.h,
              ),
              multilineTextField(hintText: "Enter your review here ..."),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),

          //   padding: EdgeInsets.only(bottom: ),
          height: 50,
          child: GestureDetector(
            onTap: () async {
              await showRateSubmittedDialogOverlay(context, "Messsssss");
            },
            child: btnAndText(
              borderColor: AppColors.transparent,
              text: 'Submit',
              containerWidth: double.infinity,
              // containerColor: AppColors.redColor
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
