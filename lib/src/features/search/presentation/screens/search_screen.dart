import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2("Search", context),
            SizedBox(
              height: 50.h,
            ),
            customTextField(context,
                prefixIc: const Icon(Icons.search), hintText: "Search"),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("Recent Searches", fontSize: 18.sp),
                textWidget("Clear all",
                    fontSize: 15.sp, color: AppColors.darkPurple)
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.opaqueBlack,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                textWidget("Healing Testimonies",
                                    fontSize: 14, color: AppColors.opaqueBlack),
                              ],
                            ),
                            textWidget("x",
                                fontSize: 17.sp, color: AppColors.opaqueBlack)
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
