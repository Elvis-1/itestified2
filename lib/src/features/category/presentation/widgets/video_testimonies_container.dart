import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';

import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/video_testimony_viewmodel.dart';

import 'package:provider/provider.dart';

import '../../../favorites/presentation/screens/favorite_icon_view_model.dart';

class VideoTestimonyContainer1 extends StatelessWidget {
  const VideoTestimonyContainer1({
    super.key,
    required this.videoId,
  });

  final int videoId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoTestimonyViewModel(videoId: videoId),
      child: Consumer<VideoTestimonyViewModel>(
        builder: (context, viewModel, _) {
          final themeProvider = Provider.of<ThemeViewmodel>(context);
          final favoritesViewModel = Provider.of<FavoritesViewModel>(context);
          final config = viewModel.config;

          return InkWell(
            onTap: () {
              viewModel.handleVideoTestimonyTap(context, videoId: videoId);
            },
            borderRadius: BorderRadius.circular(config.baseBorderRadius),
            child: Container(
              width: viewModel.getImageWidth(context),
              height: 215.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRect(
                    child: Container(
                      height: viewModel.getImageHeight(context),
                      width: viewModel.getImageWidth(context),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(config.baseBorderRadius),
                        image: DecorationImage(
                          image: AssetImage(AppImages.togetherImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                              size: 40,
                            ),
                          ),
                          Positioned(
                            top: viewModel.getPadding(context) * 0.5,
                            right: viewModel.getPadding(context) * 0.5,
                            child: GestureDetector(
                              onTap: () {
                                print(
                                    'VideoTestimonyContainer1: Favorite tapped, videoId=$videoId, isFavorited=${favoritesViewModel.isFavorited(videoId, 'video')}');
                                final item = FavoritedItem(
                                  id: videoId,
                                  type: 'video',
                                  title: 'Prophetic Prayer for open doors',
                                  church: 'Redeemed Christian Church of God',
                                  views: '504',
                                  date: '18/6/2024',
                                  imagePath: AppImages.togetherImage,
                                );
                                if (favoritesViewModel.isFavorited(
                                    videoId, 'video')) {
                                  favoritesViewModel.removeFavorite(
                                      videoId, 'video');
                                } else {
                                  favoritesViewModel.addFavorite(item);
                                }
                              },
                              child: CircleAvatar(
                                radius:
                                    viewModel.getFavoriteIconSize(context) / 2,
                                backgroundColor: themeProvider
                                    .themeData.searchBarTheme.backgroundColor!
                                    .resolve({}),
                                child: Icon(
                                  favoritesViewModel.isFavorited(
                                          videoId, 'video')
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: viewModel.getFavoriteIconSize(context) *
                                      0.8,
                                  color: themeProvider
                                      .themeData.colorScheme.onTertiary,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: viewModel.getPadding(context) * 0.5,
                            right: viewModel.getPadding(context) * 0.5,
                            child: Container(
                              padding: EdgeInsets.all(
                                  viewModel.getPadding(context) * 0.25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: AppColors.blackColor,
                              ),
                              child: Text(
                                "09:30",
                                style: normalTextStyle(
                                  textColor: AppColors.textColor,
                                  fontSize: viewModel.getTimeTextSize(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: viewModel.getTextGap(context)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppIcons.itestifyIcon,
                        width: viewModel.getApologyIconSize(context),
                        height: viewModel.getApologyIconSize(context),
                      ),
                      SizedBox(width: viewModel.getTextGap(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidgets.textWidget10(
                              context,
                              "Prophetic Prayer for open doors",
                              fontWeight: FontWeight.w600,
                              fontSize: viewModel.getTitleTextSize(context),
                              maxLines: 1,
                            ),
                            SizedBox(height: viewModel.getTextGap(context)),
                            TextWidgets.textWidget10(
                              context,
                              "Redeemed Christian Church of God",
                              fontSize: viewModel.getSubtitleTextSize(context),
                              maxLines: 1,
                            ),
                            SizedBox(height: viewModel.getTextGap(context)),
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minWidth: 45),
                                  child: TextWidgets.textWidget10(
                                    context,
                                    "Child Birth",
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        viewModel.getMetadataTextSize(context),
                                    maxLines: 1,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                _buildDot(themeProvider),
                                const SizedBox(width: 6),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minWidth: 35),
                                  child: TextWidgets.textWidget10(
                                    context,
                                    "504 Views",
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        viewModel.getMetadataTextSize(context),
                                    maxLines: 1,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                _buildDot(themeProvider),
                                const SizedBox(width: 6),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minWidth: 45),
                                  child: TextWidgets.textWidget10(
                                    context,
                                    "18/6/2024",
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        viewModel.getMetadataTextSize(context),
                                    maxLines: 1,
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildDot(ThemeViewmodel themeProvider) {
    return SizedBox(
      height: 20,
      child: Center(
        child: Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.tertiary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class VideoTextData {
  final String title;
  final String church;
  final String tag;
  final String views;
  final String date;

  const VideoTextData({
    required this.title,
    required this.church,
    required this.tag,
    required this.views,
    required this.date,
  });
}

class VideoTestimonyContainer2 extends StatelessWidget {
  const VideoTestimonyContainer2({
    super.key,
    required this.videoId,
    required this.containerWidth,
    required this.containerHeight,
    required this.borderRadius,
    this.imageHeightRatio = 0.55,
  });

  final int videoId;
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final double imageHeightRatio;

  static List<String> imageList = [
    AppImages.togetherImage,
    AppImages.babyImage,
    AppImages.popularPrayingVideoImage,
  ];

  static const List<VideoTextData> textDataList = [
    VideoTextData(
      title: "Triplets after 25 years of waiting!",
      church: "Redeemed Christians Church of God",
      tag: "Child Birth",
      views: "700",
      date: "04/11/2024",
    ),
    VideoTextData(
      title: "Jesus Changed my Genotype!",
      church: "Redeemed Christians Church of God",
      tag: "Genotype",
      views: "2000",
      date: "07/11/2024",
    ),
  ];

  String getImageForVideo() {
    final index = (videoId - 1) % imageList.length;
    return imageList[index];
  }

  VideoTextData getTextDataForVideo() {
    final index = (videoId - 1) % textDataList.length;
    return textDataList[index];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoTestimonyViewModel(videoId: videoId),
      child: Consumer<VideoTestimonyViewModel>(
        builder: (context, viewModel, _) {
          final themeProvider = Provider.of<ThemeViewmodel>(context);
          final favoritesViewModel = Provider.of<FavoritesViewModel>(context);
          final viewModelProvider =
              Provider.of<VideoWrittenTestimoniesViewModel>(context);
          final imageHeight = viewModelProvider.getVideoImageHeight(context);
          final contentHeight = containerHeight - imageHeight - 12;

          final textData = getTextDataForVideo();

          return InkWell(
            onTap: () =>
                viewModel.handleVideoTestimonyTap(context, videoId: videoId),
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              width: containerWidth,
              height: containerHeight,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isTablet = constraints.maxWidth >= 800;
                  double padding = isTablet ? 8 : 6;
                  double iconSize = isTablet ? 24 : 20;
                  double avatarSize = isTablet ? 24 : 20;
                  double dotSize = isTablet ? 5 : 4;
                  double spacing = isTablet ? 6 : 4;
                  double fontSizeTitle = isTablet ? 16 : 14;
                  double fontSizeSubtitle = isTablet ? 14 : 12;
                  double fontSizeMeta = isTablet ? 12 : 10;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(getImageForVideo()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: padding * 2,
                              right: padding * 2,
                              child: GestureDetector(
                                onTap: () {
                                  final item = FavoritedItem(
                                    id: videoId,
                                    type: 'video',
                                    title: textData.title,
                                    church: textData.church,
                                    views: textData.views,
                                    date: textData.date,
                                    imagePath: getImageForVideo(),
                                  );
                                  if (favoritesViewModel.isFavorited(
                                      videoId, 'video')) {
                                    favoritesViewModel.removeFavorite(
                                        videoId, 'video');
                                  } else {
                                    favoritesViewModel.addFavorite(item);
                                  }
                                },
                                child: CircleAvatar(
                                  radius: iconSize / 2,
                                  backgroundColor: themeProvider
                                      .themeData.colorScheme.outline,
                                  child: Icon(
                                    favoritesViewModel.isFavorited(
                                            videoId, 'video')
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: AppColors.primaryColor,
                                    size: iconSize,
                                  ),
                                ),
                              ),
                            ),
                            // Duration indicator
                            Positioned(
                              bottom: padding * 2,
                              right: padding * 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: padding,
                                  vertical: padding / 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.blackColor.withOpacity(0.8),
                                ),
                                child: Text(
                                  "09:30",
                                  style: normalTextStyle(
                                    textColor: themeProvider
                                        .themeData.colorScheme.tertiary,
                                    fontSize: fontSizeMeta,
                                  ),
                                ),
                              ),
                            ),

                            Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                              size: iconSize * 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppIcons.itestifyIcon,
                            width: avatarSize,
                            height: avatarSize,
                          ),
                          SizedBox(width: spacing * 2),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textData.title,
                                  style: TextStyle(
                                    fontSize: fontSizeTitle,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0,
                                    color: themeProvider
                                        .themeData.colorScheme.tertiary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: spacing),
                                Text(
                                  textData.church,
                                  style: TextStyle(
                                    fontSize: fontSizeSubtitle,
                                    height: 1.0,
                                    color: themeProvider
                                        .themeData.colorScheme.tertiary,
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
                                        constraints:
                                            const BoxConstraints(minWidth: 40),
                                        child: Text(
                                          textData.tag,
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
                                        constraints:
                                            const BoxConstraints(minWidth: 30),
                                        child: Text(
                                          "${textData.views} Views",
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
                                        constraints:
                                            const BoxConstraints(minWidth: 40),
                                        child: Text(
                                          textData.date,
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
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDot(ThemeViewmodel themeProvider, double dotSize) {
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: themeProvider.themeData.colorScheme.tertiary,
        shape: BoxShape.circle,
      ),
    );
  }
}
