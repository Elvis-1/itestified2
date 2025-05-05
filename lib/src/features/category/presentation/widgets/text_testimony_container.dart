import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/my_testimonies_details.dart';
import 'package:itestified/src/features/shared/widgets/read_more.dart';
import 'package:provider/provider.dart';

class TextTestimonyContainer extends StatelessWidget {
  const TextTestimonyContainer(
      {super.key, this.containerWidth = 282, this.index});
  final double containerWidth;
  final int? index;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyTestimoniesDetailsScreen.routeName);
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 12),
        decoration: BoxDecoration(
          color: themeProvider.themeData.colorScheme.outline,
          border: Border.all(
            color: themeProvider.themeData.colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        width: containerWidth,
        margin: const EdgeInsets.only(
          right: 12,
          left: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidgets.textWidget10(
                    context,
                    fontWeight: FontWeight.w600,
                    "Jesus Changed my Genotype",
                  ),
                )),
                CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.opaqueBlack,
                    child: Image.asset(
                      AppIcons.favoriteIcon,
                      width: 14,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: RichText(
                  text: TextSpan(
                      text: addReadMoreToText(
                          'For years, I lived with the pain and limitations of having the sickle cell genotype For years, '),
                      style: normalTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          textColor:
                              themeProvider.themeData.colorScheme.tertiary),
                      children: [
                    TextSpan(
                        text: ' ... See more',
                        style:
                            normalTextStyle(textColor: AppColors.primaryColor)),
                  ])),
            ),
            Row(
              children: [
                Image.asset(
                  AppIcons.userIcon,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets.textWidget10(context, "Chika Amaka",
                          fontWeight: FontWeight.w600),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: TextWidgets.textWidget10(
                              context,
                              "Healing",
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color: themeProvider
                                    .themeData.colorScheme.onTertiary,
                                shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: TextWidgets.textWidget10(
                              context,
                              "30 minutes ago",
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
