import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';
import 'package:provider/provider.dart';

class videoTestimoniesContainer extends StatelessWidget {
  videoTestimoniesContainer(
      {super.key,
      this.videoContainerHeight = 100,
      this.videoContainerWidth = 300,
      this.imageHeight = 100,
      this.fix = BoxFit.cover});
  final double videoContainerHeight;
  double videoContainerWidth = 300;
  double imageHeight = 100;
  final BoxFit fix;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, VideoScreen.routeName);
      },
      child: Container(
        height: videoContainerHeight.h,
        width: videoContainerWidth.w,
        //   margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // video container
            Container(
              height: 170, // imageHeight,
              //  width: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(AppImages.recentTestimonyImage),
                      fit: fix)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.opaqueBlack,
                          child: Image.asset(
                            width: 12,
                            AppIcons.favoriteIcon,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: videoContainerHeight / 2,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                    ),
                  ),

                  // SizedBox(
                  //   height: 40.h,
                  // ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(2.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.blackColor),
                        child: textWidget(
                          "09:30",
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),

            // itestify pic and text

            Row(
              children: [
                Image.asset(
                  AppIcons.itestifyIcon,
                  width: 30,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      "Prophetic Prayers for open doors",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    textWidget(
                      "Redeemed Christian Church of God",
                      fontSize: 13.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        textWidget(
                          "Child Birth ",
                          fontSize: 10.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          color: themeProvider.themeData.colorScheme.tertiary,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        textWidget(" 504 Views ",
                            fontSize: 10.sp,
                            color:
                                themeProvider.themeData.colorScheme.tertiary),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          color: themeProvider.themeData.colorScheme.tertiary,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        textWidget("14/4/2024",
                            fontSize: 10.sp,
                            color:
                                themeProvider.themeData.colorScheme.tertiary),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class videoTestimoniesContainer2 extends StatelessWidget {
  const videoTestimoniesContainer2({
    super.key,
    this.videoContainerHeight = 100,
    this.videoContainerWidth = 300,
    this.playArrowLeftPosition = 180,
    this.playArrowTopPosition = 80,
    this.itestifyIconTopPosition = 185,
    this.itestifyIconLeftPosition = 5,
    this.fix = BoxFit.fill,
    this.imageHeight = 100,
    this.firstTextSize = 12,
    this.secondTextSize = 10,
  });

  final double videoContainerHeight;
  final double videoContainerWidth;
  final double imageHeight;
  final double playArrowLeftPosition;
  final double playArrowTopPosition;
  final double itestifyIconLeftPosition;
  final double itestifyIconTopPosition;
  final BoxFit fix;
  final double? firstTextSize;
  final double? secondTextSize;

  // double fontSize = MediaQuery.textScalerOf(context).scale(10.0);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, VideoScreen.routeName, arguments: 1);
      },
      child: Container(
        height: videoContainerHeight,
        width: videoContainerWidth,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Video container
                Container(
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(AppImages.recentTestimonyImage),
                      fit: fix,
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  right: 5,
                  child: Row(
                    children: [
                      //  const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(top: 10, right: 8),
                          child: CircleAvatar(
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
                              ))),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 1,
                  right: 5,
                  child: Row(
                    children: [
                      // const Spacer(),
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.blackColor,
                          ),
                          child: Text(
                            "09:30",
                            style:
                                normalTextStyle(textColor: AppColors.textColor),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //  Play arrow icon
                const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                  ),
                ),
                // itestify icon and text
              ],
            ),
            Row(
              children: [
                Image.asset(AppIcons.itestifyIcon, width: 20),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget2(
                        color: themeProvider.themeData.colorScheme.onTertiary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Prophetic Prayer for open doors",
                        fontSize: firstTextSize,
                        //firstTextSize,
                        lineHeight: 13.62 / 10,
                        //Theme.of(context).textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w600, // Removed `.sp`
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      textWidget2(
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Redeemed Christian Church of God",
                        lineHeight: 10.89 / 8,
                        fontSize: secondTextSize,
                        // Theme.of(context).textTheme.titleSmall?.fontSize,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          textWidget2(
                            "Child Birth ",
                            fontWeight: FontWeight.w400,
                            fontSize: secondTextSize,
                            lineHeight: 10.89 / 8,
                            // Theme.of(context)
                            //     .textTheme
                            //     .labelSmall
                            //     ?.fontSize,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 5),
                          textWidget2(
                            " 504 Views ",
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                            lineHeight: 10.89 / 8,
                            // fontSize: Theme.of(context)
                            //     .textTheme
                            //     .labelSmall
                            //     ?.fontSize,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 5),
                          textWidget2(
                            "14/4/2024",
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                            lineHeight: 10.89 / 8,
                            // fontSize: Theme.of(context)
                            //     .textTheme
                            //     .labelSmall
                            //     ?.fontSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// Widget videoTestimoniesContainer2(BuildContext context,
//     {double videoContainerHeight = 100,
//     double videoContainerWidth = 300,
//     double imageHeight = 100,
//     double playArrowLeftPosition = 180,
//     double playArrowTopPosition = 80,
//     double itestifyIconLeftPosition = 5,
//     double itestifyIconTopPosition = 185,
//     BoxFit fix = BoxFit.fill}) {
//   return InkWell(
//     onTap: () {
//       Navigator.pushNamed(context, VideoScreen.routeName);
//     },
//     child: Container(
//       height: videoContainerHeight.h,
//       width: videoContainerWidth.w,
//       margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//       child: Stack(
//         //  crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // video container
//           Container(
//             height: imageHeight,
//             //  width: 270,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 image: DecorationImage(
//                     image: AssetImage(AppImages.recentTestimonyImage),
//                     fit: fix)),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Container(
//                       margin: const EdgeInsets.only(top: 10, right: 8),
//                       color: AppColors.opaqueBlack2,
//                       child: CircleAvatar(
//                           radius: 12.sp,
//                           backgroundColor: AppColors.greyColor,
//                           child: Icon(size: 15.sp, Icons.favorite_outline)),
//                     )
//                   ],
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Container(
//                       padding: EdgeInsets.all(2.sp),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           color: AppColors.blackColor),
//                       child: textWidget(
//                         "09:30",
//                         fontSize: 12,
//                         color,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.h,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//               ],
//             ),
//           ),

//           Positioned(
//             left: playArrowLeftPosition.w,
//             top: playArrowTopPosition.h,
//             child: const Icon(
//               Icons.play_arrow,
//               color: AppColors.white,
//             ),
//           ),
//           // itestify pic and text

//           Positioned(
//               top: itestifyIconTopPosition.h,
//               left: itestifyIconLeftPosition.w,
//               child: Row(
//                 children: [
//                   Image.asset(
//                     AppIcons.itestifyIcon,
//                     width: 30.w,
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       textWidget(
//                         "Prophetic Prayers for open doors",
//                         fontSize: 14.sp,
//                       ),
//                       textWidget("Redeemed Christian Church of God",
//                           fontSize: 10.sp, color: AppColors.textColor),
//                       Row(
//                         children: [
//                           textWidget("Child Birth ",
//                               fontSize: 8.sp, color: AppColors.textColor),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Container(
//                             height: 5,
//                             width: 5,
//                             color: AppColors.textColor,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           textWidget(" 504 Views ",
//                               fontSize: 8.sp, color: AppColors.textColor),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Container(
//                             height: 5,
//                             width: 5,
//                             color: AppColors.textColor,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           textWidget("14/4/2024",
//                               fontSize: 8.sp, color: AppColors.textColor),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ))
//         ],
//       ),
//     ),
//   );

// }
