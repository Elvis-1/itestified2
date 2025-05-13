import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';

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

class VideoTestimoniesCarouselViewModel {
  final VideoTestimoniesCarouselConfig config;

  VideoTestimoniesCarouselViewModel({
    this.config = const VideoTestimoniesCarouselConfig(),
  });

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
}

class VideoTestimoniesCarousel extends StatefulWidget {
  const VideoTestimoniesCarousel({super.key});

  @override
  _VideoTestimoniesCarouselState createState() => _VideoTestimoniesCarouselState();
}

class _VideoTestimoniesCarouselState extends State<VideoTestimoniesCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    final viewModel = GetIt.I<VideoTestimoniesCarouselViewModel>();
    _pageController = PageController(viewportFraction: viewModel.config.baseViewportFraction);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!GetIt.I.isRegistered<VideoTestimoniesCarouselViewModel>()) {
      print('Error: VideoTestimoniesCarouselViewModel not registered in GetIt');
      return const Center(child: Text('Error: ViewModel not registered'));
    }

    final viewModel = GetIt.I<VideoTestimoniesCarouselViewModel>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: viewModel.getContainerHeight(context),
          child: PageView.builder(
            allowImplicitScrolling: true,
            controller: _pageController,
            itemCount: 5,
            padEnds: false,
            itemBuilder: (context, index) {
              final isActive = index == _currentPage;

              return AnimatedBuilder(
                animation: _pageController,
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
  }
}