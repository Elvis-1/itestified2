import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/number_text_field.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/auth/presentation/screens/new_password.dart';
import 'package:itestified/src/features/nav/navbar.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  static const routeName = '/otp-screen';
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          title: textWidget('Reset Password')),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 45.h,
              // ),

              textWidget(
                  "We sent a code to chikaamaka3007@gmail.com kindly enter the code below",
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  textAlign: TextAlign.center),
              SizedBox(
                height: 35.h,
              ),

              SizedBox(
                height: 20.h,
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(4, (index) {
                      return numberTextField(
                        containerHeight: 70,
                        containerWidth: 80,
                        controller,
                        focusNode: FocusNode(),
                        onEdit: () {
                          // if (index + 1 < viewModel.controllers.length) {
                          //   FocusScope.of(context)
                          //       .requestFocus(viewModel.focusNodes[index + 1]);
                          // } else {
                          //   viewModel.focusNodes[index].unfocus();
                          // }
                          // viewModel.checkCode();
                        },
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget("Didn't recieve any mail? ", fontSize: 15.sp),
                  GestureDetector(
                    onTap: () {},
                    child: textWidget(
                      "Resend mail",
                      fontSize: 15,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 150.h,
              ),

              // login account btn

              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, NewPasswordScreen.routeName);
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: btnAndText(
                              fontSize: 18,
                              textColor: AppColors.primaryColor,
                              containerColor: AppColors.transparent,
                              verticalPadding: 14.h,
                              containerWidth: double.infinity,
                              text: "Next")),
                    ),
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
