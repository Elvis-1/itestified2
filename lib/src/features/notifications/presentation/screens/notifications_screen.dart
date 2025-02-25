import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/notifications/presentation/widgets/notifications_container.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Notifications", context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;

            return isLargeScreen
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: todaysNotification(context)),
                      const SizedBox(width: 20),
                      Expanded(child: lastSevenDays(context)),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        todaysNotification(context),
                        const SizedBox(height: 20),
                        lastSevenDays(context),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget todaysNotification(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Today",
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250, // Adjust as needed
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => const notificationsContainer(),
          ),
        ),
      ],
    );
  }

  Widget lastSevenDays(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Last 7 days",
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250, // Match today's notification height for consistency
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const notificationsContainer(),
          ),
        ),
      ],
    );
  }
}
