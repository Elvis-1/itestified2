import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

class MyTestimoniesDetailsScreen extends StatefulWidget {
  const MyTestimoniesDetailsScreen({super.key, this.isFromProfile = false});
  final bool isFromProfile;
  static const routeName = '/my-testimony-details';

  @override
  State<MyTestimoniesDetailsScreen> createState() =>
      _MyTestimoniesDetailsScreenState();
}

class _MyTestimoniesDetailsScreenState
    extends State<MyTestimoniesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Container(
                color: themeProvider.themeData.colorScheme.surface,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        AppIcons.backIcon,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                      ),
                    ),
                    if (widget.isFromProfile) ...[
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const EditDeleteShareModal();
                            },
                          );
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: themeProvider.themeData.colorScheme.onTertiary,
                        ),
                      ),
                    ],
                    if (!widget.isFromProfile) ...[
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        color: Colors.black.withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.opaqueBlack,
                          child: Image.asset(
                            width: 12,
                            AppIcons.favoriteIcon,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: themeProvider.themeData.colorScheme.surface,
                    margin: const EdgeInsets.only(
                      right: 15,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        textWidget(
                          'Jesus changed Genotype!',
                          fontSize:
                              Theme.of(context).textTheme.titleMedium?.fontSize,
                          fontWeight: FontWeight.w600,
                          color: themeProvider.themeData.colorScheme.onTertiary,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppIcons.userIcon),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(
                                  "Chika Amaka",
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.fontSize,
                                ),
                                Row(
                                  children: [
                                    textWidget(
                                      "Healing ",
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.fontSize,
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 5,
                                      width: 5,
                                      color: themeProvider
                                          .themeData.colorScheme.tertiary,
                                    ),
                                    const SizedBox(width: 5),
                                    textWidget(
                                      " 30 minutes ago",
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.fontSize,
                                      color: themeProvider
                                          .themeData.colorScheme.tertiary,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "sickle cell genotype. Countless hospital visits and painful crises became a part of my life. My faith in God was strong, but the struggle was relentless. Despite the adversity, I held on to the hope that one day, I would experience healing.One evening, during a powerful prayer session at my church, I felt an overwhelming sense of peace and warmth envelop me. The pastor, led by the Spirit, specifically prayed for those suffering from chronic illnesses. As the congregation joined in fervent prayer, I felt a shift within me. It was as if a heavy burden was being lifted off my shoulders.In the weeks that followed, I noticed a remarkable change. The frequent crises that had plagued my life began to subside. My energy levels increased, and I felt a renewed sense of vitality. Encouraged by these changes, I decided to visit my doctor for a comprehensive check-up.The results were nothing short of a miracle. My genotype had changed from SS to AA. The doctors were baffled, unable to explain the transformation scientifically. But I knew the truth—it was Jesus who had healed me.Today, I live free from the pain and limitations that once defined my life. My story is a testament to the incredible power of faith and prayer. Jesus changed my genotype, and with it, He transformed my entire life. I now use my testimony to encourage others, reminding them that with God, all things are possible.",
                          style: normalTextStyle(
                            height: 1.7,
                            textColor:
                                themeProvider.themeData.colorScheme.tertiary,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize,
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeData.colorScheme.outline,
                      ),
                      color: themeProvider.themeData.colorScheme.outline,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      likeOrShare(Symbols.thumb_up_sharp, '10',
                          containerColor: AppColors.transparent),
                      InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                              backgroundColor:
                                  themeProvider.themeData.colorScheme.surface,
                              context: context,
                              builder: (context) {
                                return ListView(
                                  shrinkWrap: true,
                                  children: const [
                                   commentListModal(),
                                  ],
                                );
                              });
                        },
                        child: likeOrShare(Symbols.comment, '12',
                            containerColor: AppColors.transparent),
                      ),
                      likeOrShare(Symbols.share, 'Share',
                          containerColor: AppColors.transparent),
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
