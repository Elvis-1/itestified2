import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_container.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  static const routeName = 'video-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Column(
        children: [
          // video and text element
          videoContainer(unpressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const videoDetailsModal();
                });
          }),
          SizedBox(
            height: 10.h,
          ),

          Container(
            margin: EdgeInsets.only(left: 15.w),
            child: Row(
              children: [
                likeOrShare(AppIcons.likeIcon2, "30",
                    containerColor:
                        themeProvider.themeData.colorScheme.onBackground),
                SizedBox(
                  width: 15.w,
                ),
                likeOrShare(AppIcons.shareIcon, "Share",
                    containerColor:
                        themeProvider.themeData.colorScheme.onBackground),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          // app logo
          Container(
            margin: EdgeInsets.only(left: 15.w),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    AppIcons.itestifyIcon,
                    width: 30, // Removed `.w`
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                textWidget(
                  'iTestified',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),

          SizedBox(
            height: 5.h,
          ),
          // comments section

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeProvider.themeData.colorScheme.onBackground,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    textWidget(
                      "Comments",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ),
                    textWidget(
                      "(12)",
                      fontSize: 12.sp,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 500.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppIcons.userIcon),
                      SizedBox(
                        width: 1.w,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                        //  height: 70.h,
                                        decoration: BoxDecoration(
                                            color: themeProvider.themeData
                                                .colorScheme.background,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 30.h),

                                        //  height: 50,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: textWidget('Comments',
                                              fontWeight: FontWeight.w600,
                                              color: themeProvider.themeData
                                                  .colorScheme.onTertiary,
                                              fontSize: 20.sp),
                                        )),
                                    SizedBox(
                                        height: 400.h,
                                        child: const commentListModal()),
                                  ],
                                );
                              });
                        },
                        child: SizedBox(
                            width: 250.w,
                            child: RichText(
                                text: TextSpan(
                                    text: 'Our God is indeed good to me',
                                    style: normalTextStyle(
                                        textColor: themeProvider
                                            .themeData.colorScheme.tertiary),
                                    children: [
                                  TextSpan(
                                      text: ' ... See more',
                                      style: normalTextStyle(
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.primaryColor)),
                                ]))),
                      ),
                      textWidget(
                        "2 days Ago",
                        fontSize: 12.sp,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          // related videos
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Align(
                alignment: Alignment.topLeft,
                child: textWidget(
                  "Related Videos",
                  fontSize: 18.sp,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                  fontWeight: FontWeight.w500,
                )),
          ),
          SizedBox(height: 10.h),
          Container(
              height: 215.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const videoTestimoniesContainer2(
                        fix: BoxFit.cover,
                        imageHeight: 150,
                        playArrowLeftPosition: 130,
                        playArrowTopPosition: 50,
                        itestifyIconTopPosition: 150);
                  }))
        ],
      ),
    );
  }
}
