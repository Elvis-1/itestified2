import 'package:flutter/material.dart';
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
          backgroundColor: themeProvider.themeData.colorScheme.surface,
          title: textWidget(
            "Favorites",
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
          actions: [
            Container(
                //  width: 150,
                color: themeProvider.themeData.colorScheme.surface,
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
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;
            return FadeInTransitionWidget(
              child: SafeArea(
                  child: isLargeScreen
                      ? largeScreenGrid2(
                          context,
                          [
                            videoTestimoniesContainer2(
                                firstTextSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontSize,
                                secondTextSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.fontSize,
                                //videoContainerHeight: 350,
                                videoContainerWidth: double.infinity,
                                fix: BoxFit.cover,
                                imageHeight: 140),
                            const TextTestimonyContainer(),
                            const SizedBox(
                              height: 5,
                            ),
                            const quoteContainer(
                            
                            ),
                          ],
                        )
                      : smallScreenListView2(
                          [
                            videoTestimoniesContainer2(
                                firstTextSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontSize,
                                secondTextSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.fontSize,
                                videoContainerHeight: 280,
                                videoContainerWidth: double.infinity,
                                itestifyIconTopPosition: 205,
                                fix: BoxFit.cover,
                                imageHeight: 205),
                            const TextTestimonyContainer(),
                            const SizedBox(
                              height: 15,
                            ),
                            const quoteContainer(
                         
                            ),
                          ],
                        )),
            );
          },
        ));
  }
}
