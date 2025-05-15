import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class likeOrShare extends StatelessWidget {
  likeOrShare(this.icon, this.text,
      {super.key, this.containerColor, this.width = 3});
  Color? containerColor;
  final double width;
  final  icon;
  String text;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    containerColor =
        containerColor ?? themeProvider.themeData.colorScheme.surface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: containerColor),
      child: Row(
        children: [
          Icon(icon,color: themeProvider.themeData.colorScheme.onTertiary,size: 16,),
          SizedBox(
            width: width,
          ),
          textWidget(
            text,
            fontSize: 15,color: themeProvider.themeData.colorScheme.onTertiary,
          )
        ],
      ),
    );
  }
}

// Widget likeOrShare(String icon, String text,
//     {Color containerColor = Colors.black, double width = 3}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10), color: containerColor),
//     child: Row(
//       children: [
//         Image.asset(
//           icon,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(
//           width: width.w,
//         ),
//         textWidget(text, fontSize: 15)
//       ],
//     ),
//   );
// }
