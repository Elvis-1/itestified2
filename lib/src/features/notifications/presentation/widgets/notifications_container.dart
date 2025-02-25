import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class notificationsContainer extends StatelessWidget {
  const notificationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(AppIcons.userIcon),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: textWidget(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "Uchechukwu Uzoachi opopoi kjjj",
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: textWidget(
                    "Liked your post",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          textWidget(
            "45m Ago",
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            color: themeProvider.themeData.colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}
// Widget notificationsContainer() {
//   return Container(
//     margin: EdgeInsets.only(bottom: 20.h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.asset(AppIcons.userIcon),
//             SizedBox(
//               width: 15.w,
//             ),
//             textWidget(
//               "Uchechukwu Uzoachi",
//               fontSize: 14,
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             textWidget(
//               "Liked your post",
//               fontSize: 14,
//             ),
//           ],
//         ),
//         textWidget("45m Ago", fontSize: 17.sp, color:,)
//       ],
//     ),
//   );


// }
