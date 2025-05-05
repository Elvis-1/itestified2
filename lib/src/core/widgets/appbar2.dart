import 'package:flutter/material.dart';
import 'package:itestified/src/config/authprovider.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
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
  final authProvider = Provider.of<AuthProvider>(context);
  final isGuest = authProvider.isGuest;
  final screenWidth = MediaQuery.of(context).size.width;

  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: themeProvider.themeData.colorScheme.surface,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: isGuest
          ? LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidgets.textWidget14(
                                context,
                                "Guest Mode",
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(height: 4),
                              TextWidgets.textWidget10(
                                context,
                                "You are currently browsing as a guest",
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          if (screenWidth > 350)
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: btnAndText(
                                text: "Create Account",
                                containerWidth: 110,
                                verticalPadding: 8,
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                      if (screenWidth <= 350)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: btnAndText(
                              text: "Create Account",
                              containerWidth: double.infinity,
                              verticalPadding: 8,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgets.textWidget14(
                          context,
                          "Guest Mode",
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 4),
                        TextWidgets.textWidget10(
                          context,
                          "You are currently browsing as a guest",
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: btnAndText(
                        text: "Create an Account",
                        containerWidth: 119,
                        verticalPadding: 8,
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              },
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Image.asset(AppIcons.userIcon,
                                width: 24, height: 24),
                            const SizedBox(width: 8),
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
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchScreen()),
                              );
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: themeProvider
                                  .themeData.searchBarTheme.backgroundColor!
                                  .resolve({}),
                              child: Icon(
                                size: 16,
                                Icons.search,
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: themeProvider
                                  .themeData.searchBarTheme.backgroundColor!
                                  .resolve({}),
                              child: Icon(
                                size: 16,
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
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppIcons.userIcon),
                        const SizedBox(width: 10),
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
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: themeProvider
                                .themeData.searchBarTheme.backgroundColor!
                                .resolve({}),
                            child: Icon(
                              size: 16,
                              Icons.search,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: themeProvider
                                .themeData.searchBarTheme.backgroundColor!
                                .resolve({}),
                            child: Icon(
                              size: 16,
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
              fontSize: 20,
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
    backgroundColor: themeProvider.themeData.colorScheme.background,
    title: textWidget(
      title,
      fontWeight: FontWeight.w600,
    ),
  );
}
