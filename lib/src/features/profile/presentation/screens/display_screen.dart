import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var color = themeProvider.themeData;
    return Scaffold(
      appBar: generalAppbar("Display", context),
      backgroundColor: color.colorScheme.surface,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextWidgets.textWidget14(
                  context,
                  maxLine: 3,
                  textAlign: TextAlign.left,
                  textColor: color.colorScheme.tertiary,
                  "Select your preferred theme for the best experience with iTestified"),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isLargeScreen = constraints.maxWidth > 600;
                  return isLargeScreen
                      ? Row(
                          children: [
                            Expanded(
                              child: modeTile(
                                context,
                                "Dark Mode",
                                themeProvider.themeData == AppThemes.darkTheme,
                                (value) {
                                  if (value == true) {
                                    themeProvider.setTheme(AppThemes.darkTheme);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: modeTile(
                                context,
                                "Light Mode",
                                themeProvider.themeData == AppThemes.lightTheme,
                                (value) {
                                  if (value == true) {
                                    themeProvider
                                        .setTheme(AppThemes.lightTheme);
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            modeTile(
                              context,
                              "Dark Mode",
                              themeProvider.themeData == AppThemes.darkTheme,
                              (value) {
                                if (value == true) {
                                  themeProvider.setTheme(AppThemes.darkTheme);
                                }
                              },
                            ),
                            lineWidget(
                                width: double.infinity,
                                color: color.colorScheme.outline,
                                height: 0.5),
                            modeTile(
                              context,
                              "Light Mode",
                              themeProvider.themeData == AppThemes.lightTheme,
                              (value) {
                                if (value == true) {
                                  themeProvider.setTheme(AppThemes.lightTheme);
                                }
                              },
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget modeTile(
  BuildContext context,
  String mode,
  bool isSelected,
  void Function(bool?) callback,
) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return ListTile(
    title: TextWidgets.textWidget16(
      context,
      mode,
      textAlign: TextAlign.left,
      color: themeProvider.themeData.colorScheme.onTertiary,
    ),
    trailing: Radio<bool>(
      value: true,
      groupValue: isSelected,
      onChanged: callback,
      activeColor: themeProvider.themeData.primaryColor,
    ),
    onTap: () => callback(true), // Tap anywhere on the tile to select
    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
  );
}
