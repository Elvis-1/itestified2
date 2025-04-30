import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.themeData.colorScheme.onBackground),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    textWidget2(
                        mainColor:
                            themeProvider.themeData.colorScheme.onTertiary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Healing Testimonies",
                        fontSize:
                            Theme.of(context).textTheme.titleMedium?.fontSize,
                        lineHeight: 21.79 / 16,
                        fontWeight: FontWeight.w600),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        "Watch and read about  God's miraculous power to every illness and restore health. Watch and read about  God's miraculous power to every illness and restore health.",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: normalTextStyle(
                            textColor:
                                themeProvider.themeData.colorScheme.tertiary),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: themeProvider.themeData.colorScheme.onTertiary,
                size: 35,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Widget categoryContainer() {
//   return Container(
//     margin: EdgeInsets.only(bottom: 10.h),
//     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10.sp),
//       color: themeProvider.themeData.searchBarTheme.backgroundColor!
//                 .resolve({})
//     ),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // title
//                 textWidget("Healing Testimonies",
//                     fontSize: 18, fontWeight: FontWeight.w500),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 SizedBox(
//                   width: 300.w,
//                   child: Text(
//                     "Watch and read about  God's miraculous power to every illness and restore health.",
//                     textAlign: TextAlign.left,
//                     maxLines: 2,
//                     softWrap: true,
//                     style: normalTextStyle(textColor: AppColors.textColor),
//                   ),
//                 ),
//               ],
//             ),
//             Icon(
//               Icons.navigate_next,
//               color: Colors.white,
//               size: 35,
//             )
//           ],
//         ),
//       ],
//     ),
//   );

// }
