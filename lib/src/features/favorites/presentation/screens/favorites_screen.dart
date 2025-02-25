import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/utils/app_const/app_strings.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/clear_favorites_drpdown.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

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
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: themeProvider.themeData.colorScheme.background,
          title: textWidget(
            "Favorites",
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
          actions: [
            Container(
                //  width: 150,
                color: themeProvider.themeData.colorScheme.background,
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
        backgroundColor: themeProvider.themeData.colorScheme.background,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;
            return FadeInTransitionWidget(
              child: SafeArea(
                  child: isLargeScreen
                      ? largeScreenGrid2(
                          context,
                          const [
                            videoTestimoniesContainer2(

                                //videoContainerHeight: 350,
                                videoContainerWidth: double.infinity,
                                fix: BoxFit.cover,
                                imageHeight: 140),
                            TextTestimonyContainer(),
                            SizedBox(
                              height: 5,
                            ),
                            quoteContainer(
                              imageWidth: double.infinity,
                              containerHeight: 160,
                            ),
                          ],
                        )
                      : smallScreenListView2(
                          const [
                            videoTestimoniesContainer2(
                                videoContainerHeight: 280,
                                videoContainerWidth: double.infinity,
                                itestifyIconTopPosition: 205,
                                fix: BoxFit.cover,
                                imageHeight: 205),
                            TextTestimonyContainer(),
                            SizedBox(
                              height: 15,
                            ),
                            quoteContainer(
                              imageWidth: double.infinity,
                              containerHeight: 160,
                            ),
                          ],
                        )

                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 15.w),
                  //   child: Column(
                  //     children: [
                  //       // favorite video container

                  //       Expanded(
                  //           child:

                  //           ListView(

                  //         children:

                  //         const [
                  //            videoTestimoniesContainer2(
                  //               videoContainerHeight: 280,
                  //               videoContainerWidth: double.infinity,
                  //               itestifyIconTopPosition: 205,
                  //               fix: BoxFit.cover,
                  //               imageHeight: 205),
                  //            TextTestimonyContainer(),
                  //            SizedBox(
                  //             height: 15,
                  //           ),
                  //            quoteContainer(
                  //             imageWidth: double.infinity,
                  //             containerHeight: 160,
                  //           ),
                  //         ],
                  //       ))

                  //     ],
                  //   ),
                  // ),

                  ),
            );
          },
        ));
  }
}
