import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/favourite_icon.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static const String routeName = '/favorites-screen';

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<FavoritesViewModel>();
    final favoritedItems = viewModel.favoritedItems;
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 800;

    return Scaffold(
      appBar: appBar(context, 'Favourites'),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: favoritedItems.isEmpty
          ? Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    Image.asset(
                      AppImages.favoriteImage,
                      width: isLargeScreen ? 160 : 160,
                      height: isLargeScreen ? 150 : 160,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Your Favorite List is Empty",
                      style: normalTextStyle(
                        fontSize: isLargeScreen ? 32 : 20,
                        fontWeight: FontWeight.w600,
                        textColor:
                            themeProvider.themeData.colorScheme.onTertiary,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Browse testimonies and videos and add them to favorites",
                      textAlign: TextAlign.center,
                      style: normalTextStyle(
                        fontSize: isLargeScreen ? 26 : 20,
                        textColor: themeProvider.themeData.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: favoritedItems.length,
              itemBuilder: (context, index) {
                final item = favoritedItems[index];
                return Center(
                    child:
                        _buildFavoritedItem(context, viewModel, item, index));
              },
            ),
    );
  }

  Widget _buildFavoritedItem(BuildContext context, FavoritesViewModel viewModel,
      FavoritedItem item, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dimensions = _getItemDimensions(item.type, screenWidth);

    return Container(
      margin: EdgeInsets.only(
          bottom: index == viewModel.favoritedItems.length - 1 ? 0 : 12),
      width: screenWidth * 0.94, // Uniform width for all items
      height: dimensions['height'],
      child: item.type == 'inspiration'
          ? quoteContainer(
              height: dimensions['height']!,
              textSize: 14,
              index: item.id,
              margin: EdgeInsets.zero, // Remove internal margin
            )
          : item.type == 'post'
              ? TextTestimonyContainer(
                  containerWidth: screenWidth * 0.94, // Enforce uniform width
                  containerHeight: dimensions['height']!,
                  borderRadius: 16.0,
                  index: item.id,
                )
              : _buildMediaItem(context, viewModel, item, dimensions),
    );
  }

  Map<String, double> _getItemDimensions(String type, double screenWidth) {
    final uniformWidth = screenWidth * 0.94;
    switch (type) {
      case 'video':
        return {'width': uniformWidth, 'height': 280.0};
      case 'post':
        return {'width': uniformWidth, 'height': 162.0};
      case 'inspiration':
        return {'width': uniformWidth, 'height': 222.0};
      default:
        return {'width': uniformWidth, 'height': 162.0};
    }
  }

  Widget _buildMediaItem(
    BuildContext context,
    FavoritesViewModel viewModel,
    FavoritedItem item,
    Map<String, double> dimensions,
  ) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final isVideo = item.type == 'video';
    final thumbnailHeight = isVideo ? 220.0 : dimensions['height']!;
    final padding = isTablet ? 8.0 : 6.0;
    final iconSize = isTablet ? 24.0 : 20.0;
    final dotSize = isTablet ? 5.0 : 4.0;
    final spacing = isTablet ? 6.0 : 4.0;
    final fontSizeTitle = isTablet ? 16.0 : 14.0;
    final fontSizeSubtitle = isTablet ? 14.0 : 12.0;
    final fontSizeMeta = isTablet ? 12.0 : 10.0;

    return Container(
      width: dimensions['width'], // Enforce uniform width
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: dimensions['width'],
            height: thumbnailHeight,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isVideo) ...[
                  Positioned(
                    top: padding * 2,
                    right: padding * 2,
                    child: GestureDetector(
                      onTap: () {
                        viewModel.removeFavorite(item.id, item.type);
                      },
                      child: FavoriteIcon(
                        item: item,
                        iconSize: iconSize,
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        color: AppColors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: padding * 2,
                    right: padding * 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: padding, vertical: padding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.blackColor,
                      ),
                      child: textWidget(
                        "09:30",
                        fontSize: fontSizeMeta,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppIcons.itestifyIcon,
                  width: iconSize,
                  height: iconSize,
                ),
                SizedBox(width: spacing * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          color: themeProvider.themeData.colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: spacing),
                      Text(
                        item.church,
                        style: TextStyle(
                          fontSize: fontSizeSubtitle,
                          height: 1.0,
                          color: themeProvider.themeData.colorScheme.tertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: spacing),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 40),
                              child: Text(
                                "${item.views} Views",
                                style: TextStyle(
                                  fontSize: fontSizeMeta,
                                  height: 1.0,
                                  color: themeProvider
                                      .themeData.colorScheme.tertiary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: spacing),
                            _buildDot(themeProvider, dotSize),
                            SizedBox(width: spacing),
                            ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 40),
                              child: Text(
                                item.date,
                                style: TextStyle(
                                  fontSize: fontSizeMeta,
                                  height: 1.0,
                                  color: themeProvider
                                      .themeData.colorScheme.tertiary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(ThemeViewmodel themeProvider, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: themeProvider.themeData.colorScheme.tertiary,
        shape: BoxShape.circle,
      ),
    );
  }
}