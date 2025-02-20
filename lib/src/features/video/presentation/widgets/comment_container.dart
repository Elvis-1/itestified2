import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:provider/provider.dart';

class CommentContainer extends StatelessWidget {
  CommentContainer({super.key, this.backgroundColor = AppColors.lightBlack});

  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    backgroundColor = themeProvider.themeData.colorScheme.background;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: backgroundColor),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppIcons.userIcon),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(
                              "Chika Amaka",
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                "Our God is indeed a good God, he knows all, Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all,",
                                textAlign: TextAlign.left,
                                style: normalTextStyle(
                                    textColor: themeProvider
                                        .themeData.colorScheme.onTertiary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        likeOrShare(AppIcons.likeIcon, '2',
                            containerColor: AppColors.transparent),
                        likeOrShare(AppIcons.unlikeIcon, '2',
                            containerColor: AppColors.transparent)
                      ],
                    ),
                  ],
                ),
                textWidget("2 days Ago",
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                    color: AppColors.textColor)
              ],
            ),
          ],
        ));
    ;
  }
}

class CommentAndResponse extends StatelessWidget {
  const CommentAndResponse({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Column(
      children: [
        CommentContainer(),
        Container(
          margin: const EdgeInsets.only(
            //right: 5,
            left: 20,
          ),
          child: CommentContainer(
            backgroundColor: themeProvider.themeData.colorScheme.background,
          ),
        ),
      ],
    );
  }
}
