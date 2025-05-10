import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/video_testimony_config.dart';

import 'package:provider/provider.dart';

class VideoTestimonyViewModel extends ChangeNotifier {
  final VideoTestimonyConfig config;
  final int videoId;

  VideoTestimonyViewModel({
    this.config = const VideoTestimonyConfig(),
    this.videoId = 1,
  });

  double getContainerWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseContainerWidth * 1.2;
    return config.baseContainerWidth;
  }

  double getContainerHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseContainerHeight * 1.2;
    return config.baseContainerHeight;
  }

  double getImageWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseImageWidth * 1.2;
    return config.baseImageWidth;
  }

  double getImageHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseImageHeight * 1.2;
    return config.baseImageHeight;
  }

  double getTitleTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseSize = width < 400 ? config.baseTitleTextSize * 0.9 : config.baseTitleTextSize;
    final scaledSize = width >= config.tabletBreakpoint ? baseSize * 1.1 : baseSize;
    return scaledSize * textScaleFactor;
  }

  double getSubtitleTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseSize = width < 400 ? config.baseSubtitleTextSize * 0.9 : config.baseSubtitleTextSize;
    final scaledSize = width >= config.tabletBreakpoint ? baseSize * 1.1 : baseSize;
    return scaledSize * textScaleFactor;
  }

  double getMetadataTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseSize = width < 400 ? config.baseMetadataTextSize * 0.9 : config.baseMetadataTextSize;
    final scaledSize = width >= config.tabletBreakpoint ? baseSize * 1.1 : baseSize;
    return scaledSize * textScaleFactor;
  }

  double getTimeTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseSize = width < 400 ? config.baseTimeTextSize * 0.9 : config.baseTimeTextSize;
    final scaledSize = width >= config.tabletBreakpoint ? baseSize * 1.1 : baseSize;
    return scaledSize * textScaleFactor;
  }

  double getFavoriteIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseFavoriteIconSize * 1.1;
    return config.baseFavoriteIconSize;
  }

  double getApologyIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseApologyIconSize * 1.1;
    return config.baseApologyIconSize;
  }

  double getMargin(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseMargin * 1.2;
    return config.baseMargin;
  }

  double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.basePadding * 1.1;
    return config.basePadding;
  }

  double getTextGap(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.tabletBreakpoint) return config.baseTextGap * 1.1;
    return config.baseTextGap;
  }

  void handleVideoTestimonyTap(BuildContext context, {required int videoId}) {
    var authProvider = Provider.of<AuthViewModel>(context, listen: false);
    if (authProvider.isGuest) {
      showJoinOurCommunityDialogOverlay(context, "Join Our Community");
    } else {
      Navigator.pushNamed(context, 'video-screen', arguments: videoId);
    }
  }
}