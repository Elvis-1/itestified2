import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/read_more.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_container.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.heroIndex});
  final int heroIndex;

  static const routeName = 'video-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 800; // Tablet & desktop
            return ListView(
              children: [
                // video and text element
                videoContainer(
                    videoContainerWidth: double.infinity,
                    videoContainerHeight: 200,
                    imageHeight: 280,
                    onpressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const videoDetailsModal();
                          });
                    }),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      likeOrShare(AppIcons.likeIcon2, "30",
                          containerColor:
                              themeProvider.themeData.colorScheme.onBackground),
                      const SizedBox(
                        width: 15,
                      ),
                      likeOrShare(AppIcons.shareIcon, "Share",
                          containerColor:
                              themeProvider.themeData.colorScheme.onBackground),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                lineWidget(
                    width: double.infinity,
                    color: themeProvider.themeData.colorScheme.outline),
                // app logo
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          AppIcons.itestifyIcon,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 5),
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

                const SizedBox(
                  height: 5,
                ),
                commentSection(context),
                const SizedBox(
                  height: 15,
                ),
                isLargeScreen
                    ? SizedBox(
                        height: 600,
                        child: largeScreenGrid(
                          context,
                          const videoTestimoniesContainer2(
                              videoContainerHeight: 250,
                              fix: BoxFit.fill,
                              imageHeight: 180,
                              playArrowLeftPosition: 130,
                              playArrowTopPosition: 50,
                              itestifyIconTopPosition: 150),
                        ),
                      )
                    : mainList(context)
              ],
            );
          },
        ));
  }
}

Widget mainList(BuildContext context) {
  return Column(
    children: [relatedVideosSection(context)],
  );
}

Widget relatedVideosSection(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Column(
    children: [
      // related videos
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Align(
            alignment: Alignment.topLeft,
            child: textWidget(
              "Related Videos",
              fontSize: 18,
              color: themeProvider.themeData.colorScheme.onTertiary,
              fontWeight: FontWeight.w500,
            )),
      ),
      const SizedBox(height: 10),
      SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const FadeInTransitionWidget(
                    child: videoTestimoniesContainer2(
                        fix: BoxFit.cover,
                        imageHeight: 150,
                        playArrowLeftPosition: 130,
                        playArrowTopPosition: 50,
                        itestifyIconTopPosition: 150),
                  ),
                );
              }))
    ],
  );
}

Widget commentSection(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: themeProvider.themeData.colorScheme.onBackground,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            textWidget(
              "Comments",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            textWidget(
              "(12)",
              fontSize: 12,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          // width: 500,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppIcons.userIcon),
              const SizedBox(
                width: 10,
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
                                    color: themeProvider
                                        .themeData.colorScheme.background,
                                    borderRadius: BorderRadius.circular(20)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),

                                //  height: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: textWidget('Comments',
                                      fontWeight: FontWeight.w600,
                                      color: themeProvider
                                          .themeData.colorScheme.onTertiary,
                                      fontSize: 20),
                                )),
                            const SizedBox(
                                height: 400, child: commentListModal()),
                          ],
                        );
                      });
                },
                child: SizedBox(
                    width: 250,
                    child: RichText(
                        text: TextSpan(
                            text: addReadMoreToText(
                                'Our God is indeed good to me Our God is indeed good to me ',
                                50),
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
                fontSize: 12,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

// Widget largeScreenGrid2(BuildContext context, Widget child,
//     {int gridNumber = 2,
//     ScrollPhysics physics = const BouncingScrollPhysics()}) {
//   return SizedBox(
//     height: (15 / gridNumber).ceil() * 220,
//     // Ensures the grid has space to scroll
//     child: GridView.builder(
//       physics: physics,
//       shrinkWrap: true, // Takes only needed space without conflicts
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: gridNumber, // Columns on large screens
//         crossAxisSpacing: 10, // Optional: Spacing between items
//         mainAxisSpacing: 10, // Optional: Spacing between rows
//         childAspectRatio: 1.5, // Adjusts item width/height ratio
//       ),
//       itemCount: 15, // Number of items
//       itemBuilder: (context, i) => child,
//     ),
//   );
// }
