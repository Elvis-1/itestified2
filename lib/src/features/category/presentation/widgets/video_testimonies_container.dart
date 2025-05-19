import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/favourite_icon.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/video_testimony_viewmodel.dart';
import 'package:provider/provider.dart';

class VideoTestimonyContainer1 extends StatelessWidget {
  const VideoTestimonyContainer1({
    super.key,
    required this.videoId,
    this.containerWidth,
    this.containerHeight,
  });

  final int videoId;
  final double? containerWidth;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<VideoTestimonyViewModel>(param1: videoId);
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;


    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 900;

    const baseContainerWidth = 220.0;
    const baseImageHeight = 133.0;
    const baseSubContainerHeight = 52.0;
    const baseIconSize = 20.0;
    const baseTitleFontSize = 10.0;
    const baseSubtitleFontSize = 9.0;
    const baseMetadataFontSize = 9.0;

    final scale = isDesktop ? 1.4 : (isTablet ? 1.2 : 1.0);

    final width = containerWidth ?? (baseContainerWidth * scale);
    final imageHeight = baseImageHeight * scale;
    final subContainerHeight = baseSubContainerHeight * scale;
    final iconSize = baseIconSize * scale;
    final titleFontSize = baseTitleFontSize * scale;
    final subtitleFontSize = baseSubtitleFontSize * scale;
    final metadataFontSize = baseMetadataFontSize * scale;
    final padding = 8.0 * scale;
    final spacing = 4.0 * scale;
    final dotSize = 4.0 * scale;

    final favoritedItem = FavoritedItem(
      id: videoId,
      type: 'video',
      title: 'Prophetic Prayer for open doors',
      church: 'Redeemed Christian Church of God',
      views: '504',
      date: '18/6/2024',
      imagePath: AppImages.togetherImage,
    );

    return InkWell(
      onTap: () => viewModel.handleVideoTestimonyTap(context, videoId: videoId),
      borderRadius: BorderRadius.circular(16 * scale),
      child: Container(
        width: width,
        height: imageHeight + subContainerHeight + spacing,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: imageHeight,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16 * scale),
                image: DecorationImage(
                  image: AssetImage(AppImages.togetherImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                      size: 40 * scale,
                    ),
                  ),
                  Positioned(
                    top: padding,
                    right: padding,
                    child: FavoriteIcon(
                      item: favoritedItem,
                      radius: 12 * scale,
                      iconSize: 14 * scale,
                    ),
                  ),
                  Positioned(
                    bottom: padding,
                    right: padding,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: padding / 2,
                        vertical: padding / 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4 * scale),
                        color: AppColors.blackColor.withOpacity(0.8),
                      ),
                      child: Text(
                        "09:30",
                        style: normalTextStyle(
                          textColor: AppColors.white,
                          fontSize: metadataFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing),
            Container(
              height: subContainerHeight,
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: iconSize,
                    height: iconSize,
                    margin: EdgeInsets.only(right: spacing * 2),
                    child: Image.asset(
                      AppIcons.itestifyIcon,
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Triplets after 25 years of waiting!",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: titleFontSize,
                            height: 1.0,
                            color:
                                themeProvider.themeData.colorScheme.onTertiary,
                          ),
                        ),
                        SizedBox(height: spacing / 2),
                        Text(
                          "Redeemed Christian Church of God",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: subtitleFontSize,
                            height: 1.0,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                        ),
                        SizedBox(height: spacing / 2),
                        Row(
                          children: [
                            _buildMetadataText(context, "Child Birth",
                                metadataFontSize, themeProvider),
                            SizedBox(width: spacing),
                            _buildDot(themeProvider, dotSize),
                            SizedBox(width: spacing),
                            _buildMetadataText(context, "504 Views",
                                metadataFontSize, themeProvider),
                            SizedBox(width: spacing),
                            _buildDot(themeProvider, dotSize),
                            SizedBox(width: spacing),
                            _buildMetadataText(context, "18/6/2024",
                                metadataFontSize, themeProvider),
                          ],
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
    );
  }

