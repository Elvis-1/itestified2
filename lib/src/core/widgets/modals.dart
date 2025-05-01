import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/add_testimony.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/comment_container.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:provider/provider.dart';

class commentListModal extends StatelessWidget {
  const commentListModal({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth > 800;
        return Scaffold(
            backgroundColor: themeProvider.themeData.colorScheme.background,
            body: isLargeScreen
                ? Row(
                    children: [const SizedBox.shrink()],
                  )
                : mainContent(context),
            bottomNavigationBar:
                isLargeScreen ? SizedBox.shrink() : rightColumn(context));
      },
    ));
  }
}

Widget mainContent(BuildContext context) {
  return leftColumn(context);
}

Widget rightColumn(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  // textfield
  return Container(
    padding: EdgeInsets.only(
        left: 5, right: 5, bottom: MediaQuery.of(context).viewInsets.bottom),
    margin: const EdgeInsets.only(
      left: 10,
      right: 10,
      top: 5,
      bottom: 28,
    ),
    child: Row(
      children: [
        Image.asset(AppIcons.userIcon),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
                child: customTextField(
                    borderColor: themeProvider.themeData.colorScheme.tertiary,
                    hintText: "Add a comment"))),
        const SizedBox(
          width: 10,
        ),
        Image.asset(AppIcons.sendBtnIcon),
      ],
    ),
  );
}

Widget leftColumn(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);
// list of comments
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
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
                                "Our God is indeed a good God, he knows all, Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all",
                                textAlign: TextAlign.left,
                                style: normalTextStyle(
                                    textColor: themeProvider
                                        .themeData.colorScheme.tertiary),
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 30),
                                      color: themeProvider
                                          .themeData.colorScheme.background,
                                      //  height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(
                                                    Icons.arrow_back_ios_new)),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: textWidget('Comments',
                                                fontWeight: FontWeight.w500,
                                                color: themeProvider.themeData
                                                    .colorScheme.onTertiary,
                                                fontSize: 20),
                                          ),
                                          Container()
                                        ],
                                      )),
                                  const SizedBox(
                                      height: 400, child: singleCommentModal()),
                                ],
                              );
                            });
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: textWidget(
                          'Reply',
                          color: AppColors.primaryColor,
                          fontSize:
                              Theme.of(context).textTheme.titleSmall?.fontSize,
                        ),
                      ),
                    )
                  ],
                ),
                textWidget(
                  "2 days Ago",
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                )
              ],
            ));
      });
}

class singleCommentModal extends StatelessWidget {
  const singleCommentModal({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return const CommentAndResponse();
            }),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 40,
          ),
          child: Row(
            children: [
              Image.asset(AppIcons.userIcon),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          // color: AppColors.lightBlack,
                          border: Border.all(color: AppColors.transparent)),
                      child: customTextField(
                          borderColor: AppColors.lightBlack,
                          hintText: "Add a comment"))),
              const SizedBox(
                width: 10,
              ),
              Image.asset(AppIcons.sendBtnIcon),
            ],
          ),
        ),
      ),
    );
  }
}

class editDeleteShareModal extends StatelessWidget {
  const editDeleteShareModal({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: themeProvider
              .themeData.colorScheme.onBackground, // AppColors.lightBlack,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AddTestimonyScreen.routeName,
                  arguments: TestimonyAction.Edit);
            },
            child: likeOrShare(AppIcons.editIcon, "Edit Post",
                containerColor: themeProvider
                    .themeData.colorScheme.onBackground, //AppColors.lightBlack,

                width: 15),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          GestureDetector(
            onTap: () {
              showDeleteDialogOverlay(context, "Delete Post");
            },
            child: likeOrShare(AppIcons.deleteIcon, "Delete Post",
                containerColor:
                    themeProvider.themeData.colorScheme.onBackground,
                // AppColors.lightBlack,
                width: 15),
          ),
          lineWidget(
              width: double.infinity,
              color: themeProvider.themeData.colorScheme.outline),
          likeOrShare(AppIcons.shareIcon, "Share Post",
              containerColor: themeProvider.themeData.colorScheme.onBackground,
              // AppColors.lightBlack,
              width: 15),
        ],
      ),
    );
  }
}

// Widget editDeleteShareModal(BuildContext context) {
//   return Container(
//     height: 150.h,
//     decoration: const BoxDecoration(
//         color: AppColors.lightBlack,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(25), topRight: Radius.circular(25))),
//     child: Column(
//       children: [
//         SizedBox(
//           height: 15.h,
//         ),
//         InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, AddTestimonyScreen.routeName,
//                 arguments: TestimonyAction.Edit);
//           },
//           child: likeOrShare(AppIcons.editIcon, "Edit Post",
//               containerColor: AppColors.lightBlack, width: 15),
//         ),
//         lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
//         GestureDetector(
//           onTap: () {
//             showDeleteDialogOverlay(context, "Delete Post");
//           },
//           child: likeOrShare(AppIcons.deleteIcon, "Delete Post",
//               containerColor: AppColors.lightBlack, width: 15),
//         ),
//         lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
//         likeOrShare(AppIcons.shareIcon, "Share Post",
//             containerColor: AppColors.lightBlack, width: 15),
//       ],
//     ),
//   );

// }

class videoDetailsModal extends StatelessWidget {
  const videoDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
        decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        // height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  'Description',
                  fontSize: 15,
                  color: themeProvider.themeData.colorScheme.onTertiary,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: themeProvider.themeData.colorScheme.onTertiary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            lineWidget(
                width: double.infinity,
                color: themeProvider.themeData.colorScheme.outline),
            const SizedBox(
              height: 10,
            ),
            textWidget(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "Triplets after 25  years of marriage",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textColumn("30", "Likes"),
                textColumn("504", "Views"),
                textColumn("3 Jul", "2024"),
                textColumn("Childbirth", "Category"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // disclaimer

            textWidget("Disclaimer", fontSize: 14),
            textWidget(
              "This video was sourced from YouTube. We do not own the rights to this video in any form or way. It is posted here for the purpose of  sharing inspiring testimonies with our community",
              fontSize: 13,
            )
          ],
        ),
      ),
    );
  }
}

Widget textColumn(String firstText, String secondText) {
  return Expanded(
    child: Column(
      children: [
        textWidget(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            firstText,
            fontSize: 18),
        textWidget(
          secondText,
          fontSize: 13,
        ),
      ],
    ),
  );
}