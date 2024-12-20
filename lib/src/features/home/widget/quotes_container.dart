import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget quoteContainer(BuildContext context,
    {double rightPadding = 15,
    double imageWidth = 270,
    double containerHeight = 170,
    double inbetweenHeight = 1,
    double textSize = 12}) {
  return Container(
      margin: EdgeInsets.only(right: rightPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // quotes container
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AnimatedQuotesModal();
                  });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
              height: containerHeight.h,
              width: imageWidth.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  image: DecorationImage(
                      image: AssetImage(AppImages.quotesImage),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: AppColors.transparent,
                        radius: 10,
                        child: Image.asset(
                          color: AppColors.primaryColor,
                          //  width: 12,
                          AppIcons.favoriteIcon,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: inbetweenHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("Source: Redeemed Christian Church of God",
                  fontSize: textSize.sp, color: AppColors.textColor),
            ],
          ),
        ],
      ));
}
