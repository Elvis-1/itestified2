import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class iconAndTextRow extends StatelessWidget {
  iconAndTextRow(this.prefixIcon, this.title, this.suffixIcon, {super.key});
  String prefixIcon;
  String title;
  String suffixIcon;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(prefixIcon,
                  color: themeProvider.themeData.colorScheme.onTertiary),
              SizedBox(
                width: 15.w,
              ),
              textWidget(
                title,
                fontSize: 17,
              ),
            ],
          ),
          Image.asset(
            suffixIcon,
            color: themeProvider.themeData.colorScheme.onTertiary,
          ),
        ],
      ),
    );
  }
}

// Widget iconAndTextRow(String prefixIcon, String title, String suffixIcon) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 15.h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.asset(prefixIcon),
//             SizedBox(
//               width: 15.w,
//             ),
//             textWidget(
//               title,
//               fontSize: 17,
//             ),
//           ],
//         ),
//         Image.asset(suffixIcon),
//       ],
//     ),
//   );
// }
