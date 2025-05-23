import 'package:flutter/material.dart';

@immutable
class HomeScreenConfig {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final double baseMargin;
  final double basePadding;
  final double baseTextScale;
  final double scriptureContainerWidthMobile;
  final double scriptureContainerWidthTablet;
  final double scriptureContainerWidthDesktop;
  final double scriptureContainerHeightMobile;
  final double scriptureContainerHeightTablet;
  final double scriptureContainerHeightDesktop;
  final double scriptureContainerBorderRadius;
  final double videoCarouselHeightMobile;
  final double videoCarouselHeightTablet;
  final double videoCarouselHeightDesktop;
  final double textTestimonyHeight;
  final double quotesHeight;

  const HomeScreenConfig({
    this.mobileBreakpoint = 600,
    this.tabletBreakpoint = 800,
    this.desktopBreakpoint = 1200,
    this.baseMargin = 24.0,
    this.basePadding = 10.0,
    this.baseTextScale = 1.0,
    this.scriptureContainerWidthMobile = 345.0, 
    this.scriptureContainerWidthTablet = 414.0, 
    this.scriptureContainerWidthDesktop = 517.5, 
    this.scriptureContainerHeightMobile = 138.0, 
    this.scriptureContainerHeightTablet = 165.6, 
    this.scriptureContainerHeightDesktop = 207.0,
    this.scriptureContainerBorderRadius = 16.0, 
    this.videoCarouselHeightMobile = 215.0, // 185 (container) + 15 (margin) + 15 (buffer)
    this.videoCarouselHeightTablet = 258.0, 
    this.videoCarouselHeightDesktop = 322.5, 
    this.textTestimonyHeight = 149.0,
    this.quotesHeight = 200.0,
  });
}