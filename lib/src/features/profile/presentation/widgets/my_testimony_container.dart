import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget myTestimonyContainer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: AppColors.opaqueBlack2, borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget("Jesus Changed my Genotype", fontSize: 15.sp),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.pendingColor)),
              child: Text(
                'Pending',
                style: normalTextStyle(textColor: AppColors.pendingColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),

        RichText(
            text: TextSpan(
                text:
                    'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in',
                style: normalTextStyle(textColor: AppColors.textColor),
                children: [
              TextSpan(
                  text: ' ... See more',
                  style: normalTextStyle(textColor: AppColors.primaryColor)),
            ])),
        SizedBox(
          height: 10.h,
        ),
        // image and text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppIcons.userIcon),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget("Chika Amaka", fontSize: 13),
                    Row(
                      children: [
                        textWidget("Healing ",
                            fontSize: 10.sp, color: AppColors.textColor),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          color: AppColors.textColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        textWidget(" 30 minutes ago",
                            fontSize: 10.sp, color: AppColors.textColor),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return editDeleteShareModal(context);
                      });
                },
                icon: const Icon(Icons.more_horiz_sharp)),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    ),
  );
}
