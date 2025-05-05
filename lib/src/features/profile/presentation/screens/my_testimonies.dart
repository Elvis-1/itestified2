import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
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
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return NavBar(
      initialIndex: 3, 
      initialPage: Scaffold(
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
                          MyTestimoniesDetailsScreen.routeName,
                          arguments: {'isFromProfile': true},
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
                          MyTestimoniesDetailsScreen.routeName,
                          arguments: {'isFromProfile': true},
                        );
                      },
                      child: const myTestimonyContainer(),
                    ),
                  );
          },
        ),
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
