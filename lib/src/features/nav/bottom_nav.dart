import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.index,
    required this.onTap,
    required this.textColor,
    required this.text,
  });

  final IconData icon; 
  final int index;
  final void Function()? onTap;
  final Color iconColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 25,
            height: 25, 
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          Text(
            text,
            style: normalTextStyle(textColor: textColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}