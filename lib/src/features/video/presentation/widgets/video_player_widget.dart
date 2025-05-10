import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:itestified/src/features/video/data/model/video_settings.dart';
import 'package:itestified/src/features/video/presentation/widgets/related_video.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_progress_bar.dart';
import 'package:itestified/src/features/video/view_model/video_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../utiils/format_utils.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = VideoViewModel();
    print('VideoPlayerWidget initState: ${_viewModel.hashCode}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _viewModel.setVideoUrl(widget.videoUrl);
      }
    });
  }

  @override
  void dispose() {
    print('VideoPlayerWidget disposing: ${_viewModel.hashCode}');
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final videoHeight = screenWidth * (9 / 16);

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Selector<
          VideoViewModel,
          ({
            bool isFullScreen,
            bool isInitialized,
            String? errorMessage,
            bool showControls
          })>(
        selector: (_, provider) => (
          isFullScreen: provider.isFullScreen,
          isInitialized: provider.isInitialized,
          errorMessage: provider.errorMessage,
          showControls: provider.showControls,
        ),
        builder: (context, data, _) {
          print(
              'VideoPlayerWidget rebuilding: ${_viewModel.hashCode}, showControls: ${data.showControls}, isPlaying: ${_viewModel.isPlaying}');
          if (data.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(data.errorMessage!)),
              );
            });
          }
          return data.isFullScreen
              ? WillPopScope(
                  onWillPop: () async {
                    if (data.isFullScreen) {
                      _viewModel.toggleFullScreen();
                      return false;
                    }
                    return true;
                  },
                  child: _buildFullScreenPlayer(context, _viewModel, data),
                )
              : _buildNormalScreenPlayer(context, _viewModel, videoHeight, data);
        },
      ),
    );
  }

  Widget _buildFullScreenPlayer(
      BuildContext context,
      VideoViewModel provider,
      ({
        bool isFullScreen,
        bool isInitialized,
        String? errorMessage,
        bool showControls
      }) data) {
    return GestureDetector(
      onTap: provider.toggleControls,
      child: Container(
        color: AppColors.blackColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildVideoContent(provider, context),
            if (data.isInitialized &&
                data.errorMessage == null &&
                data.showControls)
              _buildPlayPauseButton(provider),
            if (data.showControls) _buildTopControls(context, provider),
            if (data.isInitialized &&
                data.errorMessage == null &&
                data.showControls)
              _buildBottomControls(context, provider),
            if (data.errorMessage != null)
              _buildErrorContent(context, provider),
          ],
        ),
      ),
    );
  }

  Widget _buildNormalScreenPlayer(
      BuildContext context,
      VideoViewModel provider,
      double videoHeight,
      ({
        bool isFullScreen,
        bool isInitialized,
        String? errorMessage,
        bool showControls
      }) data) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    print('NormalScreenPlayer backgroundColor: ${themeProvider.themeData.colorScheme.surface}');
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface, 
      body: SafeArea(
        child: ListView(
          children: [
            _buildVideoContainer(context, provider, videoHeight, data),
            if (data.isInitialized && data.errorMessage == null)
              VideoProgressBar(provider: provider),
            _buildVideoInfo(context),
            _buildActionButtons(context),
            _buildAppLogo(context),
            _buildCommentSection(context),
            _buildRelatedVideos(context),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContainer(
      BuildContext context,
      VideoViewModel provider,
      double videoHeight,
      ({
        bool isFullScreen,
        bool isInitialized,
        String? errorMessage,
        bool showControls
      }) data) {
    return GestureDetector(
      onTap: provider.toggleControls,
      child: SizedBox(
        width: double.infinity,
        height: videoHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: AppColors.blackColor,
              child: _buildVideoContent(provider, context),
            ),
            if (data.isInitialized &&
                data.errorMessage == null &&
                data.showControls)
              _buildPlayPauseButton(provider),
            if (data.showControls) _buildTopControls(context, provider),
            if (data.isInitialized &&
                data.errorMessage == null &&
                data.showControls)
              _buildBottomControls(context, provider),
            if (data.errorMessage != null)
              _buildErrorContent(context, provider),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton(VideoViewModel provider) {
    return Selector<VideoViewModel, bool>(
      selector: (_, provider) => provider.isPlaying,
      builder: (context, isPlaying, _) {
        print(
            'Rebuilding play/pause button, isPlaying: $isPlaying, showControls: ${provider.showControls}');
        return GestureDetector(
          onTap: provider.togglePlayPause,
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: AppColors.white,
            size: 50,
          ),
        );
      },
    );
  }

  Widget _buildTopControls(BuildContext context, VideoViewModel provider) {
    return Positioned(
      top: 30,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              print(
                  'Back button tapped, isFullScreen: ${provider.isFullScreen}');
              if (provider.isFullScreen) {
                provider.toggleFullScreen();
              } else if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
            ;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No screen to go back to')),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                provider.isFullScreen ? Icons.arrow_back : Icons.arrow_back_ios,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('Favorite button tapped');
                },
                child: Image.asset(
                  AppIcons.favoriteIcon,
                  color: AppColors.white,
                  width: 24,
                ),
              ),
              const SizedBox(width: 10),
              if (provider.isInitialized && provider.errorMessage == null)
                GestureDetector(
                  onTap: () {
                    print('Settings icon tapped');
                    SettingsModal.show(context, provider);
                  },
                  child: const Icon(
                    Icons.settings,
                    color: AppColors.white,
                    size: 24,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(BuildContext context, VideoViewModel provider) {
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Selector<VideoViewModel, ({Duration position, Duration duration})>(
            selector: (_, provider) =>
                (position: provider.position, duration: provider.duration),
            builder: (context, data, _) {
              print('Rebuilding timer: ${data.position} / ${data.duration}');
              return textWidget(
                '${formatDuration(data.position)} / ${formatDuration(data.duration)}',
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: AppColors.white,
              );
            },
          ),
          GestureDetector(
            onTap: provider.toggleFullScreen,
            child: Icon(
              provider.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
              color: AppColors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoContent(VideoViewModel provider, BuildContext context) {
    if (provider.isInitialized && provider.errorMessage == null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: provider.controller!.value.aspectRatio != 0
                ? provider.controller!.value.aspectRatio
                : 16 / 9,
            child: VideoPlayer(provider.controller!),
          ),
          if (provider.isBuffering)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
        ],
      );
    } else if (provider.errorMessage != null) {
      return _buildErrorContent(context, provider);
    }
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, VideoViewModel provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          provider.errorMessage ?? 'Error loading video',
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: AppColors.white,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => provider.retry(widget.videoUrl),
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          child: textWidget(
            'Retry',
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            'Triplet after 25 years of waiting',
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
            fontWeight: FontWeight.w600,
            color: themeProvider.themeData.colorScheme.onTertiary,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              textWidget(
                'Child Birth',
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
              const SizedBox(width: 5),
              _buildDot(themeProvider),
              const SizedBox(width: 5),
              textWidget(
                '504 Views',
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
              const SizedBox(width: 5),
              _buildDot(themeProvider),
              const SizedBox(width: 5),
              textWidget(
                '18/6/2024',
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
              const SizedBox(width: 5),
              _buildDot(themeProvider),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const videoDetailsModal(),
                  );
                },
                child: textWidget(
                  'See Details',
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(ThemeViewmodel themeProvider) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: themeProvider.themeData.colorScheme.tertiary,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildActionButton(
            context,
            icon: AppIcons.likeIcon2,
            label: '30',
            onTap: () {},
            themeProvider: themeProvider,
          ),
          const SizedBox(width: 15),
          _buildActionButton(
            context,
            icon: AppIcons.shareIcon,
            label: 'Share',
            onTap: () {},
            themeProvider: themeProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String icon,
    required String label,
    required VoidCallback onTap,
    required ThemeViewmodel themeProvider,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: themeProvider.themeData.colorScheme.outline,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            const SizedBox(width: 5),
            textWidget(
              label,
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppLogo(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15,top: 10),
          child: Row(
            children: [
           
              Image.asset(AppIcons.itestifyIcon, width: 30),
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
          color: themeProvider.themeData.colorScheme.outline,
        ),
      ],
    );
  }

  Widget _buildCommentSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        commentSection(context),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildRelatedVideos(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth > 800;
        return isLargeScreen
            ? SizedBox(
                height: 600,
                child: largeScreenGrid(
                  context,
                  const VideoTestimonyContainer1(videoId: 1),
                ),
              )
            : mainList(context);
      },
    );
  }
}