// import 'package:flutter/material.dart';
// import 'package:itestified/src/config/theme/app_color.dart';
// import 'package:itestified/src/core/utils/app_const/app_icons.dart';
// import 'package:itestified/src/core/utils/app_const/enum.dart';
// import 'package:itestified/src/core/widgets/custom_textfield.dart';
// import 'package:itestified/src/core/widgets/dialog.dart';
// import 'package:itestified/src/core/widgets/line_widget.dart';
// import 'package:itestified/src/core/widgets/normal_text_style.dart';
// import 'package:itestified/src/core/widgets/text_widget.dart';
// import 'package:itestified/src/features/add_testimony/presentation/screens/add_testimony.dart';
// import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
// import 'package:itestified/src/features/video/presentation/widgets/comment_container.dart';
// import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
// import 'package:provider/provider.dart';

// class commentListModal extends StatelessWidget {
//   const commentListModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return SafeArea(child: LayoutBuilder(
//       builder: (context, constraints) {
//         bool isLargeScreen = constraints.maxWidth > 800;
//         return Scaffold(
//             backgroundColor: themeProvider.themeData.colorScheme.background,
//             body: isLargeScreen
//                 ? Row(
//                     children: [const SizedBox.shrink()],
//                   )
//                 : mainContent(context),
//             bottomNavigationBar:
//                 isLargeScreen ? SizedBox.shrink() : rightColumn(context));
//       },
//     ));
//   }
// }

// Widget mainContent(BuildContext context) {
//   return leftColumn(context);
// }

// Widget rightColumn(BuildContext context) {
//   var themeProvider = Provider.of<ThemeViewmodel>(context);

//   // textfield
//   return Container(
//     padding: EdgeInsets.only(
//         left: 5, right: 5, bottom: MediaQuery.of(context).viewInsets.bottom),
//     margin: const EdgeInsets.only(
//       left: 10,
//       right: 10,
//       top: 5,
//       bottom: 28,
//     ),
//     child: Row(
//       children: [
//         Image.asset(AppIcons.userIcon),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//             child: Container(
//                 child: customTextField(
//                     borderColor: themeProvider.themeData.colorScheme.tertiary,
//                     hintText: "Add a comment"))),
//         const SizedBox(
//           width: 10,
//         ),
//         Image.asset(AppIcons.sendBtnIcon),
//       ],
//     ),
//   );
// }

