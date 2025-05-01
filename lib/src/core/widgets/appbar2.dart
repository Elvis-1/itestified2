import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
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

PreferredSizeWidget generalAppBar2(
  BuildContext context,
) {
 
  var themeProvider = Provider.of<ThemeViewmodel>(context);
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: themeProvider.themeData.colorScheme.surface,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppIcons.userIcon),
              const SizedBox(
                width: 10,
              ),
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
                    //gotoSearchPage();
                  },
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: themeProvider
                          .themeData.searchBarTheme.backgroundColor!
                          .resolve({}),
                      child: Icon(
                        size: 16,
                        Icons.search,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                      ))),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    // gotoNotificationsPage();
                  },
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: themeProvider
                          .themeData.searchBarTheme.backgroundColor!
                          .resolve({}),
                      child: Icon(
                        size: 16,
                        Icons.notifications_outlined,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                      ))),
            ],
          ),
        ],
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
