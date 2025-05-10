import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget iconAndText(
    String text, Icon icon, Color bottomBorderColor, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: bottomBorderColor))),
    child: Row(
      children: [
        icon,
        const SizedBox(width: 8),
        textWidget(
          text,
          fontWeight: FontWeight.w400,
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        ),
      ],
    ),
  );
}