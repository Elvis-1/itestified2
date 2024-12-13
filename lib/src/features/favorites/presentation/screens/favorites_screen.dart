import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/app_bar.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/icon_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/popupmenu_btn.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/favorites/presentation/screens/no_favorite_screen.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/favorite_video_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool vidoes = true;
  bool text = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),

            // app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                textWidget("Favorites", fontSize: 25.sp),
                popUpMenuBtn(context,
                    PopupMenuItem(child: Text('Clear all favorites')), 1),
              ],
            ),

            // video and text row
            // Container(
            //   decoration: BoxDecoration(
            //       border:
            //           Border(bottom: BorderSide(color: AppColors.opaqueBlack))),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               vidoes = true;
            //               text = false;
            //             });
            //           },
            //           child: iconAndText(
            //               "Videos",
            //               AppIcons.videoIcon,
            //               vidoes == true
            //                   ? AppColors.primaryColor
            //                   : AppColors.backgroundColor)),
            //       GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               vidoes = false;
            //               text = true;
            //             });
            //           },
            //           child: iconAndText(
            //               "Text",
            //               AppIcons.textIcon,
            //               text == true
            //                   ? AppColors.primaryColor
            //                   : AppColors.backgroundColor))
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 10.h,
            ),
            // favorite video container

            Expanded(
                child: ListView(
              padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
              children: [
                videoTestimoniesContainer(context),
                Container(
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: textTestimonyContainer()),
                SizedBox(
                  height: 15.h,
                ),
                quoteContainer(context, imageWidth: double.infinity),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
