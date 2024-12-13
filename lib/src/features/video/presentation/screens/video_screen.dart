import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/icon_and_text.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/home/widget/recent_testimonies_container.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:itestified/src/features/video/presentation/widgets/related_video_container.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_container.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  static const routeName = 'video-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          // video and text element
          videoContainer(context, () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return videoDetailsModal();
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
                    containerColor: AppColors.lightBlack),
                SizedBox(
                  width: 15.w,
                ),
                likeOrShare(AppIcons.shareIcon, "Share",
                    containerColor: AppColors.lightBlack),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
          // app logo
          Container(
            margin: EdgeInsets.only(left: 15.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                AppIcons.appLogoDarkIcon,
                scale: 2.5,
              ),
            ),
          ),
          lineWidget(width: double.infinity, color: AppColors.opaqueBlack),

          SizedBox(
            height: 5.h,
          ),
          // comments section

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: const BoxDecoration(
              color: AppColors.lightBlack,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    textWidget("Comments", fontSize: 12.sp),
                    textWidget("(12)",
                        fontSize: 12.sp, color: AppColors.textColor)
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
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Container(
                                          //  height: 70.h,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.h),
                                          color: AppColors.backgroundColor,
                                          //  height: 50,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: textWidget('Comments',
                                                color: AppColors.white,
                                                fontSize: 20.sp),
                                          )),
                                      SizedBox(
                                          height: 400.h,
                                          child: commentListModal(context)),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: SizedBox(
                          width: 250.w,
                          child: Text(
                            "Our God is indeed a good God, he knows all and ... see more",
                            textAlign: TextAlign.left,
                            style: normalTextStyle(textColor: AppColors.white),
                          ),
                        ),
                      ),
                      textWidget("2 days Ago",
                          fontSize: 12.sp, color: AppColors.textColor)
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
                child: textWidget("Related Video", fontSize: 16.sp)),
          ),
          SizedBox(height: 10.h),
          Container(
              height: 250.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return relatedVideoContainer();
                  }))
        ],
      ),
    );
  }
}
