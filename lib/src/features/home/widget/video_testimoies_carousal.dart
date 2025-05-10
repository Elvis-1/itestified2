import 'package:flutter/material.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';

import 'package:provider/provider.dart';

@immutable
class VideoTestimoniesCarouselConfig {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double baseContainerHeight;
  final double baseMarginHorizontal;
  final double baseViewportFraction;
  final double scaleFactorActive;
  final double scaleFactorInactive;

  const VideoTestimoniesCarouselConfig({
    this.mobileBreakpoint = 600,
    this.tabletBreakpoint = 800,
    this.baseContainerHeight = 215.0, // 185 (container) + 15 (margin) + 15 (buffer)
    this.baseMarginHorizontal = 4.0,
    this.baseViewportFraction = 0.6,
    this.scaleFactorActive = 1.0,
    this.scaleFactorInactive = 1.0,
  });
}

class VideoTestimoniesCarouselViewModel extends ChangeNotifier {
  final VideoTestimoniesCarouselConfig config;
  final PageController pageController;
  int _currentPage = 0;
  double _pageValue = 0;

  VideoTestimoniesCarouselViewModel({
    this.config = const VideoTestimoniesCarouselConfig(),
  }) : pageController = PageController(viewportFraction: config.baseViewportFraction) {
    pageController.addListener(() {
      _currentPage = pageController.page?.round() ?? 0;
      _pageValue = pageController.page ?? 0;
      notifyListeners();
    });
  }

  int get currentPage => _currentPage;
  double get pageValue => _pageValue;

  double getContainerHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) {
      return config.baseContainerHeight * 1.2;
    }
    return config.baseContainerHeight;
  }

  EdgeInsets getMargin(BuildContext context, bool isActive, int index) {
    final width = MediaQuery.of(context).size.width;
    final baseMargin = isActive
        ? config.baseMarginHorizontal * 0.25
        : config.baseMarginHorizontal;
    final scaledMargin = width >= config.tabletBreakpoint
        ? baseMargin * 1.2
        : baseMargin;

    return EdgeInsets.only(
      left: index == 0 ? scaledMargin * 0.5 : scaledMargin,
      right: scaledMargin,
    );
  }

  double getScaleFactor(int index) {
    return 1.0;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class VideoTestimoniesCarousel extends StatelessWidget {
  const VideoTestimoniesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoTestimoniesCarouselViewModel(),
      child: Consumer<VideoTestimoniesCarouselViewModel>(
        builder: (context, viewModel, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: viewModel.getContainerHeight(context),
                child: PageView.builder(
                  allowImplicitScrolling: true,
                  controller: viewModel.pageController,
                  itemCount: 5, 
                  padEnds: false,
                  itemBuilder: (context, index) {
                    final isActive = index == viewModel.currentPage;

                    return AnimatedBuilder(
                      animation: viewModel.pageController,
                      builder: (context, child) {
                        return Container(
                          margin: viewModel.getMargin(context, isActive, index),
                          child: VideoTestimonyContainer1(
                            videoId: index + 1,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}