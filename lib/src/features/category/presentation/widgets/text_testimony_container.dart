import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/shared/widgets/read_more.dart';
import 'package:provider/provider.dart';

class TextTestimonyContainer extends StatelessWidget {
  const TextTestimonyContainer({
    super.key,
    this.containerWidth = 282.0, 
    this.containerHeight = 149.0, 
    this.borderRadius = 16.0,
    this.index,
  });

  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final int? index;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var favoritesViewModel = Provider.of<FavoritesViewModel>(context);
    double screenWidth = MediaQuery.of(context).size.width;

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
          bool isLargeScreen = constraints.maxWidth > 800;
          double scaledWidth = isLargeScreen ? containerWidth * 1.2 : containerWidth;
          double scaledHeight = isLargeScreen ? containerHeight * 1.2 : containerHeight;
          double scaledBorderRadius = isLargeScreen ? borderRadius * 1.2 : borderRadius;
          double padding = isLargeScreen ? 16 : 12;
          double avatarRadius = isLargeScreen ? 16 : 14;
          double iconSize = isLargeScreen ? 16 : 14;
          double spacing = isLargeScreen ? 12 : 10;
          double dotSize = isLargeScreen ? 6 : 5;

          return Container(
            width: scaledWidth,
            height: scaledHeight,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: themeProvider.themeData.colorScheme.outline,
              border: Border.all(
                color: themeProvider.themeData.colorScheme.outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(scaledBorderRadius),
            ),
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidgets.textWidget10(
                          context,
                          'Jesus Changed my Genotype',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (favoritesViewModel.isFavorited(testimonyId, 'post')) {
                          favoritesViewModel.removeFavorite(testimonyId, 'post');
                        } else {
                          favoritesViewModel.addFavorite(favoritedItem);
                        }
                      },
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: AppColors.opaqueBlack,
                        child: Icon(
                          favoritesViewModel.isFavorited(testimonyId, 'post')
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: iconSize,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: addReadMoreToText(
                        'For years, I lived with the pain and limitations of having the sickle cell genotype...',
                      ),
                      style: normalTextStyle(
                        fontSize: 10 * (isLargeScreen ? 1.2 : 1.0),
                        fontWeight: FontWeight.w400,
                        textColor: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      children: [
                        TextSpan(
                          text: ' ... See more',
                          style: normalTextStyle(
                            fontSize: 10 * (isLargeScreen ? 1.2 : 1.0),
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.userIcon,
                      width: 30 * (isLargeScreen ? 1.2 : 1.0),
                      height: 30 * (isLargeScreen ? 1.2 : 1.0),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: spacing),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidgets.textWidget10(
                            context,
                            'Chika Amaka',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: spacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: TextWidgets.textWidget10(
                                  context,
                                  'Healing',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8 * (isLargeScreen ? 1.2 : 1.0),
                                ),
                              ),
                              SizedBox(width: spacing * 0.5),
                              Container(
                                height: dotSize,
                                width: dotSize,
                                decoration: BoxDecoration(
                                  color: themeProvider.themeData.colorScheme.onTertiary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: spacing * 0.5),
                              Flexible(
                                child: TextWidgets.textWidget10(
                                  context,
                                  '30 minutes ago',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8 * (isLargeScreen ? 1.2 : 1.0),
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
}