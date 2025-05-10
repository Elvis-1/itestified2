import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/home/data/home_screen_config.dart';
import 'package:itestified/src/features/inspirational_qoutes.dart/presentation/screens/inspirational_quotes.dart';
import 'package:itestified/src/features/notifications/presentation/screens/no_notifications_screen.dart';
import 'package:itestified/src/features/search/presentation/screens/search_screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_list_screen.dart';
import 'package:itestified/src/features/video/presentation/screens/video_screen.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/written_testimonies.dart';
import 'package:provider/provider.dart';


class HomeScreenViewModel extends ChangeNotifier {
  final HomeScreenConfig config;

  HomeScreenViewModel({this.config = const HomeScreenConfig()});

  double getMargin(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) return config.baseMargin * 2;
    if (width >= config.tabletBreakpoint) return config.baseMargin * 1.5;
    return config.baseMargin;
  }

  double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < config.mobileBreakpoint) return config.basePadding * 0.8;
    return config.basePadding;
  }

  double getTextScale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) return config.baseTextScale * 1.2;
    if (width >= config.tabletBreakpoint) return config.baseTextScale * 1.1;
    return config.baseTextScale;
  }

  double getScriptureContainerWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) {
      return config.scriptureContainerWidthDesktop;
    }
    if (width >= config.tabletBreakpoint) {
      return config.scriptureContainerWidthTablet;
    }
    return config.scriptureContainerWidthMobile;
  }

  double getScriptureContainerHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) {
      return config.scriptureContainerHeightDesktop;
    }
    if (width >= config.tabletBreakpoint) {
      return config.scriptureContainerHeightTablet;
    }
    return config.scriptureContainerHeightMobile;
  }

  double getScriptureContainerBorderRadius(BuildContext context) {
    return config.scriptureContainerBorderRadius;
  }

  double getVideoCarouselHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= config.desktopBreakpoint) {
      return config.videoCarouselHeightDesktop;
    }
    if (width >= config.tabletBreakpoint) {
      return config.videoCarouselHeightTablet;
    }
    return config.videoCarouselHeightMobile;
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= config.tabletBreakpoint;
  }

  void gotoSearchPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const SearchScreen();
    }));
  }

  void gotoNotificationsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const NoNotificationsScreen();
    }));
  }

  void handleVideoTestimonyTap(BuildContext context, {int? videoId}) {
    var authProvider = Provider.of<AuthViewModel>(context, listen: false);
    if (authProvider.isGuest) {
      showJoinOurCommunityDialogOverlay(context, "Join Our Community");
    } else {
      Navigator.pushNamed(context, VideoScreen.routeName, arguments: videoId);
    }
  }

  void gotoVideoListScreen(BuildContext context) {
    Navigator.pushNamed(context, VideoListScreen.routeName);
  }

  void gotoWrittenTestimonies(BuildContext context) {
    Navigator.pushNamed(context, WrittenTestimonies.routeName);
  }

  void gotoInspirationalQuotes(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FadeInTransitionWidget(
          child: InspirationalQuotes(),
        ),
      ),
    );
  }
}