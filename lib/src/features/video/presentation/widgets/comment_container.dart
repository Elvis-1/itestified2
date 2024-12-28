import 'package:flutter/cupertino.dart';
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
            borderRadius: BorderRadius.circular(15.w), color: backgroundColor),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppIcons.userIcon),
                SizedBox(
                  width: 10.w,
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
                            textWidget("Chika Amaka", fontSize: 15.sp),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 250.w,
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
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: textWidget('Reply',
                    //       color: AppColors.primaryColor, fontSize: 13.sp),
                    // )
                  ],
                ),
                textWidget("2 days Ago",
                    fontSize: 12.sp, color: AppColors.textColor)
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
          margin: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
          ),
          child: CommentContainer(
            backgroundColor: themeProvider.themeData.colorScheme.background,
          ),
        ),
      ],
    );
  }
}
