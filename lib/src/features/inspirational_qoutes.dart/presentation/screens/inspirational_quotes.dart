import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/features/home/widget/quotes_container.dart';

class InspirationalQuotes extends StatelessWidget {
  const InspirationalQuotes({super.key});

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
            const appbar2(
              'Inspirational Quotes',
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: quoteContainer(context,
                    imageWidth: double.infinity,
                    containerHeight: 200,
                    inbetweenHeight: 10,
                    textSize: 17),
              );
            }))
          ],
        ),
      ),
    );
  }
}
