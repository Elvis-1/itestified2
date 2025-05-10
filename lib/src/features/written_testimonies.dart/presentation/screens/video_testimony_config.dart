import 'package:flutter/material.dart';

@immutable
class VideoTestimonyConfig {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final double baseContainerWidth;
  final double baseContainerHeight;
  final double baseImageWidth;
  final double baseImageHeight;
  final double baseBorderRadius;
  final double baseTitleTextSize;
  final double baseSubtitleTextSize;
  final double baseMetadataTextSize;
  final double baseTimeTextSize;
  final double baseFavoriteIconSize;
  final double baseApologyIconSize;
  final double baseMargin;
  final double basePadding;
  final double baseTextGap;

  const VideoTestimonyConfig({
    this.mobileBreakpoint = 600,
    this.tabletBreakpoint = 800,
    this.desktopBreakpoint = 1200,
    this.baseContainerWidth = 220.0, 
    this.baseContainerHeight = 185.0, 
    this.baseImageWidth = 220.0,
    this.baseImageHeight = 133.0, 
    this.baseBorderRadius = 16.0,
    this.baseTitleTextSize = 12.0, 
    this.baseSubtitleTextSize = 10.0,
    this.baseMetadataTextSize = 10.0,
    this.baseTimeTextSize = 9.0,
    this.baseFavoriteIconSize = 14.0,
    this.baseApologyIconSize = 14.0, 
    this.baseMargin = 15.0,
    this.basePadding = 9.0,
    this.baseTextGap = 5.0,
  });
}


