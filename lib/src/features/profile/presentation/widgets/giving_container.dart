import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/text_row.dart';
import 'package:provider/provider.dart';

class givingContainer extends StatelessWidget {
  givingContainer(this.widgets, {super.key, this.title = ''});
  List<TextRow> widgets;
  String title;
  List<TextRow> rows = [];
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    for (int i = 0; i < widgets.length; i++) {
      // Check if there's a second widget in the current pair
      if (widgets[i].title.toLowerCase() == 'account number') {
        widgets[i].isAccNumber = true;
      }
      rows.add(widgets[i]);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: themeProvider.themeData.searchBarTheme.backgroundColor!
              .resolve({}),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(title, fontSize: 18),
            ],
          ),
          const SizedBox(height: 10),
          lineWidget(width: double.infinity, color: AppColors.darkPurple),
          Column(children: rows),
        ],
      ),
    );
  }
}

// Widget givingContainer(List<TextRow> widgets, {String title = ''}) {
//   List<TextRow> rows = [];
//   for (int i = 0; i < widgets.length; i++) {
//     // Check if there's a second widget in the current pair
//     if (widgets[i].title.toLowerCase() == 'account number') {
//       widgets[i].isAccNumber = true;
//     }
//     rows.add(widgets[i]);
//   }

//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
//     margin: const EdgeInsets.only(bottom: 10),
//     decoration: BoxDecoration(
//         color: AppColors.lightBlack,
//         borderRadius: BorderRadius.circular(10.sp)),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             textWidget(title, fontSize: 18, color: AppColors.textColor),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         lineWidget(width: double.infinity, color: AppColors.darkPurple),
//         Column(children: rows),
//       ],
//     ),
//   );
// }
