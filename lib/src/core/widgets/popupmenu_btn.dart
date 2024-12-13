import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';

Widget popUpMenuBtn(
    BuildContext context, PopupMenuItem<int> items, int length) {
  return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: AppColors.white,
      ),
      color: AppColors.white,
      onSelected: (int selectedValue) {
        print(selectedValue);
      },
      itemBuilder: (_) {
        return [...List.generate(length, (index) => items)];
      });
}
