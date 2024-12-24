import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  static const routeName = '/video-list-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2(
              'Video Testimonies',
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
                    itemBuilder: (context, index) {
                      return videoTestimoniesContainer2(
                          videoContainerHeight: 230,
                          videoContainerWidth: 400,
                          imageHeight: 200);
                    }))
          ],
        ),
      ),
    );
  }
}
