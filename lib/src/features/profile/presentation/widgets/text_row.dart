import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

class TextRow extends StatelessWidget {
  TextRow(
      {super.key,
      required this.title,
      required this.value,
      this.isAccNumber = false});

  final String title;
  final String value;
  bool isAccNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(title,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 13),
          // Spacer(),
          Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  textWidget(value, color: AppColors.textColor, fontSize: 15),
                  if (isAccNumber)
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.copy,
                        size: 15,
                      ),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
