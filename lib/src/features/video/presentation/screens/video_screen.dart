import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/read_more.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

// class VideoScreen extends StatelessWidget {
//   const VideoScreen({super.key, required this.heroIndex});
//   final int heroIndex;

//   static const routeName = 'video-screen';

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return Scaffold(
//         backgroundColor: themeProvider.themeData.colorScheme.background,
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             bool isLargeScreen = constraints.maxWidth > 800; // Tablet & desktop
//             return ListView(
//               children: [
//                 // video and text element
//                 videoContainer(
//                     videoContainerWidth: double.infinity,
//                     videoContainerHeight: 200,
//                     imageHeight: 280,
//                     onpressed: () {
//                       showModalBottomSheet(
//                           context: context,
//                           builder: (context) {
//                             return const videoDetailsModal();
//                           });
//                     }),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 Container(
//                   margin: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       likeOrShare(AppIcons.likeIcon2, "30",
//                           containerColor:
//                               themeProvider.themeData.colorScheme.onBackground),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       likeOrShare(AppIcons.shareIcon, "Share",
//                           containerColor:
//                               themeProvider.themeData.colorScheme.onBackground),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 lineWidget(
//                     width: double.infinity,
//                     color: themeProvider.themeData.colorScheme.outline),
//                 // app logo
//                 Container(
//                   margin: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Image.asset(
//                           AppIcons.itestifyIcon,
//                           width: 30,
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       textWidget(
//                         'iTestified',
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                       )
//                     ],
//                   ),
//                 ),

//                 lineWidget(
//                     width: double.infinity,
//                     color: themeProvider.themeData.colorScheme.outline),

//                 const SizedBox(
//                   height: 5,
//                 ),
//                 commentSection(context),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 isLargeScreen
//                     ? SizedBox(
//                         height: 600,
//                         child: largeScreenGrid(
//                           context,
//                           const videoTestimoniesContainer2(
//                               videoContainerHeight: 250,
//                               fix: BoxFit.fill,
//                               imageHeight: 180,
//                               playArrowLeftPosition: 130,
//                               playArrowTopPosition: 50,
//                               itestifyIconTopPosition: 150),
//                         ),
//                       )
//                     : mainList(context)
//               ],
//             );
//           },
//         ));
//   }
// }

// Widget mainList(BuildContext context) {
//   return Column(
//     children: [relatedVideosSection(context)],
//   );
// }

// Widget relatedVideosSection(BuildContext context) {
//   var themeProvider = Provider.of<ThemeViewmodel>(context);

//   return Column(
//     children: [
//       // related videos
//       Container(
//         margin: const EdgeInsets.symmetric(horizontal: 15),
//         child: Align(
//             alignment: Alignment.topLeft,
//             child: textWidget(
//               "Related Videos",
//               fontSize: 18,
//               color: themeProvider.themeData.colorScheme.onTertiary,
//               fontWeight: FontWeight.w500,
//             )),
//       ),
//       const SizedBox(height: 10),
//       SizedBox(
//           height: 250,
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: 4,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 10),
//                   child: const FadeInTransitionWidget(
//                     child: videoTestimoniesContainer2(
//                         fix: BoxFit.cover,
//                         imageHeight: 150,
//                         playArrowLeftPosition: 130,
//                         playArrowTopPosition: 50,
//                         itestifyIconTopPosition: 150),
//                   ),
//                 );
//               }))
//     ],
//   );
// }

// Widget commentSection(BuildContext context) {
//   var themeProvider = Provider.of<ThemeViewmodel>(context);

