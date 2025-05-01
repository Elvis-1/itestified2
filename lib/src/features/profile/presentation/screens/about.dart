import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/privacy_policy.dart';
import 'package:itestified/src/features/profile/presentation/screens/terms_of_use.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("About", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: textWidget("Welcome to iTestified",
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    color: themeProvider.themeData.colorScheme.onTertiary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: textWidget(
                "Itestified is a platform designed to share inspiring testimonies and uplifting stories from around the world. Our mission is to spread hope and faith through real-life experiences.",
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
            ),
            lineWidget(
                width: double.infinity,
                color: themeProvider.themeData.colorScheme.outline),
            LayoutBuilder(builder: (context, constraints) {
              bool isLargeScreen = constraints.maxWidth > 600;
              return isLargeScreen
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: textWidget("Our Mission",
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        color: themeProvider
                                            .themeData.colorScheme.onTertiary),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: textWidget(
                                    "At Itestified, our mission is to create a community where people can share and find inspiration through testimonies of faith, and transformation. We believe in the power of stories to change lives and bring people closer to God.",
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize,
                                  ),
                                ),
                              ],
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: textWidget("Key Features",
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        color: themeProvider
                                            .themeData.colorScheme.onTertiary),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: textWidget(
                                            "- Browse a vast collection of testimonies",
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.fontSize,
                                          )),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: textWidget(
                                          "- Share your own story",
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: textWidget(
                                          "- Watch videos that can strengthen your journey with christ",
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: textWidget(
                                          "- Follow us on social media for updates",
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: textWidget(
                                          "- Support the ministry through donations",
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, TermsOfUse.routeName);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget(
                                        "Terms of Use",
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize,
                                      ),
                                      const Icon(Icons.chevron_right)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PrivacyPolicy.routeName);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget(
                                        "Privacy Policy",
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize,
                                      ),
                                      const Icon(Icons.chevron_right)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: textWidget("Our Mission",
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: textWidget(
                            "At Itestified, our mission is to create a community where people can share and find inspiration through testimonies of faith, and transformation. We believe in the power of stories to change lives and bring people closer to God.",
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
                        lineWidget(
                            width: double.infinity,
                            color: themeProvider.themeData.colorScheme.outline),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: textWidget("Key Features",
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: textWidget(
                                    "- Browse a vast collection of testimonies",
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize,
                                  )),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: textWidget(
                                  "- Share your own story",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: textWidget(
                                  "- Watch videos that can strengthen your journey with christ",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: textWidget(
                                  "- Follow us on social media for updates",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: textWidget(
                                  "- Support the ministry through donations",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        lineWidget(
                            width: double.infinity,
                            color: themeProvider.themeData.colorScheme.outline),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, TermsOfUse.routeName);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWidget(
                                  "Terms of Use",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                                const Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PrivacyPolicy.routeName);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWidget(
                                  "Privacy Policy",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                ),
                                const Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            })
          ],
        ),
      ),
    );
  }
}
