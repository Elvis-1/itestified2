import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/icon_and_text.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';
import 'package:provider/provider.dart';

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
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
        appBar: generalAppbar('Healing Testimonies', context),
        backgroundColor: themeProvider.themeData.colorScheme.background,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;
            return FadeInTransitionWidget(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.opaqueBlack))),
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
                                  : themeProvider
                                      .themeData.colorScheme.background,
                              context),
                        ),
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
                                    : themeProvider
                                        .themeData.colorScheme.background,
                                context))
                      ],
                    ),
                  ),

                  isLargeScreen
                      ? Expanded(
                          child: largeScreenGrid(
                            context,
                            vidoes == true
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const VideoScreen(heroIndex: 1);
                                      }));
                                    },
                                    child: const videoTestimoniesContainer2(
                                      // videoContainerHeight: 300,
                                      fix: BoxFit.fill,
                                      imageHeight: 120,
                                    ),
                                  )
                                : const TextTestimonyContainer(
                                    containerWidth: double.infinity),
                          ),
                        )
                      : Expanded(
                          child: smallScreenListView(
                            vidoes == true
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const VideoScreen(
                                          heroIndex: 1,
                                        );
                                      }));
                                    },
                                    child: const videoTestimoniesContainer2(
                                      videoContainerHeight: 270,
                                      videoContainerWidth: 400,
                                      imageHeight: 200,
                                      itestifyIconTopPosition: 205,
                                    ))
                                : const TextTestimonyContainer(
                                    containerWidth: double.infinity),
                          ),
                        )

                  // Expanded(
                  //   child: ListView.builder(
                  //       padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
                  //       itemCount: 10,
                  //       physics: const BouncingScrollPhysics(),
                  //       itemBuilder: (context, index) {
                  //         return Column(
                  //           children: [
                  //             vidoes == true
                  //                 ?

                  //                 GestureDetector(
                  //                     onTap: () {
                  //                       Navigator.of(context).push(
                  //                           MaterialPageRoute(builder: (context) {
                  //                         return const VideoScreen();
                  //                       }));
                  //                     },
                  //                     child: const videoTestimoniesContainer2(
                  //                       videoContainerHeight: 270,
                  //                       videoContainerWidth: 400,
                  //                       imageHeight: 200,
                  //                       itestifyIconTopPosition: 205,
                  //                     ))
                  //                 : const TextTestimonyContainer(
                  //                     containerWidth: double.infinity),
                  //           ],
                  //         );
                  //       }),
                  // )
                ],
              ),
            );
          },
        ));
  }
}
