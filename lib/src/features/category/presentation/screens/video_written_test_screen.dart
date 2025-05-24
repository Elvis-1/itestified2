import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/icon_and_text.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class VideoAndWrittenTestimonieScreen extends StatefulWidget {
  const VideoAndWrittenTestimonieScreen({super.key});
  static const routeName = '/vid-written-testimonies';

  @override
  _VideoAndWrittenTestimonieScreenState createState() =>
      _VideoAndWrittenTestimonieScreenState();
}

class _VideoAndWrittenTestimonieScreenState
    extends State<VideoAndWrittenTestimonieScreen> {
  bool _isVideoMode = true;

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<VideoWrittenTestimoniesViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar('Healing Testimonies', context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen =
              constraints.maxWidth > viewModel.config.mobileBreakpoint;
          final margin = viewModel.getMargin(context);
          final horizontalPadding = viewModel.getHorizontalPadding(context);
          final iconSize = viewModel.getIconSize(context);

          return
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.opaqueBlack),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: viewModel.getPadding(context)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _isVideoMode = true),
                            child: iconAndText(
                              "Videos",
                              Icon(Symbols.slideshow, size: iconSize),
                              _isVideoMode
                                  ? AppColors.primaryColor
                                  : themeProvider.themeData.colorScheme.surface,
                              context,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => _isVideoMode = false),
                            child: iconAndText(
                              "Text",
                              Icon(Symbols.article, size: iconSize),
                              !_isVideoMode
                                  ? AppColors.primaryColor
                                  : themeProvider.themeData.colorScheme.surface,
                              context,
                            ),
                          ),
                        ],
                      ),
                      lineWidget(
                          width: double.infinity,
                          color: themeProvider.themeData.colorScheme.tertiary,
                          height: 0.5)
                    ],
                  ),
                ),
                Expanded(
                  child: isLargeScreen
                      ? _buildLargeScreenGrid(
                          context, viewModel, constraints, _isVideoMode)
                      : _buildSmallScreenList(
                          context, viewModel, constraints, _isVideoMode),
                ),
              ],
            );
        }
    ));
  }

  Widget _buildLargeScreenGrid(
      BuildContext context,
      VideoWrittenTestimoniesViewModel viewModel,
      BoxConstraints constraints,
      bool isVideoMode) {
    final margin = viewModel.getMargin(context);
    final horizontalPadding = viewModel.getHorizontalPadding(context);
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: margin / 2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: viewModel.getGridCrossAxisCount(context),
        crossAxisSpacing: margin,
        mainAxisSpacing: margin,
        childAspectRatio: viewModel.getContainerWidth(context) /
            viewModel.getContainerHeight(context, isVideoMode),
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildContainer(context, viewModel, index, isVideoMode);
      },
    );
  }

  Widget _buildSmallScreenList(
      BuildContext context,
      VideoWrittenTestimoniesViewModel viewModel,
      BoxConstraints constraints,
      bool isVideoMode) {
    final margin = viewModel.getMargin(context);
    final horizontalPadding = viewModel.getHorizontalPadding(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: margin / 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: margin),
          child: _buildContainer(context, viewModel, index, isVideoMode),
        );
      },
    );
  }

  Widget _buildContainer(BuildContext context,
      VideoWrittenTestimoniesViewModel viewModel, int index, bool isVideoMode) {
    final width = viewModel.getContainerWidth(context);
    final height = viewModel.getContainerHeight(context, isVideoMode);
    final borderRadius = viewModel.getBorderRadius(context);

    return ClipRect(
      child: GestureDetector(
        onTap: () =>
            viewModel.navigateToScreen(context, index + 1, isVideoMode),
        child: Align(
          child: Container(
            child: isVideoMode
                ? VideoTestimonyContainer3(
                    videoId: index + 1,
                  )
                : TextTestimonyContainer(
                    containerWidth: width,
                    containerHeight: height,
                    borderRadius: borderRadius,
                    index: index,
                  ),
          ),
        ),
      ),
    );
  }
}

class VideoWrittenTestimoniesViewModel {
  final VideoWrittenTestimoniesConfig config;

  VideoWrittenTestimoniesViewModel(
      {this.config = const VideoWrittenTestimoniesConfig()});

  double getContainerWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint)
      return config.baseContainerWidth * 1.5;
    if (width >= config.tabletBreakpoint)
      return config.baseContainerWidth * 1.2;
    return config.baseContainerWidth;
  }

  double getContainerHeight(BuildContext context, bool isVideoMode) {
    final width = MediaQuery.of(context).size.width;
    final baseHeight = isVideoMode
        ? config.baseVideoContainerHeight
        : config.baseTextContainerHeight;
    if (width >= config.desktopBreakpoint) return baseHeight * 1.5;
    if (width >= config.tabletBreakpoint) return baseHeight * 1.2;
    return baseHeight;
  }

  double getVideoImageHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final baseImageHeight = config.baseVideoImageHeight;
    if (width >= config.desktopBreakpoint) return baseImageHeight * 1.5;
    if (width >= config.tabletBreakpoint) return baseImageHeight * 1.2;
    return baseImageHeight;
  }

  double getBorderRadius(BuildContext context) {
    return config.baseBorderRadius;
  }

  double getMargin(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) return config.baseMargin * 1.5;
    if (width >= config.tabletBreakpoint) return config.baseMargin * 1.2;
    return config.baseMargin;
  }

  double getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint)
      return config.baseHorizontalPadding * 1.2;
    if (width >= config.tabletBreakpoint)
      return config.baseHorizontalPadding * 1.1;
    return config.baseHorizontalPadding;
  }

  double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) return config.basePadding * 1.2;
    if (width >= config.tabletBreakpoint) return config.basePadding * 1.1;
    return config.basePadding;
  }

  double getIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) return config.baseIconSize * 1.2;
    if (width >= config.tabletBreakpoint) return config.baseIconSize * 1.1;
    return config.baseIconSize;
  }

  double getTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor =
        MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseSize = width < config.mobileBreakpoint
        ? config.baseTextSize * 0.9
        : config.baseTextSize;
    final scaledSize = width >= config.desktopBreakpoint
        ? baseSize * 1.2
        : width >= config.tabletBreakpoint
            ? baseSize * 1.1
            : baseSize;
    return scaledSize * textScaleFactor;
  }

  int getGridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= config.desktopBreakpoint ? 3 : 2;
  }

  void navigateToScreen(BuildContext context, int heroIndex, bool isVideoMode) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => isVideoMode
            ? VideoScreen(heroIndex: heroIndex)
            : const MyTestimoniesDetailsScreen(),
      ),
    );
  }
}

@immutable
class VideoWrittenTestimoniesConfig {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final double baseContainerWidth;
  final double baseTextContainerHeight;
  final double baseVideoContainerHeight;
  final double baseVideoImageHeight;
  final double baseBorderRadius;
  final double baseMargin;
  final double baseHorizontalPadding;
  final double basePadding;
  final double baseIconSize;
  final double baseTextSize;

  const VideoWrittenTestimoniesConfig({
    this.mobileBreakpoint = 600,
    this.tabletBreakpoint = 800,
    this.desktopBreakpoint = 1200,
    this.baseContainerWidth = 345.0,
    this.baseTextContainerHeight = 162.0,
    this.baseVideoContainerHeight = 280.0,
    this.baseVideoImageHeight = 220.0,
    this.baseBorderRadius = 16.0,
    this.baseMargin = 8.0,
    this.baseHorizontalPadding = 10.0,
    this.basePadding = 10.0,
    this.baseIconSize = 24.0,
    this.baseTextSize = 16.0,
  });
}
