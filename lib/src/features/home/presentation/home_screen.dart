import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
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
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        actions: [
          Row(
            children: [
              // search and notificatins
              GestureDetector(
                  onTap: () {
                    gotoSearchPage();
                  },
                  child: CircleAvatar(
                      radius: 22,
                      backgroundColor: themeProvider
                          .themeData.searchBarTheme.backgroundColor!
                          .resolve({}),
                      child: Icon(
                        size: 20,
                        Icons.search,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                      ))),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    gotoNotificationsPage();
                  },
                  child: CircleAvatar(
                      radius: 22,
                      backgroundColor: themeProvider
                          .themeData.searchBarTheme.backgroundColor!
                          .resolve({}),
                      child: Icon(
                        size: 20,
                        Icons.notifications_outlined,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                      ))),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
        leadingWidth: 180,
        leading: Container(
          margin: const EdgeInsets.only(left: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppIcons.userIcon),
              const SizedBox(
                width: 3,
              ),
              textWidget(
                "Welcome, Amaka",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: themeProvider.themeData.colorScheme.onTertiary,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 800; // Tablet & desktop

            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 50 : 15, vertical: 5),
              child: ListView(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Scripture of the day',
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    color: themeProvider.themeData.colorScheme.onTertiary,
                  ),
                  const SizedBox(height: 10),

                  // **Scripture of the day container**
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: textWidget(
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                "Jeremiah",
                                fontSize: 18,
                                color: AppColors.white,
                              ),
                            ),
                            Expanded(
                              child: textWidget(
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                'KJV',
                                fontSize: 12,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        textWidget(
                          "\"For I know the thoughts that I think towards you, saith the Lord, thoughts of peace and not of evil, to give you an expected end\"",
                          fontSize: 15,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                        ),
                        const SizedBox(height: 15),
                        textWidget(
                          textAlign: TextAlign.left,
                          "Prayers: Lord guide me according to your will and plan",
                          fontSize: 14,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // **Main Content**
                  sectionHeader("Video Testimonies", () {
                    Navigator.pushNamed(context, VideoListScreen.routeName);
                  }),

                  const SizedBox(height: 10),
                  SizedBox(child: VideoTestimoniesCarousel()),
                  // const SizedBox(height: 10),

                  sectionHeader("Written Testimonies", () {
                    Navigator.of(context)
                        .pushNamed(WrittenTestimonies.routeName);
                  }),

                  const SizedBox(height: 10),
                  SizedBox(
                      height: 230,
                      child: horizontalList(const FadeInTransitionWidget(
                          child: TextTestimonyContainer()))),

                  const SizedBox(height: 10),
                  sectionHeader("Inspirational Quotes", () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FadeInTransitionWidget(
                              child: InspirationalQuotes())),
                    );
                  }),

                  const SizedBox(height: 10),
                  SizedBox(
                      height: 230,
                      child: horizontalList(const FadeInTransitionWidget(
                          child: quoteContainer()))),

                  // Expanded(
                  //   child: isLargeScreen
                  //       ? Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Expanded(child: buildLeftColumn(context)),
                  //             const SizedBox(width: 20),
                  //             // Expanded(child: buildRightColumn(context)),
                  //           ],
                  //         )
                  //       :
                  //       buildMainList(context), // Default vertical layout
                  // )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget sectionHeader(String title, VoidCallback onTap) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget(
          title,
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
          fontWeight: FontWeight.w600,
          color: themeProvider.themeData.colorScheme.onTertiary,
        ),
        GestureDetector(
          onTap: onTap,
          child: textWidget(
            "See all",
            fontWeight: FontWeight.w600,
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
            color: AppColors.darkPurple,
          ),
        ),
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
