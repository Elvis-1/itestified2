import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_setting_dropdown.dart';
import 'package:provider/provider.dart';

class videoContainer extends StatelessWidget {
  const videoContainer({super.key, this.unpressed});
  final void Function()? unpressed;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // video container
            Container(
              height: 260.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(AppImages.recentTestimonyImage),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                            //  size: 25,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.opaqueBlack,
                            child: Image.asset(
                              width: 12,
                              AppIcons.favoriteIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const VideoSettingsDropdown()
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                    size: 40,
                  ),
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
                          color: AppColors.textColor,
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

            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  textWidget(
                    "Prophetic Prayers for open doors",
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      textWidget(
                        "Child Birth ",
                        fontSize: 12.sp,
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
                        width: 10.w,
                      ),
                      textWidget(" 504 Views ", fontSize: 12.sp),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      textWidget("14/4/2024", fontSize: 12.sp),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: unpressed,
                        child: textWidget("See Details",
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

// Widget videoContainer(BuildContext context, void Function() unpressed) {
//   return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // video container
//           Container(
//             height: 260.h,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 //  borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     image: AssetImage(AppImages.recentTestimonyImage),
//                     fit: BoxFit.cover)),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.w),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Icon(
//                           Icons.arrow_back_ios_new,
//                           color: AppColors.white,
//                           //  size: 25,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 15,
//                           backgroundColor: AppColors.opaqueBlack,
//                           child: Image.asset(
//                             width: 12,
//                             AppIcons.favoriteIcon,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         const VideoSettingsDropdown()
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 const Icon(
//                   Icons.play_arrow,
//                   color: AppColors.white,
//                   size: 40,
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

//           Container(
//             margin: EdgeInsets.only(left: 15.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 textWidget("Prophetic Prayers for open doors",
//                     fontSize: 19.sp, color: AppColors.white),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Row(
//                   children: [
//                     textWidget("Child Birth ",
//                         fontSize: 12.sp, color: AppColors.textColor),
//                     SizedBox(
//                       width: 5.w,
//                     ),
//                     Container(
//                       height: 5,
//                       width: 5,
//                       color: AppColors.textColor,
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     textWidget(" 504 Views ",
//                         fontSize: 12.sp, color: AppColors.textColor),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Container(
//                       height: 5,
//                       width: 5,
//                       color: AppColors.textColor,
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     textWidget("14/4/2024",
//                         fontSize: 12.sp, color: AppColors.textColor),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Container(
//                       height: 5,
//                       width: 5,
//                       color: AppColors.textColor,
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     GestureDetector(
//                       onTap: unpressed,
//                       child: textWidget("See Details",
//                           fontSize: 12.sp, color: AppColors.primaryColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ));


// }
