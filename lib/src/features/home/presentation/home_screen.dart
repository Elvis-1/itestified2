import 'package:flutter/material.dart';
import 'package:itestified/src/config/authprovider.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/home/widget/video_testimoies_carousal.dart';
import 'package:itestified/src/features/inspirational_qoutes.dart/presentation/screens/inspirational_quotes.dart';
import 'package:itestified/src/features/notifications/presentation/screens/no_notifications_screen.dart';
import 'package:itestified/src/features/search/presentation/screens/search_screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_list_screen.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/written_testimonies.dart';
import 'package:provider/provider.dart';

import '../../video/presentation/screens/video_screen.dart';

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

// Handles tap on video testimony, showing community dialog for guests
  void _handleVideoTestimonyTap(BuildContext context, {int? videoId}) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isGuest) {
      showJoinOurCommunityDialogOverlay(context, "Join Our Community");
    } else {
      Navigator.pushNamed(context, VideoScreen.routeName, arguments: videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    final isGuest = authProvider.isGuest;

    return Scaffold(
      appBar: generalAppBar2(
        context,
      ),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 800; // Tablet & desktop

            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 50 : 24, vertical: 5),
              child: ListView(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidgets.textWidget16(
                        context, 'Scripture of the day',
                        fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 20),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 600;
                      final isVerySmallScreen = constraints.maxWidth < 400;

                      return Container(
                        height: isVerySmallScreen
                            ? 160
                            : isSmallScreen
                                ? 150
                                : 136,
                        padding: EdgeInsets.symmetric(
                          horizontal: isVerySmallScreen ? 8 : 10,
                          vertical: isVerySmallScreen ? 8 : 10,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImages.scriptureImage),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.darkPurple,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: TextWidgets.textWidget16(
                                    context,
                                    'Jeremiah 29:11',
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(width: isVerySmallScreen ? 4 : 8),
                                TextWidgets.textWidget10(
                                  context,
                                  'KJV',
                                  textAlign: TextAlign.right,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Expanded(
                              child: SingleChildScrollView(
                                child: TextWidgets.textWidget12(
                                  context,
                                  '\"For I know the thoughts that I think towards you, saith the Lord, thoughts of peace and not of evil, to give you an expected end\"',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            TextWidgets.textWidget12(
                              context,
                              "Prayers: Lord guide me according to your will and plan",
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),

                  // **Main Content**
                  sectionHeader("Trending Video testimonies", () {
                    Navigator.pushNamed(context, VideoListScreen.routeName);
                  }),

                  const SizedBox(height: 10),
                  VideoTestimoniesCarousel(),
// const SizedBox(height: 10),
                  // const SizedBox(height: 10),

                  sectionHeader("Trending Text testimonies", () {
                    Navigator.of(context)
                        .pushNamed(WrittenTestimonies.routeName);
                  }),
                  const SizedBox(height: 15),
                  SizedBox(
                      height: 149,
                      child: horizontalList(const FadeInTransitionWidget(
                          child: TextTestimonyContainer()))),

                  const SizedBox(height: 15),
                  sectionHeader("Inspirational Quotes", () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FadeInTransitionWidget(
                              child: InspirationalQuotes())),
                    );
                  }),

                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      child: horizontalList(const FadeInTransitionWidget(
                          child: quoteContainer()))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget sectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextWidgets.textWidget14(context, title,
              fontWeight: FontWeight.w600),
        ),
        GestureDetector(
            onTap: onTap,
            child: TextWidgets.textWidget12(
              context,
              "See all",
            )),
      ],
    );
  }

  Widget buildLeftColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader("Video Testimonies", () {
          Navigator.pushNamed(context, VideoListScreen.routeName);
        }),
        const SizedBox(height: 10),
        SizedBox(height: 230, child: VideoTestimoniesCarousel()),
      ],
    );
  }

  Widget horizontalList(Widget child) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, i) => child,
    );
  }
}
