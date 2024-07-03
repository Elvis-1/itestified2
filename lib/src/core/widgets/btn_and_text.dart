import 'package:flutter/cupertino.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget btnAndText(
    {double containerWidth = 200,
    double horizontalPadding = 10,
    double verticalPadding = 5,
    Color containerColor = AppColors.btnColor,
    String text = 'Next',
    Color borderColor = AppColors.btnColor,
    Color textColor = AppColors.white}) {
  return Container(
    width: containerWidth,
    // height: 50,
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(5),
      color: containerColor,
    ),
    child: Center(
        child: textWidget(
      text,
      color: textColor,
      fontSize: 17,
    )),
  );
}
