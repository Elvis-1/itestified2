import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/video_setting_dropdown.dart';
import 'package:provider/provider.dart';

class videoContainer extends StatelessWidget {
  const videoContainer(
      {super.key,
      this.videoContainerHeight = 100,
      this.videoContainerWidth = 300,
      this.playArrowLeftPosition = 180,
      this.playArrowTopPosition = 80,
      this.itestifyIconTopPosition = 185,
      this.itestifyIconLeftPosition = 5,
      this.fix = BoxFit.fill,
      this.imageHeight = 100,
      this.onpressed});

  final double videoContainerHeight;
  final double videoContainerWidth;
  final double imageHeight;
  final double playArrowLeftPosition;
  final double playArrowTopPosition;
  final double itestifyIconLeftPosition;
  final double itestifyIconTopPosition;
  final BoxFit fix;

  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      // height: videoContainerHeight,
      // width: videoContainerWidth,
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Video container
              Container(
                height: 300, //imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(AppImages.recentTestimonyImage),
                    fit: fix,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                      //  size: 25,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Row(
                  children: [
                    //  const Spacer(),
                    Container(
                        margin: const EdgeInsets.only(top: 15, right: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    //AppColors.opaqueBlack,
                                    themeProvider.themeData.searchBarTheme
                                        .backgroundColor!
                                        .resolve({}),
                                child: Icon(
                                  size: 15,
                                  Icons.favorite_outline,
                                  color: themeProvider
                                      .themeData.colorScheme.onTertiary,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const VideoSettingsDropdown()
                          ],
                        )),
                  ],
                ),
              ),

              Positioned(
                bottom: 1,
                right: 5,
                child: Row(
                  children: [
                    // const Spacer(),
                    Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.blackColor,
                        ),
                        child: Text(
                          "09:30",
                          style:
                              normalTextStyle(textColor: AppColors.textColor),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              //  Play arrow icon
              const Center(
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.white,
                ),
              ),
              // itestify icon and text
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                textWidget(
                  "Prophetic Prayers for open doors",
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    textWidget(
                      "Child Birth ",
                      fontSize: 12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      color: themeProvider.themeData.colorScheme.tertiary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    textWidget(" 504 Views ", fontSize: 12),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      color: themeProvider.themeData.colorScheme.tertiary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    textWidget("14/4/2024", fontSize: 12),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      color: themeProvider.themeData.colorScheme.tertiary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: onpressed,
                      child: textWidget("See Details",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        // Row(
        //   children: [
        //     Image.asset(AppIcons.itestifyIcon, width: 30),
        //     const SizedBox(width: 10),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           textWidget(
        //             maxLines: 1,
        //             overflow: TextOverflow.ellipsis,
        //             "Prophetic Prayer for open doors",
        //             fontSize:
        //                 Theme.of(context).textTheme.titleMedium?.fontSize,
        //             fontWeight: FontWeight.w600, // Removed `.sp`
        //           ),
        //           const SizedBox(
        //             height: 5,
        //           ),
        //           textWidget(
        //             maxLines: 1,
        //             overflow: TextOverflow.ellipsis,
        //             "Redeemed Christian Church of God",
        //             fontSize:
        //                 Theme.of(context).textTheme.titleSmall?.fontSize,
        //           ),
        //           const SizedBox(
        //             height: 5,
        //           ),
        //           Row(
        //             children: [
        //               textWidget(
        //                 "Child Birth ",
        //                 fontSize:
        //                     Theme.of(context).textTheme.labelSmall?.fontSize,
        //               ),
        //               const SizedBox(width: 5),
        //               Container(
        //                 height: 5,
        //                 width: 5,
        //                 color: themeProvider.themeData.colorScheme.tertiary,
        //               ),
        //               const SizedBox(width: 5),
        //               textWidget(
        //                 " 504 Views ",
        //                 fontSize:
        //                     Theme.of(context).textTheme.labelSmall?.fontSize,
        //               ),
        //               const SizedBox(width: 5),
        //               Container(
        //                 height: 5,
        //                 width: 5,
        //                 color: themeProvider.themeData.colorScheme.tertiary,
        //               ),
        //               const SizedBox(width: 5),
        //               textWidget(
        //                 "14/4/2024",
        //                 fontSize:
        //                     Theme.of(context).textTheme.labelSmall?.fontSize,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // ],
      ),
    );
  }
}

class videoContainer2 extends StatelessWidget {
  const videoContainer2({super.key, this.unpressed});
  final void Function()? unpressed;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // video container
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(AppImages.recentTestimonyImage),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                            //  size: 25,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.opaqueBlack,
                            child: Image.asset(
                              width: 12,
                              AppIcons.favoriteIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const VideoSettingsDropdown()
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                    size: 40,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.blackColor),
                        child: textWidget(
                          "09:30",
                          fontSize: 12,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  textWidget(
                    "Prophetic Prayers for open doors",
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      textWidget(
                        "Child Birth ",
                        fontSize: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textWidget(" 504 Views ", fontSize: 12),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textWidget("14/4/2024", fontSize: 12),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: unpressed,
                        child: textWidget("See Details",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
