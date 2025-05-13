import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String routeName = '/search';
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Search", context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            customTextField(
                prefixIc: const Icon(Icons.search), hintText: "Search"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("Recent Searches", fontSize: 18),
                textWidget("Clear all",
                    fontSize: 15, color: AppColors.darkPurple)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: themeProvider
                                      .themeData.colorScheme.onTertiary,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                textWidget(
                                  "Healing Testimonies",
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            textWidget(
                              "x",
                              fontSize: 17,
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
