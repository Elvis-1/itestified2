import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/category/presentation/widgets/category_container.dart';
import 'package:itestified/src/features/shared/widgets/screen.dart';
import 'package:provider/provider.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  static const routeName = '/categories-list-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.themeData.colorScheme.surface,
          centerTitle: true,
          title: textWidget2(
            "Categories",
            fontSize: 20,
            mainColor: themeProvider.themeData.colorScheme
                .onTertiary, 
          ),
        ),
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;

            return isLargeScreen
                ? largeScreenGrid(
                    gridNumber: 3,
                    context,
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const VideoAndWrittenTestimonieScreen();
                          }));
                        },
                        child: FadeInTransitionWidget(
                          child: Container(
                              margin: const EdgeInsets.only(right: 1),
                              child: const CategoryContainer()),
                        )))
                : smallScreenListView(GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const VideoAndWrittenTestimonieScreen();
                      }));
                    },
                    child: const FadeInTransitionWidget(
                        child: CategoryContainer())));
          },
        )

        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 10.w),
        //   child: Column(
        //     children: [
        //       // category container
        //       // textWidget("Categories", fontSize: 25.sp),
        //       Expanded(
        //           child: ListView.builder(
        //               itemCount: 10,
        //               physics: const BouncingScrollPhysics(),
        //               itemBuilder: (context, index) {
        //                 return GestureDetector(
        //                     onTap: () {
        //                       Navigator.of(context)
        //                           .push(MaterialPageRoute(builder: (context) {
        //                         return const VideoAndWrittenTestimonieScreen();
        //                       }));
        //                     },
        //                     child: const CategoryContainer());
        //               }))
        //     ],
        //   ),
        // ),

        );
  }
}
