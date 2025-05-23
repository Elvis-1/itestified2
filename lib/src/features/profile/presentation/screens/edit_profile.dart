import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: generalAppbar("Edit Profile", context),
      //   backgroundColor: AppColors.backgroundColor,
      backgroundColor: themeProvider.themeData.scaffoldBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 2,
                          right: 130,
                          child: CircleAvatar(
                            radius: 50,
                            child: Image.asset(
                              width: 100,
                              AppIcons.userIcon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 75,
                            right: 130,
                            child: Image.asset(AppIcons.camIcon)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Full Name",
                        fontSize: 18,
                        color: themeProvider.themeData.colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      prefixIc: Icon(
                        Icons.person_outline,
                      ),
                      borderColor: AppColors.lightBlack),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Email Address",
                        fontSize: 18,
                        color: themeProvider.themeData.colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      prefixIc: Icon(
                        Icons.email_outlined,
                      ),
                      borderColor: AppColors.lightBlack),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: textWidget("Phone Number",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: themeProvider.themeData.colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      prefixIc: const Icon(
                        Icons.phone_outlined,
                      ),
                      borderColor: AppColors.lightBlack),
                  const SizedBox(
                    height: 200,
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Align(
                  //       alignment: Alignment.center,
                  //       child: btnAndText(
                  //           fontSize: 18.sp,
                  //           verticalPadding: 12.h,
                  //           containerWidth: double.infinity,
                  //           text: "Save Changes")),
                  // )
                ],
              ),
            )
          ],
        ),
      ),

      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),

          //   padding: EdgeInsets.only(bottom: ),
          height: 50,
          child: btnAndText(
            borderColor: AppColors.transparent,
            text: 'Save Changes',
            containerWidth: double.infinity,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
