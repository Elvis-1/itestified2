import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/follow_row.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class FollowItestify extends StatelessWidget {
  const FollowItestify({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Follow iTestified", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            textWidget(
              "Stay Connected with us on social media for updates, inspiration and more. Follow us on our platforms",
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
            const SizedBox(
              height: 20,
            ),
            LayoutBuilder(builder: (context, constraint) {
              bool isLargeScreen = constraint.maxWidth > 600;
              return isLargeScreen
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child:
                                    followRow(AppIcons.facebookIcon, context)),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child:
                                    followRow(AppIcons.instagramIcon, context)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: followRow(
                                  themeProvider.themeData == AppThemes.darkTheme
                                      ? AppIcons.twitterIcon
                                      : AppIcons.twitterLightIcon,
                                  context),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: followRow(
                                  themeProvider.themeData == AppThemes.darkTheme
                                      ? AppIcons.youtubeIcon
                                      : AppIcons.youtubeLightIcon,
                                  context),
                            ),
                          ],
                        )
                      ],
                    )

                  // largeScreenGrid2(context, [

                  //   ])

                  : smallScreenListView2([
                      followRow(AppIcons.facebookIcon, context),
                      followRow(AppIcons.instagramIcon, context),
                      followRow(
                          themeProvider.themeData == AppThemes.darkTheme
                              ? AppIcons.twitterIcon
                              : AppIcons.twitterLightIcon,
                          context),
                      followRow(
                          themeProvider.themeData == AppThemes.darkTheme
                              ? AppIcons.youtubeIcon
                              : AppIcons.youtubeLightIcon,
                          context),
                    ]);
            })
          ],
        ),
      ),
    );
  }
}
