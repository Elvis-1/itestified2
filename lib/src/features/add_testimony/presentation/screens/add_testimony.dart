import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/app_bar.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dropdown_btn.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/testimony_posted_successfully.dart';

class AddTestimonyScreen extends StatelessWidget {
  const AddTestimonyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:
      // AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColors.backgroundColor,
      //   title: textWidget("Add Testimony", fontSize: 25.sp),
      // ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),

              appbar2("Add Testimony", context),
              SizedBox(
                height: 40.h,
              ),
              textWidget("Title", fontSize: 19.sp),
              SizedBox(
                height: 10.h,
              ),

              Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightBlack,
                      border: Border.all(color: AppColors.transparent)),
                  child: customTextField(context,
                      borderColor: AppColors.lightBlack,
                      hintText: "Enter your title")),
              SizedBox(
                height: 20.h,
              ),
              textWidget("Category", fontSize: 19.sp),
              SizedBox(
                height: 10.h,
              ),
              // dropdown
              Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.lightBlack,
                      border: Border.all(color: AppColors.transparent)),
                  width: double.infinity,
                  child: const DropdownBTN()),

              SizedBox(
                height: 20.h,
              ),
              textWidget("Description", fontSize: 19.sp),
              SizedBox(
                height: 10.h,
              ),
              multilineTextField(),

              SizedBox(
                height: 150.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const TestimonyPostedSuccessfully();
                  }));
                },
                child: btnAndText(
                    verticalPadding: 15.h,
                    text: "Post",
                    fontSize: 19,
                    containerWidth: double.infinity),
              )
            ],
          ),
        ),
      ),
    );
  }
}
