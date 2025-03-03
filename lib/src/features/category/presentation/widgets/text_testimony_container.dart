import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
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
        height: 149,
        padding:
            const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 12),
        decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.onBackground,
            borderRadius: BorderRadius.circular(20)),
        width: containerWidth,
        margin: const EdgeInsets.only(right: 12, left: 10, bottom: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: textWidget(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    "Jesus Changed my Genotype",
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    color: themeProvider.themeData.colorScheme.onTertiary,
                  ),
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
            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: addReadMoreToText(
                          'For years, I lived with the pain and limitations of having the sickle cell genotype For years, '),
                      style: normalTextStyle(
                          textColor:
                              themeProvider.themeData.colorScheme.tertiary),
                      children: [
                    TextSpan(
                        text: ' ... See more',
                        style:
                            normalTextStyle(textColor: AppColors.primaryColor)),
                  ])),
            ),

            // image and text
            Row(
              children: [
                Image.asset(
                  AppIcons.userIcon,
                  width: 30, // Set a fixed width for better spacing
                  height: 30,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  // Ensures the Column does not overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Chika Amaka",
                        fontSize:
                            Theme.of(context).textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                          height: 5), // Add spacing for better layout
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            // Ensures the text does not overflow the Row
                            child: textWidget(
                              "Healing",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 10,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 5,
                            width: 5,
                            color:
                                themeProvider.themeData.colorScheme.onTertiary,
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: textWidget(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "30 minutes ago",
                              fontSize: 8,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
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