// Widget leftColumn(BuildContext context) {
//   var themeProvider = Provider.of<ThemeViewmodel>(context);
// // list of comments
//   return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
//             margin: const EdgeInsets.only(bottom: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(AppIcons.userIcon),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             textWidget(
//                               "Chika Amaka",
//                               fontSize: Theme.of(context)
//                                   .textTheme
//                                   .titleMedium
//                                   ?.fontSize,
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             SizedBox(
//                               width: 250,
//                               child: Text(
//                                 "Our God is indeed a good God, he knows all, Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all",
//                                 textAlign: TextAlign.left,
//                                 style: normalTextStyle(
//                                     textColor: themeProvider
//                                         .themeData.colorScheme.tertiary),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         likeOrShare(AppIcons.likeIcon, '2',
//                             containerColor: AppColors.transparent),
//                         likeOrShare(AppIcons.unlikeIcon, '2',
//                             containerColor: AppColors.transparent)
//                       ],
//                     ),
//                     InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return ListView(
//                                 shrinkWrap: true,
//                                 children: [
//                                   Container(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 30),
//                                       color: themeProvider
//                                           .themeData.colorScheme.background,
//                                       //  height: 50,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: InkWell(
//                                                 onTap: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: const Icon(
//                                                     Icons.arrow_back_ios_new)),
//                                           ),
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: textWidget('Comments',
//                                                 fontWeight: FontWeight.w500,
//                                                 color: themeProvider.themeData
//                                                     .colorScheme.onTertiary,
//                                                 fontSize: 20),
//                                           ),
//                                           Container()
//                                         ],
//                                       )),
//                                   const SizedBox(
//                                       height: 400, child: singleCommentModal()),
//                                 ],
//                               );
//                             });
//                       },
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: textWidget(
//                           'Reply',
//                           color: AppColors.primaryColor,
//                           fontSize:
//                               Theme.of(context).textTheme.titleSmall?.fontSize,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 textWidget(
//                   "2 days Ago",
//                   fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
//                 )
//               ],
//             ));
//       });
// }

// class singleCommentModal extends StatelessWidget {
//   const singleCommentModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: themeProvider.themeData.colorScheme.background,
//         body: ListView.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return const CommentAndResponse();
//             }),
//         bottomNavigationBar: Container(
//           padding: EdgeInsets.only(
//               left: 5,
//               right: 5,
//               bottom: MediaQuery.of(context).viewInsets.bottom),
//           margin: const EdgeInsets.only(
//             left: 10,
//             right: 10,
//             top: 5,
//             bottom: 40,
//           ),
//           child: Row(
//             children: [
//               Image.asset(AppIcons.userIcon),
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                   child: Container(
//                       decoration: BoxDecoration(
//                           // color: AppColors.lightBlack,
//                           border: Border.all(color: AppColors.transparent)),
//                       child: customTextField(
//                           borderColor: AppColors.lightBlack,
//                           hintText: "Add a comment"))),
//               const SizedBox(
//                 width: 10,
//               ),
//               Image.asset(AppIcons.sendBtnIcon),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class editDeleteShareModal extends StatelessWidget {
//   const editDeleteShareModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return Container(
//       height: 150,
//       decoration: BoxDecoration(
//           color: themeProvider
//               .themeData.colorScheme.onBackground, // AppColors.lightBlack,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25), topRight: Radius.circular(25))),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 15,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(context, AddTestimonyScreen.routeName,
//                   arguments: TestimonyAction.Edit);
//             },
//             child: likeOrShare(AppIcons.editIcon, "Edit Post",
//                 containerColor: themeProvider
//                     .themeData.colorScheme.onBackground, //AppColors.lightBlack,

//                 width: 15),
//           ),
//           lineWidget(
//               width: double.infinity,
//               color: themeProvider.themeData.colorScheme.outline),
//           GestureDetector(
//             onTap: () {
//               showDeleteDialogOverlay(context, "Delete Post");
//             },
//             child: likeOrShare(AppIcons.deleteIcon, "Delete Post",
//                 containerColor:
//                     themeProvider.themeData.colorScheme.onBackground,
//                 // AppColors.lightBlack,
//                 width: 15),
//           ),
//           lineWidget(
//               width: double.infinity,
//               color: themeProvider.themeData.colorScheme.outline),
//           likeOrShare(AppIcons.shareIcon, "Share Post",
//               containerColor: themeProvider.themeData.colorScheme.onBackground,
//               // AppColors.lightBlack,
//               width: 15),
//         ],
//       ),
//     );
//   }
// }

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

// class videoDetailsModal extends StatelessWidget {
//   const videoDetailsModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
//         decoration: BoxDecoration(
//             color: themeProvider.themeData.colorScheme.background,
//             borderRadius: BorderRadius.circular(10)),
//         // height: 300.h,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 textWidget(
//                   'Description',
//                   fontSize: 15,
//                   color: themeProvider.themeData.colorScheme.onTertiary,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.clear,
//                     color: themeProvider.themeData.colorScheme.onTertiary,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             lineWidget(
//                 width: double.infinity,
//                 color: themeProvider.themeData.colorScheme.outline),
//             const SizedBox(
//               height: 10,
//             ),
//             textWidget(
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               "Triplets after 25  years of marriage",
//               fontSize: 17,
//               fontWeight: FontWeight.w500,
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 textColumn("30", "Likes"),
//                 textColumn("504", "Views"),
//                 textColumn("3 Jul", "2024"),
//                 textColumn("Childbirth", "Category"),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // disclaimer

//             textWidget("Disclaimer", fontSize: 14),
//             textWidget(
//               "This video was sourced from YouTube. We do not own the rights to this video in any form or way. It is posted here for the purpose of  sharing inspiring testimonies with our community",
//               fontSize: 13,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget textColumn(String firstText, String secondText) {
//   return Expanded(
//     child: Column(
//       children: [
//         textWidget(
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             firstText,
//             fontSize: 18),
//         textWidget(
//           secondText,
//           fontSize: 13,
//         ),
//       ],
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/add_testimony.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import 'normal_text_style.dart';


// Mock comment data model
class Comment {
  final String userName;
  final String text;
  final String timestamp;
  final int likes;
  final int dislikes;
  final List<Comment> replies;

  Comment({
    required this.userName,
    required this.text,
    required this.timestamp,
    this.likes = 0,
    this.dislikes = 0,
    this.replies = const [],
  });
}

// Mock comment data
final List<Comment> mockComments = [
  Comment(
    userName: "Chika Amaka",
    text:
        "Our God is indeed a good God, he knows all, Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all",
    timestamp: "2 days Ago",
    likes: 2,
    dislikes: 2,
    replies: [
      Comment(
        userName: "John Doe",
        text: "Absolutely agree! Amazing testimony.",
        timestamp: "1 day Ago",
        likes: 1,
        dislikes: 0,
      ),
    ],
  ),
  Comment(
    userName: "Ada Obi",
    text: "This is so inspiring! Thank you for sharing.",
    timestamp: "3 days Ago",
    likes: 5,
    dislikes: 0,
  ),
];

class commentListModal extends StatelessWidget {
  const commentListModal({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the modal when tapping outside
      },
      behavior: HitTestBehavior.opaque,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {}, // Empty callback to prevent taps inside from closing
          child: Container(
            height: 651,
            decoration: BoxDecoration(
              color: themeProvider.themeData.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                        'Comments',
                        fontWeight: FontWeight.w600,
                        color: themeProvider.themeData.colorScheme.onTertiary,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                // Comment list
                Expanded(
                  child: mockComments.isEmpty
                      ? Center(
                          child: textWidget(
                            'No comments yet',
                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                            color: themeProvider.themeData.colorScheme.onTertiary,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          itemCount: mockComments.length,
                          itemBuilder: (context, index) {
                            final comment = mockComments[index];
                            print('Rendering comment: ${comment.userName}');
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppIcons.userIcon,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textWidget(
                                          comment.userName,
                                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                                          color: themeProvider.themeData.colorScheme.onTertiary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          comment.text,
                                          style: normalTextStyle(
                                            textColor: themeProvider.themeData.colorScheme.tertiary,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            likeOrShare(
                                              Symbols.thumb_up, // Replaced AppIcons.likeIcon
                                              comment.likes.toString(),
                                              containerColor: AppColors.transparent,
                                            ),
                                            const SizedBox(width: 10),
                                            likeOrShare(
                                              Symbols.thumb_down, // Replaced AppIcons.unlikeIcon
                                              comment.dislikes.toString(),
                                              containerColor: AppColors.transparent,
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              useRootNavigator: true,
                                              builder: (modalContext) {
                                                return singleCommentModal(comment: comment);
                                              },
                                            );
                                          },
                                          child: textWidget(
                                            'Reply (${comment.replies.length})',
                                            color: AppColors.primaryColor,
                                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  textWidget(
                                    comment.timestamp,
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: themeProvider.themeData.colorScheme.tertiary,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                rightColumn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rightColumn(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
    decoration: BoxDecoration(
      color: themeProvider.themeData.colorScheme.surface,
      border: Border(
        top: BorderSide(
          color: themeProvider.themeData.colorScheme.outline,
          width: 1,
        ),
      ),
    ),
    child: Row(
      children: [
        Image.asset(
          AppIcons.userIcon,
          width: 36,
          height: 36,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: customTextField(
            borderColor: themeProvider.themeData.colorScheme.outline,
            hintText: "Add a comment",
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Send comment tapped');
          },
          child: Icon(
            Symbols.send, // Replaced AppIcons.sendBtnIcon
            size: 24,
            color: themeProvider.themeData.colorScheme.onTertiary,
          ),
        ),
      ],
    ),
  );
}

Widget commentSection(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: themeProvider.themeData.colorScheme.outline,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            textWidget(
              "Comments",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            textWidget(
              "(${mockComments.length})",
              fontSize: 12,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            print('Opening commentListModal');
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              builder: (context) => const commentListModal(),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppIcons.userIcon, width: 24, height: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Our God is indeed good to me...",
                  style: normalTextStyle(
                    textColor: themeProvider.themeData.colorScheme.tertiary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              textWidget(
                "2 days Ago",
                fontSize: 12,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class singleCommentModal extends StatelessWidget {
  final Comment comment;

  const singleCommentModal({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            decoration: BoxDecoration(
              color: themeProvider.themeData.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textWidget(
                            'Comment',
                            fontWeight: FontWeight.w600,
                            color: themeProvider.themeData.colorScheme.onTertiary,
                            fontSize: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppIcons.userIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(
                                  comment.userName,
                                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                                  color: themeProvider.themeData.colorScheme.onTertiary,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  comment.text,
                                  style: normalTextStyle(
                                    textColor: themeProvider.themeData.colorScheme.tertiary,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    likeOrShare(
                                      Symbols.thumb_up, // Replaced AppIcons.likeIcon
                                      comment.likes.toString(),
                                      containerColor: AppColors.transparent,
                                    ),
                                    const SizedBox(width: 10),
                                    likeOrShare(
                                      Symbols.thumb_down, // Replaced AppIcons.unlikeIcon
                                      comment.dislikes.toString(),
                                      containerColor: AppColors.transparent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          textWidget(
                            comment.timestamp,
                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Replies
                Expanded(
                  child: comment.replies.isEmpty
                      ? Center(
                          child: textWidget(
                            'No replies yet',
                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                            color: themeProvider.themeData.colorScheme.onTertiary,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          itemCount: comment.replies.length,
                          itemBuilder: (context, index) {
                            final reply = comment.replies[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppIcons.userIcon,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textWidget(
                                          reply.userName,
                                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                                          color: themeProvider.themeData.colorScheme.onTertiary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          reply.text,
                                          style: normalTextStyle(
                                            textColor: themeProvider.themeData.colorScheme.tertiary,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            likeOrShare(
                                              Symbols.thumb_up, // Replaced AppIcons.likeIcon
                                              reply.likes.toString(),
                                              containerColor: AppColors.transparent,
                                            ),
                                            const SizedBox(width: 10),
                                            likeOrShare(
                                              Symbols.thumb_down, // Replaced AppIcons.unlikeIcon
                                              reply.dislikes.toString(),
                                              containerColor: AppColors.transparent,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  textWidget(
                                    reply.timestamp,
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: themeProvider.themeData.colorScheme.tertiary,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                // Persistent reply input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: themeProvider.themeData.colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: themeProvider.themeData.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcons.userIcon,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: customTextField(
                          borderColor: themeProvider.themeData.colorScheme.onTertiary,
                          hintText: "Add a reply",
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          print('Send reply tapped');
                          // Implement send reply logic
                        },
                        child: Icon(
                          Symbols.send, // Replaced AppIcons.sendBtnIcon
                          size: 24,
                          color: themeProvider.themeData.colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class EditDeleteShareModal extends StatelessWidget {
  const EditDeleteShareModal({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final colorScheme = themeProvider.themeData.colorScheme;

    return Container(
      height: 200, // Slightly increased to accommodate symbols
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          // Edit Option
          _buildModalOption(
            context,
            icon: Icon(
              Symbols.edit,
              color: colorScheme.onSurface,
              size: 24,
              weight: 700,
              grade: 0,
              opticalSize: 24,
            ),
            label: "Edit Post",
            onTap: () {
              Navigator.pushNamed(
                context, 
                AddTestimonyScreen.routeName,
                arguments: TestimonyAction.Edit,
              );
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.outline,
          ),
          // Delete Option
          _buildModalOption(
            context,
            icon: Icon(
              Symbols.delete,
              color: colorScheme.error,
              size: 24,
              weight: 700,
              grade: 0,
              opticalSize: 24,
            ),
            label: "Delete Post",
            onTap: () {
              showDeleteDialogOverlay(context, "Delete Post");
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.outline,
          ),
          // Share Option
          _buildModalOption(
            context,
            icon: Icon(
              Symbols.share,
              color: colorScheme.onSurface,
              size: 24,
              weight: 700,
              grade: 0,
              opticalSize: 24,
            ),
            label: "Share Post",
            onTap: () {
              // Add share functionality here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModalOption(
    BuildContext context, {
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      minLeadingWidth: 24,
    );
  }
}

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
            const SizedBox(height: 15),
            lineWidget(
                width: double.infinity,
                color: themeProvider.themeData.colorScheme.outline),
            const SizedBox(height: 10),
            textWidget(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "Triplets after 25 years of marriage",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textColumn("30", "Likes"),
                textColumn("504", "Views"),
                textColumn("3 Jul", "2024"),
                textColumn("Childbirth", "Category"),
              ],
            ),
            const SizedBox(height: 20),
            textWidget("Disclaimer", fontSize: 14),
            textWidget(
              "This video was sourced from YouTube. We do not own the rights to this video in any form or way. It is posted here for the purpose of sharing inspiring testimonies with our community",
              fontSize: 13,
            ),
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
