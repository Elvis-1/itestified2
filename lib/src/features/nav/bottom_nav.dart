import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';

class BottomNav extends StatelessWidget {
  BottomNav(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.index,
      required this.onTap,
      required this.textColor,
      required this.text});
  String icon = AppIcons.favoriteIcon;
  int index;
  void Function()? onTap;
  Color iconColor;
  Color textColor;
  String text;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 25,
            child: Image.asset(
              icon,
              color: iconColor,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            text,
            style: normalTextStyle(textColor: textColor, fontSize: 13),
          )
        ],
      ),
    );
  }
}
