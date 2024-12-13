import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/category/presentation/widgets/category_container.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  static const routeName = '/categories-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            // category container
            textWidget("Categories", fontSize: 25.sp),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const VideoAndWrittenTestimonieScreen();
                            }));
                          },
                          child: categoryContainer());
                    }))
          ],
        ),
      ),
    );
  }
}
