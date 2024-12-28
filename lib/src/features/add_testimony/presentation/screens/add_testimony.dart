import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dropdown_btn.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/testimony_posted_successfully.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class AddTestimonyScreen extends StatelessWidget {
  const AddTestimonyScreen({super.key, required this.action});

  static const routeName = '/add-testimony-screen';
  final TestimonyAction action;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),

              appbar2(
                action == TestimonyAction.Edit
                    ? "Update Testimony"
                    : "Add Testimony",
              ),
              SizedBox(
                height: 40.h,
              ),
              textWidget(
                "Title",
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10.h,
              ),

              Container(
                  decoration: BoxDecoration(
                      // color: AppColors.lightBlack,
                      //  border: Border.all(color: AppColors.transparent)
                      ),
                  child: customTextField(
                      borderColor: AppColors.lightBlack,
                      hintText: "Enter your title")),
              SizedBox(
                height: 20.h,
              ),
              textWidget(
                "Category",
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10.h,
              ),
              // dropdown
              Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: themeProvider.themeData.colorScheme.onBackground,
                    // border: Border.all(color: AppColors.lightBlack)
                  ),
                  width: double.infinity,
                  child: const DropdownBTN()),

              SizedBox(
                height: 20.h,
              ),
              textWidget(
                "Description",
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10.h,
              ),
              multilineTextField(),

              SizedBox(
                height: 150.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const TestimonyPostedSuccessfully();
          }));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
          height: 60.h,
          child: btnAndText(
              verticalPadding: 15.h,
              text: action == TestimonyAction.Edit ? "Save changes" : "Post",
              fontSize: 19,
              containerWidth: double.infinity),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
