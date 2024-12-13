import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';

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

Widget videoTestimoniesContainer2(BuildContext context,
    {double videoContainerHeight = 100,
    double videoContainerWidth = 300,
    double imageHeight = 100,
    double playArrowLeftPosition = 180,
    double playArrowTopPosition = 80,
    double itestifyIconLeftPosition = 5,
    double itestifyIconTopPosition = 185,
    BoxFit fix = BoxFit.fill}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, VideoScreen.routeName);
    },
    child: Container(
      height: videoContainerHeight.h,
      width: videoContainerWidth.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Stack(
        //  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Spacer(),
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
                // SizedBox(
                //   height: 20.h,
                // ),

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

          Positioned(
            left: playArrowLeftPosition.w,
            top: playArrowTopPosition.h,
            child: const Icon(
              Icons.play_arrow,
              color: AppColors.white,
            ),
          ),
          // itestify pic and text

          Positioned(
              top: itestifyIconTopPosition.h,
              left: itestifyIconLeftPosition.w,
              child: Row(
                children: [
                  Image.asset(
                    AppIcons.itestifyIcon,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget("Prophetic Prayers for open doors",
                          fontSize: 14.sp),
                      textWidget("Redeemed Christian Church of God",
                          fontSize: 10.sp, color: AppColors.textColor),
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
              ))
        ],
      ),
    ),
  );
}
