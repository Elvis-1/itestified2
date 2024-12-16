import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/profile/presentation/widgets/my_testimony_container.dart';

class MyTestimoniesScreen extends StatelessWidget {
  const MyTestimoniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2("My Testimonies", context),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: ListView.builder(
                  //  padding: EdgeInsets.fromViewPadding(ViewPadding.zero, devicePixelRatio),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const MyTestimoniesDetailsScreen(
                              isFromProfile: true,
                            );
                          }));
                        },
                        child: myTestimonyContainer());
                  }))
        ],
      ),
    );
  }
}
