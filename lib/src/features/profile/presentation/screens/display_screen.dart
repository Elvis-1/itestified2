import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Display", context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            textWidget(
              textAlign: TextAlign.center,
              "Select your preferred theme for the best experience with iTestified",
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: themeProvider.themeData.colorScheme.tertiary,
            ),
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
                                  themeProvider.setTheme(AppThemes.lightTheme);
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
    title: textWidget(
      mode,
      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
      color: themeProvider.themeData.colorScheme.tertiary,
    ),
    trailing: Radio<bool>(
      value: true,
      groupValue: isSelected,
      onChanged: callback,
      activeColor: themeProvider.themeData.colorScheme.primary,
    ),
    onTap: () => callback(true), // Tap anywhere on the tile to select
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  );
}
