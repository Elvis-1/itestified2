import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.gotoSearchPage,
      required this.gotoNotificationPage});
  final VoidCallback gotoSearchPage;
  final VoidCallback gotoNotificationPage;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // profile pic and name
        Row(
          children: [
            Image.asset(AppIcons.userIcon),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () {},
                child: textWidget(
                  "Welcome, Amaka",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                )),
          ],
        ),

        Row(
          children: [
            // search and notificatins
            GestureDetector(
                onTap: () {
                  gotoSearchPage();
                },
                child: CircleAvatar(
                    radius: 22,
                    backgroundColor:
                        //AppColors.opaqueBlack,
                        themeProvider.themeData.searchBarTheme.backgroundColor!
                            .resolve({}),
                    child: Icon(
                      size: 20,
                      Icons.search,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ))
                //Image.asset(AppIcons.searchIcon)

                ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () {
                  gotoNotificationPage();
                },
                child: CircleAvatar(
                    radius: 22,
                    backgroundColor:
                        //AppColors.opaqueBlack,
                        themeProvider.themeData.searchBarTheme.backgroundColor!
                            .resolve({}),
                    child: Icon(
                      size: 20,
                      Icons.notifications_outlined,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ))

                // CircleAvatar(

                //   child: Icon(Icons.notifications_outlined),
                // ) //Image.asset(AppIcons.notificationIcon)

                )
          ],
        ),
      ],
    );
  }
}