  Widget _buildMetadataText(BuildContext context, String text, double fontSize,
      ThemeViewmodel themeProvider) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Open Sans',
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        height: 1.0,
        color: themeProvider.themeData.colorScheme.tertiary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
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

// class VideoTestimonyContainer2 extends StatelessWidget {
//   const VideoTestimonyContainer2({
//     super.key,
//     required this.videoId,
//     required this.containerWidth,
//     required this.containerHeight,
//     required this.borderRadius,
//     this.imageHeightRatio = 0.55,
//   });

//   final int videoId;
//   final double containerWidth;
//   final double containerHeight;
//   final double borderRadius;
//   final double imageHeightRatio;

//   static List<String> imageList = [
//     AppImages.togetherImage,
//     AppImages.babyImage,
//     AppImages.popularPrayingVideoImage,
//   ];

//   static const List<VideoTextData> textDataList = [
//     VideoTextData(
//       title: "Triplets after 25 years of waiting!",
//       church: "Redeemed Christians Church of God",
//       tag: "Child Birth",
//       views: "700",
//       date: "04/11/2024",
//     ),
//     VideoTextData(
//       title: "Jesus Changed my Genotype!",
//       church: "Redeemed Christians Church of God",
//       tag: "Genotype",
//       views: "2000",
//       date: "07/11/2024",
//     ),
//   ];

//   String getImageForVideo() {
//     final index = (videoId - 1) % imageList.length;
//     return imageList[index];
//   }

//   VideoTextData getTextDataForVideo() {
//     final index = (videoId - 1) % textDataList.length;
//     return textDataList[index];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = GetIt.I<VideoTestimonyViewModel>(param1: videoId);
//     final themeProvider = Provider.of<ThemeViewmodel>(context);
//     final favoritesViewModel = GetIt.I<FavoritesViewModel>();
//     final viewModelProvider = GetIt.I<VideoWrittenTestimoniesViewModel>();
//     final imageHeight = viewModelProvider.getVideoImageHeight(context);
//     final textData = getTextDataForVideo();

//     return InkWell(
//       onTap: () => viewModel.handleVideoTestimonyTap(context, videoId: videoId),
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: Container(
//         width: containerWidth,
//         height: containerHeight,
//         padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             bool isTablet = constraints.maxWidth >= 800;
//             double padding = isTablet ? 8 : 6;
//             double iconSize = isTablet ? 24 : 20;
//             double avatarSize = isTablet ? 24 : 20;
//             double dotSize = isTablet ? 5 : 4;
//             double spacing = isTablet ? 6 : 4;
//             double fontSizeTitle = isTablet ? 16 : 14;
//             double fontSizeSubtitle = isTablet ? 14 : 12;
//             double fontSizeMeta = isTablet ? 12 : 10;

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: constraints.maxWidth,
//                   height: imageHeight,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     image: DecorationImage(
//                       image: AssetImage(getImageForVideo()),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         top: padding * 2,
//                         right: padding * 2,
//                         child: ValueListenableBuilder<List<FavoritedItem>>(
//                           valueListenable:
//                               GetIt.I<ValueListenable<List<FavoritedItem>>>(),
//                           builder: (context, favorites, child) {
//                             final isFavorited = favoritesViewModel.isFavorited(
//                                 videoId, 'video');
//                             print(
//                                 'VideoTestimonyContainer2: Building favorite icon, videoId=$videoId, isFavorited=$isFavorited');
//                             return GestureDetector(
//                               onTap: () {
//                                 print(
//                                     'VideoTestimonyContainer2: Favorite clicked, videoId=$videoId, currentState=$isFavorited');
//                                 final item = FavoritedItem(
//                                   id: videoId,
//                                   type: 'video',
//                                   title: textData.title,
//                                   church: textData.church,
//                                   views: textData.views,
//                                   date: textData.date,
//                                   imagePath: getImageForVideo(),
//                                 );
//                                 if (isFavorited) {
//                                   favoritesViewModel.removeFavorite(
//                                       videoId, 'video');
//                                 } else {
//                                   favoritesViewModel.addFavorite(item);
//                                 }
//                               },
//                               child: CircleAvatar(
//                                 radius: iconSize / 2,
//                                 backgroundColor:
//                                     themeProvider.themeData.colorScheme.outline,
//                                 child: Icon(
//                                   isFavorited
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   color: AppColors.primaryColor,
//                                   size: iconSize,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         bottom: padding * 2,
//                         right: padding * 2,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: padding,
//                             vertical: padding / 2,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: AppColors.blackColor.withOpacity(0.8),
//                           ),
//                           child: Text(
//                             "09:30",
//                             style: normalTextStyle(
//                               textColor:
//                                   themeProvider.themeData.colorScheme.tertiary,
//                               fontSize: fontSizeMeta,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         Icons.play_arrow,
//                         color: AppColors.white,
//                         size: iconSize * 2,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: spacing),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.asset(
//                       AppIcons.itestifyIcon,
//                       width: avatarSize,
//                       height: avatarSize,
//                     ),
//                     SizedBox(width: spacing * 2),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             textData.title,
//                             style: TextStyle(
//                               fontSize: fontSizeTitle,
//                               fontWeight: FontWeight.w600,
//                               height: 1.0,
//                               color:
//                                   themeProvider.themeData.colorScheme.tertiary,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: spacing),
//                           Text(
//                             textData.church,
//                             style: TextStyle(
//                               fontSize: fontSizeSubtitle,
//                               height: 1.0,
//                               color:
//                                   themeProvider.themeData.colorScheme.tertiary,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: spacing),
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             child: Row(
//                               children: [
//                                 ConstrainedBox(
//                                   constraints:
//                                       const BoxConstraints(minWidth: 40),
//                                   child: Text(
//                                     textData.tag,
//                                     style: TextStyle(
//                                       fontSize: fontSizeMeta,
//                                       height: 1.0,
//                                       color: themeProvider
//                                           .themeData.colorScheme.tertiary,
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 SizedBox(width: spacing),
//                                 _buildDot(themeProvider, dotSize),
//                                 SizedBox(width: spacing),
//                                 ConstrainedBox(
//                                   constraints:
//                                       const BoxConstraints(minWidth: 30),
//                                   child: Text(
//                                     "${textData.views} Views",
//                                     style: TextStyle(
//                                       fontSize: fontSizeMeta,
//                                       height: 1.0,
//                                       color: themeProvider
//                                           .themeData.colorScheme.tertiary,
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 SizedBox(width: spacing),
//                                 _buildDot(themeProvider, dotSize),
//                                 SizedBox(width: spacing),
//                                 ConstrainedBox(
//                                   constraints:
//                                       const BoxConstraints(minWidth: 40),
//                                   child: Text(
//                                     textData.date,
//                                     style: TextStyle(
//                                       fontSize: fontSizeMeta,
//                                       height: 1.0,
//                                       color: themeProvider
//                                           .themeData.colorScheme.tertiary,
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildDot(ThemeViewmodel themeProvider, double dotSize) {
//     return Container(
//       width: dotSize,
//       height: dotSize,
//       decoration: BoxDecoration(
//         color: themeProvider.themeData.colorScheme.tertiary,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

// class VideoTextData {
//   final String title;
//   final String church;
//   final String tag;
//   final String views;
//   final String date;

//   const VideoTextData({
//     required this.title,
//     required this.church,
//     required this.tag,
//     required this.views,
//     required this.date,
//   });
// }

///
///\
///
///


class VideoTestimonyContainer3 extends StatelessWidget {
  const VideoTestimonyContainer3({
    super.key,
    required this.videoId,
    this.containerWidth,
    this.containerHeight,
  });

  final int videoId;
  final double? containerWidth;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<VideoTestimonyViewModel>(param1: videoId);
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;


    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 900;

    const baseContainerWidth = 345.0;
    const baseImageHeight = 220.0;
    const baseSubContainerHeight = 60.0;
    const baseIconSize = 20.0;
    const baseTitleFontSize = 14.0;
    const baseSubtitleFontSize = 10.0;
    const baseMetadataFontSize = 8.0;

    final scale = isDesktop ? 1.4 : (isTablet ? 1.2 : 1.0);

    final width = containerWidth ?? (baseContainerWidth * scale);
    final imageHeight = baseImageHeight * scale;
    final subContainerHeight = baseSubContainerHeight * scale;
    final iconSize = baseIconSize * scale;
    final titleFontSize = baseTitleFontSize * scale;
    final subtitleFontSize = baseSubtitleFontSize * scale;
    final metadataFontSize = baseMetadataFontSize * scale;
    final padding = 8.0 * scale;
    final spacing = 4.0 * scale;
    final dotSize = 4.0 * scale;

    final favoritedItem = FavoritedItem(
      id: videoId,
      type: 'video',
      title: 'Triplets after 25 years of waiting!',
      church: 'Redeemed Christian Church of God',
      views: '504',
      date: '18/6/2024',
      imagePath: AppImages.togetherImage,
    );

    return InkWell(
      onTap: () => viewModel.handleVideoTestimonyTap(context, videoId: videoId),
      borderRadius: BorderRadius.circular(16 * scale),
      child: Align(
        child: Container(
          width: width,
          height: imageHeight + subContainerHeight + spacing,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: imageHeight,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16 * scale),
                  image: DecorationImage(
                    image: AssetImage(AppImages.togetherImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: AppColors.white,
                        size: 40 * scale,
                      ),
                    ),
                    Positioned(
                      top: padding,
                      right: padding,
                      child: FavoriteIcon(
                        item: favoritedItem,
                        radius: 12 * scale,
                        iconSize: 14 * scale,
                      ),
                    ),
                    Positioned(
                      bottom: padding,
                      right: padding,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding / 2,
                          vertical: padding / 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4 * scale),
                          color: AppColors.blackColor.withOpacity(0.8),
                        ),
                        child: Text(
                          "09:30",
                          style: normalTextStyle(
                            textColor: AppColors.white,
                            fontSize: metadataFontSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),
              Container(
                height: subContainerHeight,
                padding: EdgeInsets.symmetric(vertical: spacing),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      margin: EdgeInsets.only(right: spacing * 2),
                      child: Image.asset(
                        AppIcons.itestifyIcon,
                        width: iconSize,
                        height: iconSize,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Triplets after 25 years of waiting!",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: titleFontSize,
                              height: 1.0,
                              color:
                                  themeProvider.themeData.colorScheme.onTertiary,
                            ),
                          ),
                          SizedBox(height: spacing / 2),
                          Text(
                            "Redeemed Christian Church of God",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: subtitleFontSize,
                              height: 1.0,
                              color: themeProvider.themeData.colorScheme.tertiary,
                            ),
                          ),
                          SizedBox(height: spacing / 2),
                          Row(
                            children: [
                              _buildMetadataText(context, "Child Birth",
                                  metadataFontSize, themeProvider),
                              SizedBox(width: spacing),
                              _buildDot(themeProvider, dotSize),
                              SizedBox(width: spacing),
                              _buildMetadataText(context, "504 Views",
                                  metadataFontSize, themeProvider),
                              SizedBox(width: spacing),
                              _buildDot(themeProvider, dotSize),
                              SizedBox(width: spacing),
                              _buildMetadataText(context, "18/6/2024",
                                  metadataFontSize, themeProvider),
                            ],
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
      ),
    );
  }

  Widget _buildMetadataText(BuildContext context, String text, double fontSize,
      ThemeViewmodel themeProvider) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Open Sans',
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        height: 1.0,
        color: themeProvider.themeData.colorScheme.tertiary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
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