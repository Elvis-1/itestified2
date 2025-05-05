import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class InspirationalQuotes extends StatelessWidget {
  const InspirationalQuotes({super.key});

  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar('Inspirational Quotes', context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(child: LayoutBuilder(
        builder: (context, contraints) {
          bool isLargeScreen = contraints.maxWidth > 600;
          return isLargeScreen
              ? largeScreenGrid(
                  context,
                  const quoteContainer(
                      
                      textSize: 17),
                  gridNumber: 3)
              : smallScreenListView(
                  const quoteContainer(
                     
                      // inbetweenHeight: 10,
                      textSize: 17),
                );
        },
      )),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var themeProvider = Provider.of<ThemeViewmodel>(context);

  //   return Scaffold(
  //     backgroundColor: themeProvider.themeData.colorScheme.background,
  //     body: Container(
  //       margin: EdgeInsets.symmetric(horizontal: 15.w),
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 50.h,
  //           ),
  //           const appbar2(
  //             'Inspirational Quotes',
  //           ),
  //           Expanded(child: ListView.builder(itemBuilder: (context, index) {
  //             return Container(
  //               margin: EdgeInsets.only(bottom: 20),
  //               child: const quoteContainer(
  //                   imageWidth: double.infinity,
  //                   containerHeight: 200,
  //                   inbetweenHeight: 10,
  //                   textSize: 17),
  //             );
  //           }))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
