import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget notificationsContainer() {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppIcons.userIcon),
            SizedBox(
              width: 15.w,
            ),
            textWidget(
              "Uchechukwu Uzoachi",
              fontSize: 14,
            ),
            SizedBox(
              width: 5.w,
            ),
            textWidget("Liked your post",
                fontSize: 14, color: AppColors.textColor),
          ],
        ),
        textWidget("45m Ago", fontSize: 17.sp, color: AppColors.opaqueBlack)
      ],
    ),
  );
}
