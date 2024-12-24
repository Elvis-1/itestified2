import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_strings.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/popupmenu_btn.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/clear_favorites_drpdown.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Widget> clearFav = <Widget>[Text(AppStrings.CLEAR_FAVORITES)];

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
                Container(
                    //  width: 150,
                    color: AppColors.backgroundColor,
                    child: ClearFavoritesDropDown<Widget>(
                      options: clearFav,
                    )
                    // popUpMenuBtn(
                    //     context,
                    //     PopupMenuItem(
                    //         height: 10,
                    //         child: Container(
                    //           width: double.infinity,
                    //           color: AppColors.backgroundColor,
                    //           child: Text(
                    //             'Clear all favorites',
                    //             style: normalTextStyle(),
                    //           ),
                    //         )),
                    //     1),
                    ),
              ],
            ),

            SizedBox(
              height: 10.h,
            ),
            // favorite video container

            Expanded(
                child: ListView(
              padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 1),
              children: [
                const videoTestimoniesContainer2(
                    videoContainerHeight: 230,
                    videoContainerWidth: double.infinity,
                    fix: BoxFit.cover,
                    imageHeight: 200),
                const TextTestimonyContainer(),
                SizedBox(
                  height: 15.h,
                ),
                const quoteContainer(imageWidth: double.infinity),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
