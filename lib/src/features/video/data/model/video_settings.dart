import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/view_model/video_player_provider.dart';
import 'package:provider/provider.dart';

class SettingsModal {
  static void show(BuildContext context, VideoViewModel provider) {
    final themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Container(
          height: 126,
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              _buildSettingsRow(
                context,
                iconAsset: AppIcons.videoQualityIcon,
                label: 'Quality',
                value: provider.selectedQuality,
                onTap: () => _showExpandedSettingsModal(context, provider, isQuality: true),
              ),
              const SizedBox(height: 10),
              _buildSettingsRow(
                context,
                iconAsset: AppIcons.videoPlaybackIcon,
                label: 'Playback Speed',
                value: '${provider.playbackSpeed}x',
                onTap: () => _showExpandedSettingsModal(context, provider, isQuality: false),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildSettingsRow(
    BuildContext context, {
    required String iconAsset,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              color: themeProvider.themeData.colorScheme.onTertiary,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10),
            textWidget(
              label,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            const Spacer(),
            textWidget(
              value,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.themeData.colorScheme.onTertiary,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  static void _showExpandedSettingsModal(
      BuildContext context, VideoViewModel provider, {required bool isQuality}) {
    final themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    final qualityOptions = ['360p', '480p', '720p', '1080p'];
    final speedOptions = ['0.25x', '0.5x', '0.75x', '1x', '1.25x', '1.5x', '2x'];
    // Use the same video URL for testing (replace with actual URLs in production)
    final qualityUrls = {
      '360p': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      '480p': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      '720p': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      '1080p': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return Container(
          width: double.infinity,
          height: 393,
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.outline,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: textWidget(
                  isQuality ? 'Quality' : 'Playback Speed',
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                ),
              ),
              Expanded(
                child: ListView(
                  children: (isQuality ? qualityOptions : speedOptions)
                      .map((option) => _buildOptionRow(
                            context,
                            option: option,
                            isSelected: isQuality
                                ? option == provider.selectedQuality
                                : option == '${provider.playbackSpeed}x',
                            onTap: () {
                              print('Selected ${isQuality ? 'quality' : 'speed'}: $option');
                              if (isQuality) {
                                provider.setQuality(
                                  option,
                                  qualityUrls[option] ?? provider.controller?.dataSource ?? '',
                                );
                              } else {
                                provider.setPlaybackSpeed(
                                  double.parse(option.replaceAll('x', '')),
                                );
                              }
                              Navigator.pop(modalContext);
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOptionRow(
    BuildContext context, {
    required String option,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(width: 10),
            textWidget(
              option,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
          ],
        ),
      ),
    );
  }
}