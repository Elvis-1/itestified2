import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class NoNotificationsScreen extends StatelessWidget {
  const NoNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Notifications", context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.notificationImage,
                  width: MediaQuery.of(context).size.width *
                      0.3, // Responsive width
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                textWidget(
                  "No Notifications Yet",
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 10),
                textWidget(
                  "You will get notifications when they are available",
                  textAlign: TextAlign.center,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
