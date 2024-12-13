import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/icon_and_text.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';

class VideoAndWrittenTestimonieScreen extends StatefulWidget {
  const VideoAndWrittenTestimonieScreen({super.key});
  static const routeName = '/vid-written-testimonies';
  @override
  State<VideoAndWrittenTestimonieScreen> createState() =>
      _VideoAndWrittenTestimonieScreenState();
}

class _VideoAndWrittenTestimonieScreenState
    extends State<VideoAndWrittenTestimonieScreen> {
  bool vidoes = true;
  bool text = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),

            // appbar
            appbar2("Healing Testimonies", context),
            // video and text row
            SizedBox(
              height: 50.h,
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: AppColors.opaqueBlack))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          vidoes = true;
                          text = false;
                        });
                      },
                      child: iconAndText(
                          "Videos",
                          AppIcons.videoIcon,
                          vidoes == true
                              ? AppColors.primaryColor
                              : AppColors.backgroundColor)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          vidoes = false;
                          text = true;
                        });
                      },
                      child: iconAndText(
                          "Text",
                          AppIcons.textIcon,
                          text == true
                              ? AppColors.primaryColor
                              : AppColors.backgroundColor))
                ],
              ),
            ),
            //   lineWidget(width: double.infinity, color: AppColors.opaqueBlack),

            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        //  videoTestimoniesContainer(),
                        vidoes == true
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const VideoScreen();
                                  }));
                                },
                                child: videoTestimoniesContainer2(context,
                                    videoContainerHeight: 230,
                                    videoContainerWidth: 400,
                                    imageHeight: 200))
                            : textTestimonyContainer(),
                        lineWidget(
                            width: double.infinity,
                            color: AppColors.opaqueBlack),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
