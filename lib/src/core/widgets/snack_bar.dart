import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

customSnackbar(String text, BuildContext context) {
  showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
          iconPositionLeft: 10,
          backgroundColor: AppColors.backgroundColor,
          icon: const CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          message: text));
}

ratingSnackbar(String text, BuildContext context) {
  showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
          iconPositionLeft: 10,
          backgroundColor: AppColors.backgroundColor,
          icon: const CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          message: text));
}
