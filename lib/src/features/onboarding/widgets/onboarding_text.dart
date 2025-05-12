import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';

Widget onboardingText(BuildContext context, String text) {
  return Text(
    text,
    maxLines:
        5, //'Witness real life stories of healing, breakthrough, divine intervention and \n many more',
    textAlign: TextAlign.center,
    style: normalTextStyle(
      textColor: AppColors.white,
      fontSize: 16,
    ),
  );
}
