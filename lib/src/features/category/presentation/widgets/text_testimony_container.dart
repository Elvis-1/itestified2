import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:provider/provider.dart';

class TextTestimonyContainer extends StatelessWidget {
  const TextTestimonyContainer({
    super.key,
    this.containerWidth = 300,
  });
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyTestimoniesDetailsScreen.routeName);
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),

        decoration: BoxDecoration(
            color: themeProvider.themeData.searchBarTheme.backgroundColor!
                .resolve({}),
            borderRadius: BorderRadius.circular(20)),
        //  height: 150,
        width: containerWidth,
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  "Jesus Changed my Genotype",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.opaqueBlack,
                    child: Image.asset(
                      AppIcons.favoriteIcon,
                      width: 12,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            RichText(
                text: TextSpan(
                    text:
                        'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in',
                    style: normalTextStyle(
                        textColor:
                            themeProvider.themeData.colorScheme.tertiary),
                    children: [
                  TextSpan(
                      text: ' ... See more',
                      style:
                          normalTextStyle(textColor: AppColors.primaryColor)),
                ])),
            SizedBox(
              height: 10.h,
            ),
            // image and text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AppIcons.userIcon),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                          "Chika Amaka",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        Row(
                          children: [
                            textWidget(
                              "Healing ",
                              fontSize: 10.sp,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            textWidget(
                              " 30 minutes ago",
                              fontSize: 8.sp,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
