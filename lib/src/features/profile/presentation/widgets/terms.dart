import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';

Widget terms(String useText) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 5, right: 10),
        width: 3,
        height: 3,
        color: AppColors.textColor,
      ),
      Expanded(
        child: Text(
          useText,
          style: normalTextStyle(
            textColor: AppColors.textColor,
          ),
        ),
      ),
    ],
  );
}

Widget terms2(String useText) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 10.w,
      ),
      Container(
        margin: const EdgeInsets.only(top: 5, right: 10),
        width: 3,
        height: 3,
        color: AppColors.textColor,
      ),
      Expanded(
        child: Text(
          useText,
          style: normalTextStyle(
            textColor: AppColors.textColor,
          ),
        ),
      ),
    ],
  );
}
