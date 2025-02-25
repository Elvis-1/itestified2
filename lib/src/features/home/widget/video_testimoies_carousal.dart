import 'package:flutter/material.dart';
import 'package:itestified/src/features/animations/scale_animations.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';

class VideoTestimoniesCarousel extends StatefulWidget {
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
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      bool isLargeScreen = contraints.maxWidth > 600;
      return SizedBox(
        height: isLargeScreen ? 630 : 250, // Adjust based on your needs
        child: PageView.builder(
          allowImplicitScrolling: true,
          controller: _pageController,
          itemCount: 5, // Number of videos
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            bool isActive = index == _currentPage;

            return ScaleAnimationsWidget(
              isActive: isActive,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isActive ? 5 : 10,
                ),
                child: Hero(
                  tag: index,
                  child: videoTestimoniesContainer2(
                    videoContainerHeight: isLargeScreen ? 500 : 100,
                    videoContainerWidth: 350,

                    fix: BoxFit.cover,
                    imageHeight: isLargeScreen ? 500 : 150,
                    //  itestifyIconTopPosition: 150
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
