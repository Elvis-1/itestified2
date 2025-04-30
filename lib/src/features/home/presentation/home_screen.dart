import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/home/widget/genaral_appbar.dart';
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
      appBar: generalAppBar2(
        context,
      ),
      backgroundColor: themeProvider.themeData.colorScheme.background,
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
                    child: TextWidgets.textWidget14(
                        context, 'Scripture of the day',
                        fontWeight: FontWeight.w600),
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
                              child: TextWidgets.textWidget16(
                                  context, 'Jeremiah',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.left),
                            ),
                            Expanded(
                              child: TextWidgets.textWidget10(
                                context,
                                'KJV',
                                textAlign: TextAlign.right,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextWidgets.textWidget12(
                            textAlign: TextAlign.left,
                            context,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            '\"For I know the thoughts that I think towards you, saith the Lord, thoughts of peace and not of evil, to give you an expected end\"'),
                        const SizedBox(height: 5),
                        TextWidgets.textWidget12(
                          textAlign: TextAlign.left,
                          context,
                          "Prayers: Lord guide me according to your will and plan ",
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
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

                  SizedBox(
                      height: 190,
                      child: horizontalList(const FadeInTransitionWidget(
                          child: TextTestimonyContainer()))),

                  const SizedBox(height: 5),
                  sectionHeader("Inspirational Quotes", () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FadeInTransitionWidget(
                              child: InspirationalQuotes())),
                    );
                  }),

                  const SizedBox(height: 10),
                  SizedBox(
                      height: 190,
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
        TextWidgets.textWidget14(context, title, fontWeight: FontWeight.w600),
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
