import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class quoteContainer extends StatelessWidget {
  const quoteContainer(
      {super.key,
      this.rightPadding = 15,
      this.imageWidth = 270,
      this.containerHeight = 170,
      this.textSize = 12,
      this.inbetweenHeight = 1});
  final double rightPadding;
  final double imageWidth;
  final double containerHeight;
  final double inbetweenHeight;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
        margin: EdgeInsets.only(right: rightPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // quotes container
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AnimatedQuotesModal();
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                height: containerHeight.h,
                width: imageWidth.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    image: DecorationImage(
                        image: AssetImage(AppImages.quotesImage),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                //AppColors.opaqueBlack,
                                themeProvider
                                    .themeData.searchBarTheme.backgroundColor!
                                    .resolve({}),
                            child: Icon(
                              size: 15,
                              Icons.favorite_outline,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: inbetweenHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  "Source: Redeemed Christian Church of God",
                  fontSize: textSize.sp,
                ),
              ],
            ),
          ],
        ));
  }
}

// Widget quoteContainer(BuildContext context,
//     {double rightPadding = 15,
//     double imageWidth = 270,
//     double containerHeight = 170,
//     double inbetweenHeight = 1,
//     double textSize = 12}) {
//   return Container(
//       margin: EdgeInsets.only(right: rightPadding.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // quotes container
//           GestureDetector(
//             onTap: () async {
//               await showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return AnimatedQuotesModal();
//                   });
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//               height: containerHeight.h,
//               width: imageWidth.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.w),
//                   image: DecorationImage(
//                       image: AssetImage(AppImages.quotesImage),
//                       fit: BoxFit.cover)),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       const Spacer(),
//                       CircleAvatar(
//                         backgroundColor: AppColors.transparent,
//                         radius: 10,
//                         child: Image.asset(
//                           color: AppColors.primaryColor,
//                           //  width: 12,
//                           AppIcons.favoriteIcon,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: inbetweenHeight,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               textWidget("Source: Redeemed Christian Church of God",
//                   fontSize: textSize.sp, color: AppColors.textColor),
//             ],
//           ),
//         ],
//       ));


// }
