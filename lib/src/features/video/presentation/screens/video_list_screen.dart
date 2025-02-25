import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  static const routeName = '/video-list-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return Scaffold(
      appBar: generalAppbar('Video Testimonies', context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SafeArea(child: LayoutBuilder(
        builder: (context, contraints) {
          bool isLargeScreen = contraints.maxWidth > 600;
          return isLargeScreen
              ? largeScreenGrid(
                  context,
                  FadeInTransitionWidget(
                    child: videoTestimoniesContainer2(
                        videoContainerHeight: 270,
                        videoContainerWidth: 400,
                        imageHeight: contraints.maxWidth < 800 ? 120 : 220),
                  ))
              : smallScreenListView(const FadeInTransitionWidget(
                  child: videoTestimoniesContainer2(
                      videoContainerHeight: 270,
                      videoContainerWidth: 400,
                      fix: BoxFit.cover,
                      imageHeight: 200),
                ));
        },
      )),
    );
  }
}
