import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return Scaffold(
      //   backgroundColor: AppColors.backgroundColor,
      backgroundColor: themeProvider.themeData.scaffoldBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const appbar2(
              "Edit Profile",
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 200.h,
                    height: 150.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 2.h,
                          right: 130.w,
                          child: CircleAvatar(
                            radius: 50,
                            child: Image.asset(
                              width: 100.w,
                              AppIcons.userIcon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 75.h,
                            right: 130.w,
                            child: Image.asset(AppIcons.camIcon)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Full Name",
                        fontSize: 16.sp, color: AppColors.textColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customTextField(context,
                      prefixIc: Icon(
                        Icons.person_outline,
                        color: AppColors.opaqueBlack,
                      ),
                      borderColor: AppColors.lightBlack),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Email Address",
                        fontSize: 16.sp, color: AppColors.textColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customTextField(context,
                      prefixIc: Icon(
                        Icons.email_outlined,
                        color: AppColors.opaqueBlack,
                      ),
                      borderColor: AppColors.lightBlack),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Phone Number",
                        fontSize: 16.sp, color: AppColors.textColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customTextField(context,
                      prefixIc: Icon(
                        Icons.phone_outlined,
                        color: AppColors.opaqueBlack,
                      ),
                      borderColor: AppColors.lightBlack),
                  SizedBox(
                    height: 200.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.center,
                        child: btnAndText(
                            fontSize: 18.sp,
                            verticalPadding: 12.h,
                            containerWidth: double.infinity,
                            text: "Save Changes")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
