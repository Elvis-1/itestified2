import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';
import 'package:provider/provider.dart';

class InspirationalQuotes extends StatelessWidget {
  const InspirationalQuotes({super.key});

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
     
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (isLargeScreen) {
              return _buildLargeScreenGrid(context);
            } else {
              return _buildSmallScreenList(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLargeScreenGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return quoteContainer(
          width: double.infinity,
          height: 200,
          textSize: 14,
          index: index + 1,
        );
      },
    );
  }

  Widget _buildSmallScreenList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return quoteContainer(
          width: double.infinity,
          height: 180,
          textSize: 14,
          margin: EdgeInsets.zero,
          index: index + 1,
        );
      },
    );
  }
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
