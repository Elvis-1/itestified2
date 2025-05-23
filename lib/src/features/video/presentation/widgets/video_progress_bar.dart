import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/view_model/video_player_provider.dart';
import 'package:provider/provider.dart';

class VideoProgressBar extends StatelessWidget {
  const VideoProgressBar({super.key, required this.provider});

  final VideoViewModel provider;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box == null) return;
            final localPosition = box.globalToLocal(details.globalPosition);
            final fraction = localPosition.dx / box.size.width;
            final newPosition = provider.duration * fraction.clamp(0.0, 1.0);
            provider.seekTo(newPosition);
          },
          onTapDown: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box == null) return;
            final localPosition = box.globalToLocal(details.globalPosition);
            final fraction = localPosition.dx / box.size.width;
            final newPosition = provider.duration * fraction.clamp(0.0, 1.0);
            provider.seekTo(newPosition);
          },
          child: Container(
            height: 4,
            color: themeProvider.themeData.colorScheme.surface,
            child: LinearProgressIndicator(
              value: provider.duration.inSeconds > 0
                  ? provider.position.inSeconds / provider.duration.inSeconds
                  : 0.0,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: 4,
            ),
          ),
        ),
        if (provider.isBuffering)
          const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
      ],
    );
  }
}