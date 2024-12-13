import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';

Widget radioBox(
    String mode, bool status, void Function(bool? change)? changeTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textWidget(
        mode,
        fontSize: 14.sp,
      ),
      Checkbox(value: status, onChanged: changeTheme),
      Radio(value: status, groupValue: 'display', onChanged: (value) {})
    ],
  );
}
