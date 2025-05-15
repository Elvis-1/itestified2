import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/shared/widgets/read_more.dart';
import 'package:provider/provider.dart';

class myTestimonyContainer extends StatelessWidget {
  const myTestimonyContainer({super.key});

  @override
  Widget build(BuildContext context) {
        var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: themeProvider.themeData.colorScheme.outline,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: textWidget(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "Jesus Changed my Genotype",
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
              Flexible(
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.pendingColor)),
                  child: Center(
                    child: Text(
                      'Pending',
                      style: normalTextStyle(textColor: AppColors.pendingColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          RichText(
              text: TextSpan(
                  text: addReadMoreToText(
                      'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in'),
                  style: normalTextStyle(
                      textColor: themeProvider.themeData.colorScheme.tertiary),
                  children: [
                TextSpan(
                    text: ' ... See more',
                    style: normalTextStyle(textColor: AppColors.primaryColor)),
              ])),
          const SizedBox(
            height: 10,
          ),
          // image and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(AppIcons.userIcon),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Chika Amaka",
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: textWidget(
                                  "Healing ppp ooooo mmmm hhhhh",
                                  fontSize: 10,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 5,
                                width: 5,
                                color: themeProvider
                                    .themeData.colorScheme.tertiary,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: textWidget(
                                  "30 minutes ago",
                                  fontSize: 10,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const EditDeleteShareModal(),
                  );
                },
                icon: const Icon(Icons.more_horiz_sharp),
              ),
            ],
          ),

          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

// Widget myTestimonyContainer(BuildContext context) {
  
  
//   return Container(
//     padding: const EdgeInsets.all(10),
//     margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//     decoration: BoxDecoration(
//         color: AppColors.opaqueBlack2, borderRadius: BorderRadius.circular(10)),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             textWidget("Jesus Changed my Genotype", fontSize: 15.sp),
//             Container(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: AppColors.pendingColor)),
//               child: Text(
//                 'Pending',
//                 style: normalTextStyle(textColor: AppColors.pendingColor),
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 10.h,
//         ),

//         RichText(
//             text: TextSpan(
//                 text:
//                     'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in',
//                 style: normalTextStyle(textColor: AppColors.textColor),
//                 children: [
//               TextSpan(
//                   text: ' ... See more',
//                   style: normalTextStyle(textColor: AppColors.primaryColor)),
//             ])),
//         SizedBox(
//           height: 10.h,
//         ),
//         // image and text
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Image.asset(AppIcons.userIcon),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     textWidget("Chika Amaka", fontSize: 13),
//                     Row(
//                       children: [
//                         textWidget("Healing ",
//                             fontSize: 10.sp, color: AppColors.textColor),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         Container(
//                           height: 5,
//                           width: 5,
//                           color: AppColors.textColor,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         textWidget(" 30 minutes ago",
//                             fontSize: 10.sp, color: AppColors.textColor),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             IconButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return editDeleteShareModal(context);
//                       });
//                 },
//                 icon: const Icon(Icons.more_horiz_sharp)),
//           ],
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//       ],
//     ),
//   );


// }
