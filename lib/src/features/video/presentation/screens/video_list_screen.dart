import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/screens/video_written_test_screen.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  static const routeName = '/video-list-screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoWrittenTestimoniesViewModel(),
      child: Scaffold(
        appBar: generalAppbar('Video Testimonies', context),
        body: _VideoListContent(),
      ),
    );
  }
}

class _VideoListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final viewModel = Provider.of<VideoWrittenTestimoniesViewModel>(context);

    return Container(
      color: themeProvider.themeData.colorScheme.surface,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLargeScreen = constraints.maxWidth > 600;
            final crossAxisCount = viewModel.getGridCrossAxisCount(context);
            final itemCount = 10;

            return isLargeScreen
                ? _buildGridLayout(context, crossAxisCount, itemCount)
                : _buildListLayout(context, itemCount);
          },
        ),
      ),
    );
  }

  Widget _buildGridLayout(BuildContext context, int crossAxisCount, int itemCount) {
    final viewModel = Provider.of<VideoWrittenTestimoniesViewModel>(context);
    final padding = viewModel.getPadding(context);
    final margin = viewModel.getMargin(context);

    return GridView.builder(
      padding: EdgeInsets.all(padding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: margin,
        mainAxisSpacing: margin,
        childAspectRatio: 1.5, 
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return FadeInTransitionWidget(
          child: _buildTestimonyItem(context, index),
        );
      },
    );
  }

  Widget _buildListLayout(BuildContext context, int itemCount) {
    final viewModel = Provider.of<VideoWrittenTestimoniesViewModel>(context);
    final padding = viewModel.getPadding(context);
    final margin = viewModel.getMargin(context);

    return ListView.builder(
      padding: EdgeInsets.all(padding),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: margin),
          child: FadeInTransitionWidget(
            child: _buildTestimonyItem(context, index),
          ),
        );
      },
    );
  }

  Widget _buildTestimonyItem(BuildContext context, int index) {
    final viewModel = Provider.of<VideoWrittenTestimoniesViewModel>(context);
    
    return viewModel.isVideoMode
        ? VideoTestimonyContainer2(
            videoId: index + 1,
            containerWidth: viewModel.getContainerWidth(context),
            containerHeight: viewModel.getContainerHeight(context),
            borderRadius: viewModel.getBorderRadius(context),
            imageHeightRatio: 0.55,
          )
        : TextTestimonyContainer(
            containerWidth: viewModel.getContainerWidth(context),
            containerHeight: viewModel.getContainerHeight(context),
            borderRadius: viewModel.getBorderRadius(context),
            index: index,
          );
  }
}