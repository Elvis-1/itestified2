import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget followRow(String icon, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(icon),
            const SizedBox(
              width: 10,
            ),
            textWidget(
              "@iTestified",
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            )
          ],
        ),
        const Icon(
          Icons.chevron_right_outlined,
          // color: AppColors.textC,
          size: 30,
        )
      ],
    ),
  );
}
