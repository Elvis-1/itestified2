import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class appbar2 extends StatelessWidget {
  const appbar2(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                AppIcons.backIcon,
                color: themeProvider.themeData.colorScheme.onTertiary,
              )),
          textWidget(title,
              fontSize: 25.sp,
              color: themeProvider.themeData.colorScheme.onTertiary),
          Container()
        ],
      ),
    );
    ;
  }
}
