import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/modals.dart';

import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/video/presentation/widgets/likeOrShare.dart';

class MyTestimoniesDetailsScreen extends StatelessWidget {
  const MyTestimoniesDetailsScreen({super.key, this.isFromProfile = false});

  final bool isFromProfile;

  static const routeName = '/my-testimony-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(AppIcons.backIcon)),
        actions: [
          if (isFromProfile) ...[
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return editDeleteShareModal(context);
                      });
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.white,
                ))
          ],
          if (!isFromProfile) ...[
            Container(
              margin: EdgeInsets.only(right: 10),
              color: Colors.black.withOpacity(0.5),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.opaqueBlack,
                child: Image.asset(
                  width: 12,
                  AppIcons.favoriteIcon,
                ),
              ),
            )
          ],
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textWidget('Jesus changed genotype!', fontSize: 17.sp),
              SizedBox(
                height: 10.h,
              ),
              // user pic, name , category
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
                      textWidget("Chika Amaka", fontSize: 13),
                      Row(
                        children: [
                          textWidget("Healing ",
                              fontSize: 12.sp, color: AppColors.textColor),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            color: AppColors.textColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          textWidget(" 30 minutes ago",
                              fontSize: 12.sp, color: AppColors.textColor),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                //  height: 100.h,
                width: 500.w,
                child: Text(
                  "sickle cell genotype. Countless hospital visits and painful crises became a part of my life. My faith in God was strong, but the struggle was relentless. Despite the adversity, I held on to the hope that one day, I would experience healing.One evening, during a powerful prayer session at my church, I felt an overwhelming sense of peace and warmth envelop me. The pastor, led by the Spirit, specifically prayed for those suffering from chronic illnesses. As the congregation joined in fervent prayer, I felt a shift within me. It was as if a heavy burden was being lifted off my shoulders.In the weeks that followed, I noticed a remarkable change. The frequent crises that had plagued my life began to subside. My energy levels increased, and I felt a renewed sense of vitality. Encouraged by these changes, I decided to visit my doctor for a comprehensive check-up.The results were nothing short of a miracle. My genotype had changed from SS to AA. The doctors were baffled, unable to explain the transformation scientifically. But I knew the truth—it was Jesus who had healed me.Today, I live free from the pain and limitations that once defined my life. My story is a testament to the incredible power of faith and prayer. Jesus changed my genotype, and with it, He transformed my entire life. I now use my testimony to encourage others, reminding them that with God, all things are possible.",
                  style: normalTextStyle(
                      textColor: AppColors.textColor, fontSize: 14.sp),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 230.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blackColor),
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      likeOrShare(AppIcons.likeIcon, '10',
                          containerColor: AppColors.lightBlack),
                      InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                        //  height: 70.h,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 30.h),
                                        color: AppColors.backgroundColor,
                                        //  height: 50,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: textWidget('Comments',
                                              color: AppColors.white,
                                              fontSize: 20.sp),
                                        )),
                                    Container(
                                        height: 400.h,
                                        child: commentListModal(context)),
                                  ],
                                );
                              });
                        },
                        child: likeOrShare(AppIcons.commentIcon, '10',
                            containerColor: AppColors.lightBlack),
                      ),
                      likeOrShare(AppIcons.shareIcon, '10',
                          containerColor: AppColors.lightBlack)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
