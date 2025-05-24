import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/home/widget/video_testimoies_carousal.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'home_screen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  static const double contentSpacing = 16.0; 
  static const double headerSpacing = 8.0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        print('HomeScreen: Loading complete, isLoading=false');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<HomeScreenViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    final isGuest = authProvider.isGuest;

    print('HomeScreen: Building, isLoading=$_isLoading');

    return Scaffold(
      appBar: generalAppBar2(context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final margin = viewModel.getMargin(context);
            final isLargeScreen = viewModel.isLargeScreen(context);

            return Container(
              margin: EdgeInsets.symmetric(horizontal: margin, vertical: 5),
              child: _isLoading
                  ? _buildShimmerLayout(context, viewModel, isLargeScreen, themeProvider)
                  : isLargeScreen
                      ? _buildLargeScreenLayout(context, viewModel)
                      : _buildSmallScreenLayout(context, viewModel),
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLayout(
      BuildContext context, HomeScreenViewModel viewModel, bool isLargeScreen, ThemeViewmodel themeProvider) {
    final baseColor = themeProvider.themeData.brightness == Brightness.light
        ? Colors.grey[300]!
        : Colors.grey[800]!;
    final highlightColor = themeProvider.themeData.brightness == Brightness.light
        ? Colors.grey[100]!
        : Colors.grey[600]!;

    return isLargeScreen
        ? _buildShimmerLargeScreenLayout(context, viewModel, baseColor, highlightColor)
        : _buildShimmerSmallScreenLayout(context, viewModel, baseColor, highlightColor);
  }

  Widget _buildShimmerSmallScreenLayout(
      BuildContext context, HomeScreenViewModel viewModel, Color baseColor, Color highlightColor) {
    final padding = viewModel.getPadding(context);
    final scriptureWidth = viewModel.getScriptureContainerWidth(context);
    final scriptureHeight = viewModel.getScriptureContainerHeight(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          const SizedBox(height: contentSpacing),
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: _buildShimmerScripture(context, viewModel, scriptureWidth, scriptureHeight),
          ),
          const SizedBox(height: headerSpacing),
          _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
          const SizedBox(height: headerSpacing),
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: SizedBox(
              height: viewModel.getVideoCarouselHeight(context),
              child: _buildShimmerCarousel(context, viewModel),
            ),
          ),
          const SizedBox(height: headerSpacing),
          _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
          const SizedBox(height: headerSpacing),
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: SizedBox(
              height: viewModel.config.textTestimonyHeight,
              child: _buildShimmerTestimonyList(context, viewModel),
            ),
          ),
          const SizedBox(height: headerSpacing),
          _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
          const SizedBox(height: headerSpacing),
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: SizedBox(
              height: viewModel.config.quotesHeight,
              child: _buildShimmerQuotesList(context, viewModel),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLargeScreenLayout(
      BuildContext context, HomeScreenViewModel viewModel, Color baseColor, Color highlightColor) {
    final padding = viewModel.getPadding(context);
    final scriptureWidth = viewModel.getScriptureContainerWidth(context);
    final scriptureHeight = viewModel.getScriptureContainerHeight(context);
    final videoCarouselHeight = viewModel.getVideoCarouselHeight(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                const SizedBox(height: contentSpacing),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: _buildShimmerScripture(context, viewModel, scriptureWidth, scriptureHeight),
                ),
                const SizedBox(height: headerSpacing),
                _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
                const SizedBox(height: headerSpacing),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: SizedBox(
                    height: viewModel.config.textTestimonyHeight * 1.2,
                    child: _buildShimmerTestimonyList(context, viewModel, isLargeScreen: true),
                  ),
                ),
                const SizedBox(height: headerSpacing),
                _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
                const SizedBox(height: headerSpacing),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: SizedBox(
                    height: viewModel.config.quotesHeight * 1.2,
                    child: _buildShimmerQuotesList(context, viewModel),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: headerSpacing),
              _buildShimmerSectionHeader(context, viewModel, baseColor, highlightColor),
              const SizedBox(height: headerSpacing),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: SizedBox(
                  height: videoCarouselHeight,
                  child: _buildShimmerCarousel(context, viewModel),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerScripture(BuildContext context, HomeScreenViewModel viewModel,
      double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            viewModel.getScriptureContainerBorderRadius(context)),
      ),
    );
  }

  Widget _buildShimmerSectionHeader(
      BuildContext context, HomeScreenViewModel viewModel, Color baseColor, Color highlightColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              width: 150,
              height: 14,
              color: Colors.white,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: 50,
            height: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerCarousel(
      BuildContext context, HomeScreenViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 345, // Match VideoTestimonyContainer1
            height: viewModel.getVideoCarouselHeight(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerTestimonyList(
      BuildContext context, HomeScreenViewModel viewModel, {bool isLargeScreen = false}) {
    final width = isLargeScreen ? MediaQuery.of(context).size.width * 0.94 : 282.0;
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: width,
              height: isLargeScreen
                  ? viewModel.config.textTestimonyHeight * 1.2
                  : viewModel.config.textTestimonyHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerQuotesList(
      BuildContext context, HomeScreenViewModel viewModel) {
    final width = MediaQuery.of(context).size.width * 0.94; // Dynamic width
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: width,
            height: viewModel.config.quotesHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSmallScreenLayout(
      BuildContext context, HomeScreenViewModel viewModel) {
    final padding = viewModel.getPadding(context);
    final textScale = viewModel.getTextScale(context);
    final scriptureWidth = viewModel.getScriptureContainerWidth(context);
    final scriptureHeight = viewModel.getScriptureContainerHeight(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextWidgets.textWidget16(
              context,
              'Scripture of the day',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: contentSpacing),
          _buildScriptureContainer(
              context, viewModel, scriptureWidth, scriptureHeight, padding),
          const SizedBox(height: headerSpacing),
          _buildSectionHeader(
            context,
            viewModel,
            "Trending Video testimonies",
            viewModel.gotoVideoListScreen,
            textScale,
          ),
          const SizedBox(height: headerSpacing),
          SizedBox(
            height: viewModel.getVideoCarouselHeight(context),
            child: const VideoTestimoniesCarousel(
              
            ),
          ),
          const SizedBox(height: headerSpacing),
          _buildSectionHeader(
            context,
            viewModel,
            "Written testimonies",
            viewModel.gotoWrittenTestimonies,
            textScale,
          ),
          const SizedBox(height: headerSpacing),
          SizedBox(
            height: viewModel.config.textTestimonyHeight,
            child: _buildHorizontalList(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextTestimonyContainer(
                  containerWidth: screenWidth * 0.70,
                  containerHeight: 149,
                  borderRadius: 16,
                  padding: 12,
                  spacing: 12,
                  titleFontSize: 10,
                  textFontSize: 10,
                  categoryFontSize: 9,
                  userIconSize: 20,
                  isHomeScreen: true,
                  index: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: headerSpacing),
          _buildSectionHeader(
            context,
            viewModel,
            "Inspirational Quotes",
            viewModel.gotoInspirationalQuotes,
            textScale,
          ),
          const SizedBox(height: headerSpacing),
          SizedBox(
            height: viewModel.config.quotesHeight,
            child: _buildHorizontalList(
              quoteContainer(
                height: 162.0,
                index: 1,
                margin: const EdgeInsets.symmetric(horizontal: 9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeScreenLayout(
      BuildContext context, HomeScreenViewModel viewModel) {
    final padding = viewModel.getPadding(context);
    final textScale = viewModel.getTextScale(context);
    final scriptureWidth = viewModel.getScriptureContainerWidth(context);
    final scriptureHeight = viewModel.getScriptureContainerHeight(context);
    final videoCarouselHeight = viewModel.getVideoCarouselHeight(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidgets.textWidget16(
                    context,
                    'Scripture of the day',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: contentSpacing),
                _buildScriptureContainer(context, viewModel, scriptureWidth,
                    scriptureHeight, padding),
                const SizedBox(height: headerSpacing),
                _buildSectionHeader(
                  context,
                  viewModel,
                  "Trending Text testimonies",
                  viewModel.gotoWrittenTestimonies,
                  textScale,
                ),
                const SizedBox(height: headerSpacing),
                SizedBox(
                  height: viewModel.config.textTestimonyHeight * 1.2,
                  child: _buildHorizontalList(
                    TextTestimonyContainer(
                      containerWidth: screenWidth * 0.94,
                      containerHeight: viewModel.config.textTestimonyHeight,
                      borderRadius: 16.0,
                      index: 1,
                    ),
                  ),
                ),
                const SizedBox(height: headerSpacing),
                _buildSectionHeader(
                  context,
                  viewModel,
                  "Inspirational Quotes",
                  viewModel.gotoInspirationalQuotes,
                  textScale,
                ),
                const SizedBox(height: headerSpacing),
                SizedBox(
                  height: viewModel.config.quotesHeight * 1.2,
                  child: _buildHorizontalList(
                    quoteContainer(
                      height: 162.0 * 1.2, // Scale with layout
                      index: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                context,
                viewModel,
                "Trending Video testimonies",
                viewModel.gotoVideoListScreen,
                textScale,
              ),
              const SizedBox(height: headerSpacing),
              SizedBox(
                height: videoCarouselHeight,
                child: const VideoTestimoniesCarousel(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScriptureContainer(
      BuildContext context,
      HomeScreenViewModel viewModel,
      double width,
      double height,
      double padding) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.scriptureImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(
                viewModel.getScriptureContainerBorderRadius(context)),
            color: AppColors.darkPurple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextWidgets.textWidget16(
                      context,
                      'Jeremiah 29:11',
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(width: padding * 0.4),
                  TextWidgets.textWidget10(
                    context,
                    'KJV',
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: TextWidgets.textWidget12(
                    context,
                    '"For I know the thoughts that I think towards you, saith the Lord, thoughts of peace and not of evil, to give you an expected end"',
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TextWidgets.textWidget12(
                context,
                "Prayers: Lord guide me according to your will and plan",
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(
      BuildContext context,
      HomeScreenViewModel viewModel,
      String title,
      Function(BuildContext) onTap,
      double textScale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextWidgets.textWidget14(
            context,
            title,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () => onTap(context),
          child: TextWidgets.textWidget12(context, "See all"),
        ),
      ],
    );
  }

  Widget _buildHorizontalList(Widget child) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, i) => child,
      ),
    );
  }
}