import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class WrittenTestimonies extends StatelessWidget {
  const WrittenTestimonies({super.key});

  static const routeName = '/written-testimonies';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar('Written Testimonies', context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SafeArea(child: LayoutBuilder(
        builder: (context, contraints) {
          bool isLargeScreen = contraints.maxWidth > 600;
          return isLargeScreen
              ? largeScreenGrid(context, const TextTestimonyContainer(),
                  gridNumber: 3)
              : smallScreenListView(
                  const TextTestimonyContainer(),
                );
        },
      )),
    );
  }
}

      // Container(
      //   margin: EdgeInsets.symmetric(horizontal: 15.w),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 50.h,
      //       ),
      //       appbar2(
      //         'Written Testimonies',
      //       ),
      //       SizedBox(
      //         height: 10.h,
      //       ),
      //       Expanded(
      //           child: ListView.builder(
      //               padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
      //               itemBuilder: (context, index) {
      //                 return const TextTestimonyContainer();
      //               }))
      //     ],
      //   ),
      // ),
