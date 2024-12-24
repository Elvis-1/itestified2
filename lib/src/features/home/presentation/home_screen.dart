import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/app_bar.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/inspirational_qoutes.dart/presentation/screens/inspirational_quotes.dart';
import 'package:itestified/src/features/notifications/presentation/screens/no_notifications_screen.dart';
import 'package:itestified/src/features/search/presentation/screens/search_screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_list_screen.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/written_testimonies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  gotoSearchPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const SearchScreen();
    }));
  }

  gotoNotificationsPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const NoNotificationsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            // app bar
            CustomAppBar(
              gotoSearchPage: gotoSearchPage,
              gotoNotificationPage: gotoNotificationsPage,
            ),
            SizedBox(
              height: 10.h,
            ),
            textWidget(
              'Scripture of the day',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            SizedBox(
              height: 10.h,
            ),

            // scripture of the day container
            Container(
              height: 120.h,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.scriptureImage)),
                  borderRadius: BorderRadius.circular(15.sp),
                  color: AppColors.darkPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        "Jeremaih",
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                      textWidget(
                        'kjv',
                        fontSize: 10,
                        color: AppColors.textColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 400.w,
                    child: textWidget(
                        "\"For I know the thoughts that I think towards you, saith the Lord, thoughts of peace and not of evil, to give you an expected end\"",
                        fontSize: 14.sp,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  textWidget(
                      textAlign: TextAlign.left,
                      "Prayers: Lord guide me according to your will and plan",
                      fontSize: 14.sp,
                      color: AppColors.textColor)
                ],
              ),
            ),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  // video testimonies

                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          "Video testimonies",
                          fontSize: 18.sp,
                          color: themeProvider.themeData.colorScheme.onTertiary,
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, VideoListScreen.routeName);
                          },
                          child: textWidget("See all",
                              fontSize: 15.sp, color: AppColors.darkPurple),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  // videos
                  SizedBox(
                      height: 195.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return const videoTestimoniesContainer2(
                                playArrowLeftPosition: 150,
                                playArrowTopPosition: 50,
                                itestifyIconLeftPosition: 2,
                                fix: BoxFit.cover,
                                imageHeight: 150,
                                itestifyIconTopPosition: 140);
                          })),

                  // written testimonies

                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          "Written Testimonies",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WrittenTestimonies.routeName);
                          },
                          child: textWidget("See all",
                              fontSize: 15.sp, color: AppColors.darkPurple),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  SizedBox(
                      height: 170.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return const TextTestimonyContainer();
                          })),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          "Inspirational Quotes",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const InspirationalQuotes();
                            }));
                          },
                          child: textWidget("See all",
                              fontSize: 15.sp, color: AppColors.darkPurple),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return const quoteContainer(containerHeight: 120);
                          })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
