import 'package:flutter/material.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';

import 'package:provider/provider.dart';

import '../widgets/video_player_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.heroIndex});
  final int heroIndex;

  static const routeName = 'video-screen';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    const videoUrl = 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'; 

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: VideoPlayerWidget(videoUrl: videoUrl),
    );
  }
}