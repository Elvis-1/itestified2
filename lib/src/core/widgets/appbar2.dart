import 'package:flutter/material.dart';

import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/search/presentation/screens/search_screen.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget generalAppbar(String title, BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);
  return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: themeProvider.themeData.colorScheme.onTertiary,
                  )),
              TextWidgets.textWidget20(context, title,
                  mainColor: themeProvider.themeData.colorScheme.onTertiary),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ));
}

PreferredSizeWidget generalAppBar2(BuildContext context) {
  final themeProvider = Provider.of<ThemeViewmodel>(context);
  final authProvider = Provider.of<AuthViewModel>(context);
  final isGuest = authProvider.isGuest;
  final screenWidth = MediaQuery.of(context).size.width;

  final double iconSize =
      screenWidth < 400 ? 14 : (screenWidth < 600 ? 16 : 20);
  final double avatarRadius =
      screenWidth < 400 ? 16 : (screenWidth < 600 ? 18 : 20);
  final double horizontalPadding =
      screenWidth < 400 ? 4 : (screenWidth < 600 ? 8 : 16);
  final double verticalPadding = screenWidth < 400 ? 4 : 8;
  final double buttonFontSize = screenWidth < 400 ? 10 : 12;

  final double appBarHeight = isGuest && screenWidth <= 350 ? 100 : 60;

  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: isGuest
            ? LayoutBuilder(
                builder: (context, constraints) {
                  if (screenWidth < 350) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidgets.textWidget14(
                                    context,
                                    "Guest Mode",
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: verticalPadding / 2),
                                  TextWidgets.textWidget10(
                                    context,
                                    "You are currently browsing as a guest",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: verticalPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: btnAndText(
                              text: "Create Account",
                              containerWidth: double.infinity,
                              verticalPadding: 6,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (screenWidth < 600) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWidgets.textWidget14(
                                context,
                                "Guest Mode",
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: verticalPadding / 2),
                              TextWidgets.textWidget10(
                                context,
                                "You are currently browsing as a guest",
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: btnAndText(
                              text: "Create Account",
                              containerWidth: screenWidth < 450 ? 100 : 110,
                              verticalPadding: 8,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
      
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextWidgets.textWidget14(
                              context,
                              "Guest Mode",
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: verticalPadding / 2),
                            TextWidgets.textWidget10(
                              context,
                              "You are currently browsing as a guest",
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: btnAndText(
                            text: screenWidth < 800
                                ? "Create Account"
                                : "Create an Account",
                            containerWidth: screenWidth < 800 ? 110 : 130,
                            verticalPadding: 8,
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  // Extra small devices
                  if (screenWidth < 400) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              Image.asset(AppIcons.userIcon,
                                  width: 20, height: 20),
                              SizedBox(width: horizontalPadding / 2),
                              Flexible(
                                child: TextWidgets.textWidget14(
                                  context,
                                  "Welcome, Amaka",
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundColor: themeProvider
                                      .themeData.searchBarTheme.backgroundColor!
                                      .resolve({}),
                                  child: Icon(
                                    size: iconSize,
                                    Icons.search,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                ),
                              ),
                              SizedBox(width: horizontalPadding / 2),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundColor: themeProvider
                                      .themeData.searchBarTheme.backgroundColor!
                                      .resolve({}),
                                  child: Icon(
                                    size: iconSize,
                                    Icons.notifications_outlined,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (screenWidth < 600) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              Image.asset(AppIcons.userIcon,
                                  width: 24, height: 24),
                              SizedBox(width: horizontalPadding),
                              Flexible(
                                child: TextWidgets.textWidget14(
                                  context,
                                  "Welcome, Amaka",
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundColor: themeProvider
                                      .themeData.searchBarTheme.backgroundColor!
                                      .resolve({}),
                                  child: Icon(
                                    size: iconSize,
                                    Icons.search,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                ),
                              ),
                              SizedBox(width: horizontalPadding),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundColor: themeProvider
                                      .themeData.searchBarTheme.backgroundColor!
                                      .resolve({}),
                                  child: Icon(
                                    size: iconSize,
                                    Icons.notifications_outlined,
                                    color: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppIcons.userIcon),
                          SizedBox(width: horizontalPadding),
                          TextWidgets.textWidget14(
                            context,
                            "Welcome, Amaka",
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchScreen()),
                              );
                            },
                            child: CircleAvatar(
                              radius: avatarRadius,
                              backgroundColor: themeProvider
                                  .themeData.searchBarTheme.backgroundColor!
                                  .resolve({}),
                              child: Icon(
                                size: iconSize,
                                Icons.search,
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary,
                              ),
                            ),
                          ),
                          SizedBox(width: horizontalPadding),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: avatarRadius,
                              backgroundColor: themeProvider
                                  .themeData.searchBarTheme.backgroundColor!
                                  .resolve({}),
                              child: Icon(
                                size: iconSize,
                                Icons.notifications_outlined,
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
      ),
    ),
  );
}

class appbar2 extends StatelessWidget {
  const appbar2(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                AppIcons.backIcon,
                color: themeProvider.themeData.colorScheme.onTertiary,
              )),
          textWidget(title,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: themeProvider.themeData.colorScheme.onTertiary),
          Container()
        ],
      ),
    );
    ;
  }
}

PreferredSizeWidget appBar(BuildContext context, String title) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: themeProvider.themeData.colorScheme.surface,
    title: textWidget(
      title,
      fontWeight: FontWeight.w600,
    ),
  );
}
