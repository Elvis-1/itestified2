import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/profile/presentation/widgets/my_testimony_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class MyTestimoniesScreen extends StatelessWidget {
  const MyTestimoniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("My Testimonies", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 600;

          return !isLargeScreen
              ? smallScreenListView(
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavBar.routeName,
                        arguments: {
                          'initialPage': const MyTestimoniesDetailsScreen(
                            isFromProfile: true,
                          ),
                          'initialIndex': 4,
                        },
                      );
                    },
                    child: const myTestimonyContainer(),
                  ),
                )
              : largeScreenGrid(
                  context,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavBar.routeName,
                        arguments: {
                          'initialPage': const MyTestimoniesDetailsScreen(
                            isFromProfile: true,
                          ),
                          'initialIndex': 4, 
                        },
                      );
                    },
                    child: const myTestimonyContainer(),
                  ),
                );
        },
      ),
    

        // Column(
        //   children: [

        //     Expanded(
        //         child: ListView.builder(
        //             padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
        //             itemCount: 3,
        //             itemBuilder: (context, index) {
        //               return GestureDetector(
        //                   onTap: () {
        //                     Navigator.of(context)
        //                         .push(MaterialPageRoute(builder: (context) {
        //                       return const MyTestimoniesDetailsScreen(
        //                         isFromProfile: true,
        //                       );
        //                     }));
        //                   },
        //                   child: myTestimonyContainer());
        //             })

        //             )
        //   ],
        // ),

        );
  }
}
