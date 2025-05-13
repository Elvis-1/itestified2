import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/category/presentation/widgets/video_testimonies_container.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  static const routeName = '/video-list-screen';

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<VideoWrittenTestimoniesViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar('Video Testimonies', context),
      body: Container(
        color: themeProvider.themeData.colorScheme.surface,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLargeScreen = constraints.maxWidth > 600;
              final crossAxisCount = viewModel.getGridCrossAxisCount(context);
              const itemCount = 10;

              return isLargeScreen
                  ? _buildGridLayout(
                      context, viewModel, crossAxisCount, itemCount)
                  : _buildListLayout(context, viewModel, itemCount);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridLayout(BuildContext context,
      VideoWrittenTestimoniesViewModel viewModel, int crossAxisCount, int itemCount) {
    final padding = viewModel.getPadding(context);
    final margin = viewModel.getMargin(context);

    return GridView.builder(
      padding: EdgeInsets.all(padding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: margin,
        mainAxisSpacing: margin,
        childAspectRatio: viewModel.getContainerWidth(context) /
            viewModel.getContainerHeight(context, true), // isVideoMode = true
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return FadeInTransitionWidget(
          child: _buildTestimonyItem(context, viewModel, index),
        );
      },
    );
  }

  Widget _buildListLayout(
      BuildContext context, VideoWrittenTestimoniesViewModel viewModel, int itemCount) {
    final padding = viewModel.getPadding(context);
    final margin = viewModel.getMargin(context);

    return ListView.builder(
      padding: EdgeInsets.all(padding),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: margin),
          child: FadeInTransitionWidget(
            child: _buildTestimonyItem(context, viewModel, index),
          ),
        );
      },
    );
  }

  Widget _buildTestimonyItem(
      BuildContext context, VideoWrittenTestimoniesViewModel viewModel, int index) {
    return VideoTestimonyContainer2(
      videoId: index + 1,
      containerWidth: viewModel.getContainerWidth(context),
      containerHeight: viewModel.getContainerHeight(context, true), // isVideoMode = true
      borderRadius: viewModel.getBorderRadius(context),
      imageHeightRatio: 0.55,
    );
  }
}