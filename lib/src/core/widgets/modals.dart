import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/video/presentation/widgets/comment_container.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';

Widget commentListModal(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView.builder(
          //  itemCount: 10,
          itemBuilder: (context, index) {
        return Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.w)),
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
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
                                "Our God is indeed a good God, he knows all, Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all Our God is indeed a good God, he knows all",
                                textAlign: TextAlign.left,
                                style:
                                    normalTextStyle(textColor: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        likeOrShare(AppIcons.likeIcon, '2'),
                        likeOrShare(AppIcons.unlikeIcon, '2')
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
                                      //  height: 70.h,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),
                                      color: AppColors.backgroundColor,
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
                                                color: AppColors.white,
                                                fontSize: 20.sp),
                                          ),
                                          Container()
                                        ],
                                      )),
                                  Container(
                                      height: 400.h,
                                      child: singleCommentModal(context)),
                                ],
                              );
                            });
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: textWidget('Reply',
                            color: AppColors.primaryColor, fontSize: 13.sp),
                      ),
                    )
                  ],
                ),
                textWidget("2 days Ago",
                    fontSize: 12.sp, color: AppColors.textColor)
              ],
            ));
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 5.h,
          bottom: 25,
        ),
        child: Row(
          children: [
            Image.asset(AppIcons.userIcon),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightBlack,
                        border: Border.all(color: AppColors.transparent)),
                    child: customTextField(context,
                        borderColor: AppColors.lightBlack,
                        hintText: "Add a comment"))),
            SizedBox(
              width: 10.w,
            ),
            Image.asset(AppIcons.sendBtnIcon),
          ],
        ),
      ),
    ),
  );
}

Widget singleCommentModal(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return const CommentAndResponse();
          }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 5.h,
          bottom: 40,
        ),
        child: Row(
          children: [
            Image.asset(AppIcons.userIcon),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightBlack,
                        border: Border.all(color: AppColors.transparent)),
                    child: customTextField(context,
                        borderColor: AppColors.lightBlack,
                        hintText: "Add a comment"))),
            SizedBox(
              width: 10.w,
            ),
            Image.asset(AppIcons.sendBtnIcon),
          ],
        ),
      ),
    ),
  );
}

Widget editDeleteShareModal(BuildContext context) {
  return Container(
    height: 150.h,
    decoration: const BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        likeOrShare(AppIcons.editIcon, "Edit Post",
            containerColor: AppColors.lightBlack, width: 15),
        lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
        GestureDetector(
          onTap: () async {
            await showDeleteDialogOverlay(context, "Delete Post");
          },
          child: likeOrShare(AppIcons.deleteIcon, "Delete Post",
              containerColor: AppColors.lightBlack, width: 15),
        ),
        lineWidget(width: double.infinity, color: AppColors.opaqueBlack),
        likeOrShare(AppIcons.shareIcon, "Share Post",
            containerColor: AppColors.lightBlack, width: 15),
      ],
    ),
  );
}

Widget videoDetailsModal() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    height: 300.h,
    color: AppColors.backgroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget('Description', fontSize: 14.sp),
            const Icon(
              Icons.clear,
              color: AppColors.white,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        lineWidget(width: double.infinity, color: AppColors.darkPurple),
        SizedBox(
          height: 10.h,
        ),
        textWidget("Triplets after 25  years of marriage", fontSize: 17),
        SizedBox(
          height: 15.h,
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
        SizedBox(
          height: 20.h,
        ),
        // disclaimer

        textWidget("Disclaimer", fontSize: 14.sp),
        textWidget(
            "This video was sourced from YouTube. We do not own the rights to this video in any form or way. It is posted here for the purpose of  sharing inspiring testimonies with our community",
            fontSize: 13.sp,
            color: AppColors.textColor)
      ],
    ),
  );
}

Widget textColumn(String firstText, String secondText) {
  return Column(
    children: [
      textWidget(firstText, fontSize: 18.sp),
      textWidget(secondText, fontSize: 13.sp, color: AppColors.textColor),
    ],
  );
}
