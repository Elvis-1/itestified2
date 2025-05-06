import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget btnAndText({
  double containerWidth = 200,
  double horizontalPadding = 10,
  double verticalPadding = 5,
  Color containerColor = AppColors.btnColor,
  String text = 'Next',
  Color borderColor = AppColors.btnColor,
  Color textColor = AppColors.white,
  double? fontSize = 17,
  Widget container = const SizedBox.shrink(),
  bool isLoading = false, 
}) {
  return Container(
    width: containerWidth,
    padding: EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(5),
      color: containerColor,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
       
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            container,
            if (isLoading) 
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey50,
            ),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 1.5,
              backgroundColor: Colors.transparent,
              strokeCap: StrokeCap.round,
            ),
          ),
          const SizedBox(width: 4,),
            textWidget(
              text,
              color: textColor,
              fontSize: fontSize,
            ),
          ],
        ),

        
      ],
    ),
  );
}

Widget btnAndText2({
  double containerWidth = 200,
  double horizontalPadding = 10,
  double verticalPadding = 5,
  Color containerColor = AppColors.btnColor,
  String text = 'Next',
  Color borderColor = AppColors.btnColor,
  Color textColor = AppColors.white,
  double fontSize = 17,
  Widget container = const SizedBox.shrink(),
}) {
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
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        container,
        textWidget(
          text,
          color: textColor,
          fontSize: fontSize,
        ),
        Container(),
      ],
    )),
  );
}