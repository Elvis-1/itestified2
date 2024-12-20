import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/category/presentation/widgets/text_testimony_container.dart';

class WrittenTestimonies extends StatelessWidget {
  const WrittenTestimonies({super.key});

  static const routeName = '/written-testimonies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            appbar2(
              'Written Testimonies',
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
                    itemBuilder: (context, index) {
                      return const TextTestimonyContainer();
                    }))
          ],
        ),
      ),
    );
  }
}