//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 15),
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: themeProvider.themeData.colorScheme.onBackground,
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             textWidget(
//               "Comments",
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: themeProvider.themeData.colorScheme.onTertiary,
//             ),
//             textWidget(
//               "(12)",
//               fontSize: 12,
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         SizedBox(
//           // width: 500,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(AppIcons.userIcon),
//               const SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   await showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return ListView(
//                           shrinkWrap: true,
//                           children: [
//                             Container(
//                                 //  height: 70.h,
//                                 decoration: BoxDecoration(
//                                     color: themeProvider
//                                         .themeData.colorScheme.background,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 30),

//                                 //  height: 50,
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: textWidget('Comments',
//                                       fontWeight: FontWeight.w600,
//                                       color: themeProvider
//                                           .themeData.colorScheme.onTertiary,
//                                       fontSize: 20),
//                                 )),
//                             const SizedBox(
//                                 height: 400, child: commentListModal()),
//                           ],
//                         );
//                       });
//                 },
//                 child: SizedBox(
//                     width: 250,
//                     child: RichText(
//                         text: TextSpan(
//                             text: addReadMoreToText(
//                                 'Our God is indeed good to me Our God is indeed good to me ',
//                                 50),
//                             style: normalTextStyle(
//                                 textColor: themeProvider
//                                     .themeData.colorScheme.tertiary),
//                             children: [
//                           TextSpan(
//                               text: ' ... See more',
//                               style: normalTextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   textColor: AppColors.primaryColor)),
//                         ]))),
//               ),
//               textWidget(
//                 "2 days Ago",
//                 fontSize: 12,
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget largeScreenGrid2(BuildContext context, Widget child,
//     {int gridNumber = 2,
//     ScrollPhysics physics = const BouncingScrollPhysics()}) {
//   return SizedBox(
//     height: (15 / gridNumber).ceil() * 220,
//     // Ensures the grid has space to scroll
//     child: GridView.builder(
//       physics: physics,
//       shrinkWrap: true, // Takes only needed space without conflicts
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: gridNumber, // Columns on large screens
//         crossAxisSpacing: 10, // Optional: Spacing between items
//         mainAxisSpacing: 10, // Optional: Spacing between rows
//         childAspectRatio: 1.5, // Adjusts item width/height ratio
//       ),
//       itemCount: 15, // Number of items
//       itemBuilder: (context, i) => child,
//     ),
//   );
// }

import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPlayerProvider with ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  String _selectedQuality = '720p';
  double _playbackSpeed = 1.0;
  bool _isFullScreen = false;
  bool _isInitialized = false;
  String? _errorMessage;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  VideoPlayerController get controller => _controller;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  String get selectedQuality => _selectedQuality;
  double get playbackSpeed => _playbackSpeed;
  bool get isFullScreen => _isFullScreen;
  bool get isInitialized => _isInitialized;
  String? get errorMessage => _errorMessage;
  bool get showControls => _showControls;

  VideoPlayerProvider(String videoUrl) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        _duration = _controller.value.duration;
        _isInitialized = true;
        _errorMessage = null;
        notifyListeners();
      }).catchError((error) {
        print('Video initialization error: $error');
        _isInitialized = false;
        _errorMessage = 'Failed to load video: ${error.toString()}';
        notifyListeners();
      });
    _controller.addListener(_updatePosition);
  }

  void _updatePosition() {
    _position = _controller.value.position;
    final wasPlaying = _isPlaying;
    _isPlaying = _controller.value.isPlaying;
    if (!wasPlaying && _isPlaying) {
      _startHideControlsTimer();
    }
    notifyListeners();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (_isPlaying) {
        _showControls = false;
        notifyListeners();
      }
    });
  }

  void togglePlayPause() {
    if (!_isInitialized) return;
    if (_isPlaying) {
      _controller.pause();
      _hideControlsTimer?.cancel();
      _showControls = true;
    } else {
      _controller.play();
      _startHideControlsTimer();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void toggleControls() {
    _showControls = !_showControls;
    if (_showControls && _isPlaying) {
      _startHideControlsTimer();
    } else {
      _hideControlsTimer?.cancel();
    }
    notifyListeners();
  }

  void seekTo(Duration position) {
    if (!_isInitialized) return;
    _controller.seekTo(position);
    notifyListeners();
  }

  void setQuality(String quality) {
    _selectedQuality = quality;

    notifyListeners();
  }

  void setPlaybackSpeed(double speed) {
    if (!_isInitialized) return;
    _playbackSpeed = speed;
    _controller.setPlaybackSpeed(speed);
    notifyListeners();
  }

  void toggleFullScreen() {
    _isFullScreen = !_isFullScreen;
    if (_isFullScreen) {
      // Enter landscape mode
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      // Return to portrait mode
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    notifyListeners();
  }

  void retry(String videoUrl) {
    _controller.dispose();
    _isInitialized = false;
    _errorMessage = null;
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        _duration = _controller.value.duration;
        _isInitialized = true;
        _errorMessage = null;
        notifyListeners();
      }).catchError((error) {
        print('Video initialization error: $error');
        _isInitialized = false;
        _errorMessage = 'Failed to load video: ${error.toString()}';
        notifyListeners();
      });
    _controller.addListener(_updatePosition);
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _controller.removeListener(_updatePosition);
    _controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final videoHeight = screenWidth * (9 / 16);

    return ChangeNotifierProvider(
      create: (_) => VideoPlayerProvider(videoUrl),
      child: Consumer<VideoPlayerProvider>(
        builder: (context, provider, _) {
          if (provider.isFullScreen) {
            return GestureDetector(
              onTap: provider.toggleControls,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.backgroundColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildVideoContent(provider, context),
                    if (provider.isInitialized &&
                        provider.errorMessage == null &&
                        provider.showControls)
                      GestureDetector(
                        onTap: provider.togglePlayPause,
                        child: Icon(
                          provider.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: AppColors.white,
                          size: 50,
                        ),
                      ),
                    if (provider.showControls)
                      Positioned(
                        top: 30,
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppIcons.favoriteIcon,
                                    color: Colors.white,
                                    width: 24,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (provider.isInitialized &&
                                        provider.errorMessage == null) {
                                      _showSettingsModal(context, provider);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (provider.isInitialized &&
                        provider.errorMessage == null &&
                        provider.showControls)
                      Positioned(
                        bottom: 20,
                        left: 10,
                        child: textWidget(
                          '${_formatDuration(provider.position)} / ${_formatDuration(provider.duration)}',
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize,
                          color: AppColors.white,
                        ),
                      ),
                    if (provider.isInitialized &&
                        provider.errorMessage == null &&
                        provider.showControls)
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: GestureDetector(
                          onTap: provider.toggleFullScreen,
                          child: Icon(
                            provider.isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            color: AppColors.white,
                            size: 24,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: themeProvider.themeData.colorScheme.surface,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: provider.toggleControls,
                    child: Stack(
                      children: [
                        Container(
                          width: screenWidth,
                          height: videoHeight,
                          color: AppColors.blackColor,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              _buildVideoContent(provider, context),
                              if (provider.isInitialized &&
                                  provider.errorMessage == null &&
                                  provider.showControls)
                                GestureDetector(
                                  onTap: provider.togglePlayPause,
                                  child: Icon(
                                    provider.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: AppColors.white,
                                    size: 50,
                                  ),
                                ),
                              if (provider.showControls)
                                Positioned(
                                  top: 30,
                                  left: 10,
                                  right: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              AppIcons.favoriteIcon,
                                              color: Colors.white,
                                              width: 24,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              if (provider.isInitialized &&
                                                  provider.errorMessage ==
                                                      null) {
                                                _showSettingsModal(
                                                    context, provider);
                                              }
                                            },
                                            child: const Icon(
                                              Icons.settings,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              if (provider.isInitialized &&
                                  provider.errorMessage == null &&
                                  provider.showControls)
                                Positioned(
                                  bottom: 20,
                                  left: 10,
                                  child: textWidget(
                                    '${_formatDuration(provider.position)} / ${_formatDuration(provider.duration)}',
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.fontSize,
                                    color: AppColors.white,
                                  ),
                                ),
                              if (provider.isInitialized &&
                                  provider.errorMessage == null &&
                                  provider.showControls)
                                Positioned(
                                  bottom: 20,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: provider.toggleFullScreen,
                                    child: Icon(
                                      provider.isFullScreen
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen,
                                      color: AppColors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (provider.isInitialized && provider.errorMessage == null)
                    VideoProgressBar(provider: provider),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                          'Triplet after 25 years of waiting',
                          fontSize:
                              Theme.of(context).textTheme.titleMedium?.fontSize,
                          fontWeight: FontWeight.w600,
                          color: themeProvider.themeData.colorScheme.onTertiary,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            textWidget(
                              'Child Birth',
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.fontSize,
                              color:
                                  themeProvider.themeData.colorScheme.tertiary,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: themeProvider
                                    .themeData.colorScheme.tertiary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            textWidget(
                              '504 Views',
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.fontSize,
                              color:
                                  themeProvider.themeData.colorScheme.tertiary,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: themeProvider
                                    .themeData.colorScheme.tertiary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            textWidget(
                              '18/6/2024',
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.fontSize,
                              color:
                                  themeProvider.themeData.colorScheme.tertiary,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: themeProvider
                                    .themeData.colorScheme.tertiary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const videoDetailsModal();
                                  },
                                );
                              },
                              child: textWidget(
                                'See Details',
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontSize,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                  color: themeProvider
                                      .themeData.colorScheme.outline,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppIcons.likeIcon2,
                                      width: 20,
                                      color: themeProvider
                                          .themeData.colorScheme.onTertiary,
                                    ),
                                    const SizedBox(width: 5),
                                    textWidget(
                                      '30',
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.fontSize,
                                      color: themeProvider
                                          .themeData.colorScheme.onTertiary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                  color: themeProvider
                                      .themeData.colorScheme.outline,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppIcons.shareIcon,
                                      width: 20,
                                      color: themeProvider
                                          .themeData.colorScheme.onTertiary,
                                    ),
                                    const SizedBox(width: 5),
                                    textWidget(
                                      'Share',
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.fontSize,
                                      color: themeProvider
                                          .themeData.colorScheme.onTertiary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  lineWidget(
                      width: double.infinity,
                      color: themeProvider.themeData.colorScheme.outline),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            AppIcons.itestifyIcon,
                            width: 30,
                          ),
                        ),
                        const SizedBox(width: 5),
                        textWidget(
                          'iTestified',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  lineWidget(
                      width: double.infinity,
                      color: themeProvider.themeData.colorScheme.outline),
                  const SizedBox(height: 5),
                  commentSection(context),
                  const SizedBox(height: 15),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isLargeScreen =
                          constraints.maxWidth > 800; // Tablet & desktop
                      return isLargeScreen
                          ? SizedBox(
                              height: 600,
                              child: largeScreenGrid(
                                context,
                                const videoTestimoniesContainer2(
                                  videoContainerHeight: 250,
                                  fix: BoxFit.fill,
                                  imageHeight: 180,
                                  playArrowLeftPosition: 130,
                                  playArrowTopPosition: 50,
                                  itestifyIconTopPosition: 150,
                                ),
                              ),
                            )
                          : mainList(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSettingsModal(BuildContext context, VideoPlayerProvider provider) {
    var themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Container(
          width: double.infinity,
          height: 126,
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              _buildSettingsRow(
                context,
                iconAsset: AppIcons.videoQualityIcon,
                label: 'Quality',
                value: provider.selectedQuality,
                onTap: () {
                  _showExpandedSettingsModal(context, provider,
                      isQuality: true);
                },
              ),
              const SizedBox(height: 10),
              _buildSettingsRow(
                context,
                iconAsset: AppIcons.videoPlaybackIcon,
                label: 'Playback Speed',
                value: '${provider.playbackSpeed}x',
                onTap: () {
                  _showExpandedSettingsModal(context, provider,
                      isQuality: false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsRow(
    BuildContext context, {
    required String iconAsset,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              color: themeProvider.themeData.colorScheme.onTertiary,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10),
            textWidget(
              label,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            const Spacer(),
            textWidget(
              value,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.themeData.colorScheme.onTertiary,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  void _showExpandedSettingsModal(
      BuildContext context, VideoPlayerProvider provider,
      {required bool isQuality}) {
    var themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    final qualityOptions = ['360p', '720p', '1080p', '480p'];
    final speedOptions = [
      '0.25x',
      '0.5x',
      '0.75x',
      '1x',
      '1.25x',
      '1.5x',
      '1.75x',
      '2x'
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return Container(
          width: double.infinity,
          height: 393,
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.outline,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: textWidget(
                  isQuality ? 'Quality' : 'Playback Speed',
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                ),
              ),
              Expanded(
                child: ListView(
                  children: (isQuality ? qualityOptions : speedOptions)
                      .map((option) => _buildOptionRow(
                            context,
                            option: option,
                            isSelected: isQuality
                                ? option == provider.selectedQuality
                                : option == '${provider.playbackSpeed}x',
                            onTap: () {
                              if (isQuality) {
                                provider.setQuality(option);
                              } else {
                                provider.setPlaybackSpeed(
                                    double.parse(option.replaceAll('x', '')));
                              }
                              Navigator.pop(modalContext);
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionRow(
    BuildContext context, {
    required String option,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(width: 10),
            textWidget(
              option,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(
      VideoPlayerProvider provider, BuildContext context) {
    if (provider.isInitialized && provider.errorMessage == null) {
      return VideoPlayer(provider.controller);
    } else if (provider.errorMessage != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget(
            'Error loading video',
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            color: AppColors.white,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => provider.retry(videoUrl),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: textWidget(
              'Retry',
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: AppColors.white,
            ),
          ),
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class VideoProgressBar extends StatelessWidget {
  final VideoPlayerProvider provider;

  const VideoProgressBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null) return;
        final localPosition = box.globalToLocal(details.globalPosition);
        final fraction = localPosition.dx / box.size.width;
        final newPosition = provider.duration * fraction.clamp(0.0, 1.0);
        provider.seekTo(newPosition);
      },
      onTapDown: (details) {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null) return;
        final localPosition = box.globalToLocal(details.globalPosition);
        final fraction = localPosition.dx / box.size.width;
        final newPosition = provider.duration * fraction.clamp(0.0, 1.0);
        provider.seekTo(newPosition);
      },
      child: Container(
        height: 4,
        color: Colors.white,
        child: LinearProgressIndicator(
          value: provider.duration.inSeconds > 0
              ? provider.position.inSeconds / provider.duration.inSeconds
              : 0.0,
          backgroundColor: Colors.transparent,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          minHeight: 4,
        ),
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.heroIndex});
  final int heroIndex;

  static const routeName = 'video-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    // Map heroIndex to video URL
    final videoUrls = {};
    final videoUrl = videoUrls[heroIndex] ??
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: VideoPlayerWidget(videoUrl: videoUrl),
    );
  }
}

Widget mainList(BuildContext context) {
  return Column(
    children: [relatedVideosSection(context)],
  );
}

Widget relatedVideosSection(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Column(
    children: [
     
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Align(
            alignment: Alignment.topLeft,
            child: textWidget(
              "Related Videos",
              fontSize: 18,
              color: themeProvider.themeData.colorScheme.onTertiary,
              fontWeight: FontWeight.w500,
            )),
      ),
      const SizedBox(height: 10),
      SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const FadeInTransitionWidget(
                    child: videoTestimoniesContainer2(
                        fix: BoxFit.cover,
                        imageHeight: 150,
                        playArrowLeftPosition: 130,
                        playArrowTopPosition: 50,
                        itestifyIconTopPosition: 150),
                  ),
                );
              })),
    ],
  );
}


