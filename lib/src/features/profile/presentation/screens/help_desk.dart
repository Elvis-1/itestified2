import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/faq_container.dart';
import 'package:provider/provider.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({super.key});

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  bool showDetails = false;
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Help", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              textWidget(
                "Frequently Asked Questions",
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              ),
              const SizedBox(
                height: 20,
              ),

              LayoutBuilder(builder: (context, constraints) {
                bool isLargeScreen = constraints.maxWidth > 600;
                return isLargeScreen
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      one = !one;
                                    });
                                  },
                                  child: faqContainer(
                                      "How do I post testimonies",
                                      "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                      one),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      two = !two;
                                    });
                                  },
                                  child: faqContainer(
                                      "How can I donate to iTestified",
                                      "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                      two),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      three = !three;
                                    });
                                  },
                                  child: faqContainer(
                                      "How can I change the app theme",
                                      "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                      three),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      four = !four;
                                    });
                                  },
                                  child: faqContainer(
                                      "How can I edit my profile information",
                                      "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                      four),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                one = !one;
                              });
                            },
                            child: faqContainer(
                                "How do I post testimonies",
                                "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                one),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                two = !two;
                              });
                            },
                            child: faqContainer(
                                "How can I donate to iTestified",
                                "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                two),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                three = !three;
                              });
                            },
                            child: faqContainer(
                                "How can I change the app theme",
                                "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                three),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                four = !four;
                              });
                            },
                            child: faqContainer(
                                "How can I edit my profile information",
                                "To share your testimonies, click on the plus icon on the home screen, you would be directed to a screen where you can input your testimonies",
                                four),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
              }),

              // contact support
              Align(
                  alignment: Alignment.bottomLeft,
                  child: textWidget(
                    "Contact our support team",
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: themeProvider
                        .themeData.searchBarTheme.backgroundColor
                        ?.resolve({}),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      "Email address",
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    textWidget("itestified2022@gmail.com",
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize,
                        color: themeProvider.themeData.colorScheme.onTertiary),
                    const SizedBox(
                      height: 10,
                    ),
                    textWidget(
                      "Phone Number",
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    textWidget("090090999909",
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize,
                        color: themeProvider.themeData.colorScheme.onTertiary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
