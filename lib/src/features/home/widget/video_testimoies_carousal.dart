import 'package:flutter/material.dart';
import 'package:itestified/src/features/animations/scale_animations.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';

class VideoTestimoniesCarousel extends StatefulWidget {
  const VideoTestimoniesCarousel({super.key});

  @override
  _VideoTestimoniesCarouselState createState() =>
      _VideoTestimoniesCarouselState();
}

class _VideoTestimoniesCarouselState extends State<VideoTestimoniesCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
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
    return LayoutBuilder(builder: (context, constraints) {
      bool isLargeScreen = constraints.maxWidth > 600;
      return SizedBox(
        height: isLargeScreen ? 630 : 250, 
        child: PageView.builder(
          allowImplicitScrolling: true,
          controller: _pageController,

itemBuilder: (context, index) {
  bool isActive = index == _currentPage;

  return ScaleAnimationsWidget(
    isActive: isActive,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: isActive ? 5 : 16,
      ),
      child: Hero(
        tag: index,
        child: videoTestimoniesContainer2(
          videoContainerHeight: isLargeScreen ? 500 : 230,
          videoContainerWidth: constraints.maxWidth * 0.85,
          firstTextSize: Theme.of(context).textTheme.titleMedium?.fontSize,
          secondTextSize: Theme.of(context).textTheme.labelSmall?.fontSize,
          fix: BoxFit.fill,
          imageHeight: isLargeScreen ? 350 : 150,
          videoId: index, 
        ),
      ),
    ),
  
            );
          },
        ),
      );
    });
  }
}