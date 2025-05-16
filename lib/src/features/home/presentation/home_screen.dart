import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/home/widget/video_testimoies_carousal.dart';
import 'package:provider/provider.dart';

import 'home_screen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<HomeScreenViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    final isGuest = authProvider.isGuest;

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
              child: isLargeScreen
                  ? _buildLargeScreenLayout(context, viewModel)
                  : _buildSmallScreenLayout(context, viewModel),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSmallScreenLayout(
      BuildContext context, HomeScreenViewModel viewModel) {
    final padding = viewModel.getPadding(context);
    final textScale = viewModel.getTextScale(context);
    final scriptureWidth = viewModel.getScriptureContainerWidth(context);
    final scriptureHeight = viewModel.getScriptureContainerHeight(context);

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
          const SizedBox(height: 20),
          _buildScriptureContainer(
              context, viewModel, scriptureWidth, scriptureHeight, padding),
          const SizedBox(height: 15),
          _buildSectionHeader(
            context,
            viewModel,
            "Trending Video testimonies",
            viewModel.gotoVideoListScreen,
            textScale,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: viewModel.getVideoCarouselHeight(context),
            child: const VideoTestimoniesCarousel(),
          ),
          const SizedBox(height: 15),
          _buildSectionHeader(
            context,
            viewModel,
            "Written testimonies",
            viewModel.gotoWrittenTestimonies,
            textScale,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: viewModel.config.textTestimonyHeight,
            child: _buildHorizontalList(
              const FadeInTransitionWidget(
                  child: TextTestimonyContainer(
                containerWidth: 282,
                containerHeight: 149,
                borderRadius: 16,
                padding: 12,
                spacing: 12,
                titleFontSize: 10,
                textFontSize: 10,
                categoryFontSize: 9,
                userIconSize: 20,
                isHomeScreen: true,
              )),
            ),
          ),
          const SizedBox(height: 15),
          _buildSectionHeader(
            context,
            viewModel,
            "Inspirational Quotes",
            viewModel.gotoInspirationalQuotes,
            textScale,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: viewModel.config.quotesHeight,
            child: _buildHorizontalList(
              const FadeInTransitionWidget(child: quoteContainer()),
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
                const SizedBox(height: 20),
                _buildScriptureContainer(context, viewModel, scriptureWidth,
                    scriptureHeight, padding),
                const SizedBox(height: 15),
                _buildSectionHeader(
                  context,
                  viewModel,
                  "Trending Text testimonies",
                  viewModel.gotoWrittenTestimonies,
                  textScale,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: viewModel.config.textTestimonyHeight * 1.2,
                  child: _buildHorizontalList(
                    const FadeInTransitionWidget(
                        child: TextTestimonyContainer()),
                  ),
                ),
                const SizedBox(height: 15),
                _buildSectionHeader(
                  context,
                  viewModel,
                  "Inspirational Quotes",
                  viewModel.gotoInspirationalQuotes,
                  textScale,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: viewModel.config.quotesHeight * 1.2,
                  child: _buildHorizontalList(
                    const FadeInTransitionWidget(child: quoteContainer()),
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
              const SizedBox(height: 10),
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
