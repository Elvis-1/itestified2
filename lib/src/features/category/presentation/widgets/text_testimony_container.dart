import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/favourite_icon.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:provider/provider.dart';

class TextTestimonyContainer extends StatelessWidget {
  const TextTestimonyContainer({
    super.key,
    this.containerWidth = 345.0,
    this.containerHeight = 162.0,
    this.borderRadius = 16.0,
    this.titleFontSize = 14.0,
    this.textFontSize = 12.0,
    this.nameFontSize = 12.0,
    this.categoryFontSize = 8.0,
    this.userIconSize = 30.0,
    this.padding = 12.0,
    this.spacing = 10.0,
    this.isHomeScreen = false,
    this.index,
  });

  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final double titleFontSize;
  final double textFontSize;
  final double nameFontSize;
  final double categoryFontSize;
  final double userIconSize;
  final double padding;
  final double spacing;
  final bool isHomeScreen;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final favoritesViewModel = GetIt.I<FavoritesViewModel>();
    final double screenWidth = MediaQuery.of(context).size.width;

    final testimonyId = index ?? 1;
    final favoritedItem = FavoritedItem(
      id: testimonyId,
      type: 'post',
      title: 'Jesus Changed my Genotype',
      church: 'Redeemed Christian Church of God',
      views: '200',
      date: '07/11/2024',
      imagePath: AppIcons.userIcon,
    );

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyTestimoniesDetailsScreen.routeName);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeScreen = constraints.maxWidth > 800;

          final double scaledWidth = containerWidth;
          final double scaledHeight = containerHeight;
          final double scaledBorderRadius = borderRadius;
          final double actualPadding = padding;
          final double actualSpacing = spacing;
          final double dotSize = isHomeScreen ? 5 : (isLargeScreen ? 6 : 5);
          final double iconSize = isHomeScreen ? 14 : (isLargeScreen ? 16 : 14);

          final double actualTitleFontSize = titleFontSize;
          final double actualTextFontSize = textFontSize;
          final double actualNameFontSize = nameFontSize;
          final double actualCategoryFontSize = categoryFontSize;
          final double actualUserIconSize = userIconSize;

          return Container(
            width: scaledWidth,
            height: scaledHeight,
            padding: EdgeInsets.all(actualPadding),
            decoration: BoxDecoration(
              color: themeProvider.themeData.colorScheme.outline,
              border: Border.all(
                color: themeProvider.themeData.colorScheme.outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(scaledBorderRadius),
            ),
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jesus Changed my Genotype',
                          style: TextStyle(
                            fontSize: actualTitleFontSize,
                            fontWeight: FontWeight.w600,
                            color:
                                themeProvider.themeData.colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    FavoriteIcon(
                      item: favoritedItem,
                      iconSize: iconSize,
                    ),
                  ],
                ),
                Expanded(
                  child: _buildTestimonyText(
                    context,
                    themeProvider,
                    actualTextFontSize,
                  ),
                ),
                SizedBox(height: actualSpacing),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.userIcon,
                      width: actualUserIconSize,
                      height: actualUserIconSize,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: actualSpacing),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chika Amaka',
                            style: TextStyle(
                              fontSize: actualNameFontSize,
                              fontWeight: FontWeight.w600,
                              color:
                                  themeProvider.themeData.colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: actualSpacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  'Healing',
                                  style: TextStyle(
                                    fontSize: actualCategoryFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: actualSpacing * 0.5),
                              Container(
                                height: dotSize,
                                width: dotSize,
                                decoration: BoxDecoration(
                                  color: themeProvider
                                      .themeData.colorScheme.onTertiary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: actualSpacing * 0.5),
                              Flexible(
                                child: Text(
                                  '30 minutes ago',
                                  style: TextStyle(
                                    fontSize: actualCategoryFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
// MORE ROBUST HANDLING FOR WHEN  SEEMORE APPEARS 
  Widget _buildTestimonyText(
    BuildContext context,
    ThemeViewmodel themeProvider,
    double fontSize,
  ) {
    const String fullText =
        'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospital visits and painful crises became a part of my life. My faith in God never wavered, and during a special prayer service, I felt a strange warmth through my body. The next medical test showed my genotype had changed!';

    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: themeProvider.themeData.colorScheme.onTertiary,
        );

        final seeMoreStyle = textStyle.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        );

        // THIS CXALULATES BASED ON AVAILABLE HEIGHT
        final estimatedLineHeight = fontSize * 1.2;
        final maxLines = (constraints.maxHeight / estimatedLineHeight).floor();
        final effectiveMaxLines = maxLines > 0 ? maxLines : 3;

        const seeMoreText = '... See more';
        final seeMorePainter = TextPainter(
          text: TextSpan(text: seeMoreText, style: seeMoreStyle),
          textDirection: TextDirection.ltr,
        );
        seeMorePainter.layout();
        final seeMoreWidth = seeMorePainter.size.width;

        final textPainter = TextPainter(
          text: TextSpan(text: fullText, style: textStyle),
          maxLines: effectiveMaxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        if (!textPainter.didExceedMaxLines) {
          return Text(
            fullText,
            style: textStyle,
          );
        }

        int start = 0;
        int end = fullText.length;
        int lastGoodIndex = 0;

        while (start <= end) {
          int mid = (start + end) ~/ 2;

          int wordBoundary = mid;
          while (
              wordBoundary < fullText.length && fullText[wordBoundary] != ' ') {
            wordBoundary++;
          }
          if (wordBoundary >= fullText.length) {
            wordBoundary = fullText.lastIndexOf(' ', mid);
            if (wordBoundary == -1) wordBoundary = mid;
          }

          final testPainter = TextPainter(
            text: TextSpan(
              text: fullText.substring(0, wordBoundary),
              style: textStyle,
              children: [
                TextSpan(
                  text: seeMoreText,
                  style: seeMoreStyle,
                ),
              ],
            ),
            maxLines: effectiveMaxLines,
            textDirection: TextDirection.ltr,
          );
          testPainter.layout(maxWidth: constraints.maxWidth);

          if (testPainter.didExceedMaxLines) {
            end = mid - 1;
          } else {
            lastGoodIndex = wordBoundary;
            start = mid + 1;
          }
        }

        return RichText(
          maxLines: effectiveMaxLines,
          overflow: TextOverflow.clip,
          text: TextSpan(
            text: fullText.substring(0, lastGoodIndex),
            style: textStyle,
            children: [
              TextSpan(
                text: seeMoreText,
                style: seeMoreStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
