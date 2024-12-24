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

Widget videoTestimoniesContainer(BuildContext context,
    {double videoContainerHeight = 100,
    double videoContainerWidth = 300,
    double imageHeight = 100,
    BoxFit fix = BoxFit.fill}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, VideoScreen.routeName);
    },
    child: Container(
      height: videoContainerHeight.h,
      width: videoContainerWidth.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // video container
          Container(
            height: imageHeight,
            //  width: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(AppImages.recentTestimonyImage),
                    fit: fix)),
            child: Column(
              children: [
                Row(
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
                  height: 20.h,
                ),
                Center(
                  child: const Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                  ),
                ),

                // SizedBox(
                //   height: 40.h,
                // ),
                Spacer(),
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
                  textWidget("Prophetic Prayers for open doors",
                      fontSize: 12.sp),
                  textWidget("Redeemed Christian Church of God",
                      fontSize: 11.sp, color: AppColors.textColor),
                  Row(
                    children: [
                      textWidget("Child Birth ",
                          fontSize: 8.sp, color: AppColors.textColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      textWidget(" 504 Views ",
                          fontSize: 8.sp, color: AppColors.textColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      textWidget("14/4/2024",
                          fontSize: 8.sp, color: AppColors.textColor),
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
  });

  final double videoContainerHeight;
  final double videoContainerWidth;
  final double imageHeight;
  final double playArrowLeftPosition;
  final double playArrowTopPosition;
  final double itestifyIconLeftPosition;
  final double itestifyIconTopPosition;
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
        margin: EdgeInsets.symmetric(
            horizontal: 10.w, vertical: 5.w), // Adjust for ScreenUtil
        child: Stack(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 8),
                        color: AppColors.opaqueBlack2,
                        child: const CircleAvatar(
                          radius: 12, // Removed `.sp`
                          backgroundColor: AppColors.greyColor,
                          child: Icon(
                            size: 15, // Removed `.sp`
                            Icons.favorite_outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            // Play arrow icon
            Positioned(
              left: playArrowLeftPosition.w,
              top: playArrowTopPosition.h,
              child: const Icon(
                Icons.play_arrow,
                color: AppColors.white,
              ),
            ),
            // itestify icon and text
            Positioned(
              top: itestifyIconTopPosition.h,
              left: itestifyIconLeftPosition.w,
              child: Row(
                children: [
                  Image.asset(
                    AppIcons.itestifyIcon,
                    width: 30, // Removed `.w`
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        "Prophetic Prayers for open doors",
                        fontSize: 14,
                        fontWeight: FontWeight.w600, // Removed `.sp`
                      ),
                      textWidget(
                        "Redeemed Christian Church of God",
                        fontSize: 10, // Removed `.sp`
                      ),
                      Row(
                        children: [
                          textWidget(
                            "Child Birth ",
                            fontSize: 8.sp,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 5),
                          textWidget(
                            " 504 Views ",
                            fontSize: 8, // Removed `.sp`
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 5),
                          textWidget(
                            "14/4/2024",
                            fontSize: 8, // Removed `.sp`
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
