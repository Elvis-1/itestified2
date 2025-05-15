import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';

import 'package:provider/provider.dart';

Widget mainList(BuildContext context) {
  return Column(
    children: [relatedVideosSection(context)],
  );
}
Widget relatedVideosSection(BuildContext context) {
  final themeProvider = Provider.of<ThemeViewmodel>(context);
  final screenWidth = MediaQuery.of(context).size.width;
  final isSmallScreen = screenWidth < 375;
  final isMediumScreen = screenWidth < 600;

  final relatedVideos = List.generate(4, (index) => {'id': index + 1});

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: isSmallScreen ? 12 : 15, bottom: 4),
        child: textWidget(
          "Related Videos",
          fontSize: isSmallScreen ? 16 : 18,
          color: themeProvider.themeData.colorScheme.onTertiary,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: isMediumScreen ? 210 : 230,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: relatedVideos.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: isSmallScreen ? 12 : 15),
          itemBuilder: (context, index) {
            return Container(
              width: isMediumScreen ? screenWidth * 0.58 : screenWidth * 0.4,
              margin: const EdgeInsets.only(right: 10),
              child: FadeInTransitionWidget(
                child: VideoTestimonyContainer1(
                  videoId: relatedVideos[index]['id'] as int, 
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}