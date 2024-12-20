import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/profile/presentation/widgets/giving_container.dart';
import 'package:itestified/src/features/profile/presentation/widgets/text_row.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, required this.transferType});

  static const routeName = '/account-details-screen';
  final TransferType transferType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          appbar2(
            "Donations",
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        textWidget(
                            "Please transfer to the account below, use the verification code as the narration, and upload your receipt for verification. Thank you for your generosity!",
                            fontSize: 15.sp,
                            color: AppColors.textColor),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  if (transferType == TransferType.USD) ...[
                    givingContainer([
                      TextRow(
                          title: "Account Holder",
                          value: "Elvis Aisosa  Igiebor"),
                      TextRow(title: "Bank Name", value: "Wells Fargo"),
                      TextRow(
                          title: "Account Number", value: "40630232503732813"),
                      TextRow(title: "Routing Number", value: "121000248"),
                      TextRow(title: "Swift Code", value: "WFBIUS6S"),
                      TextRow(title: "Address", value: "651 N"),
                    ], title: "For USD Payments"),
                  ],
                  if (transferType == TransferType.NGN)
                    givingContainer([
                      TextRow(
                          title: "Account Holder",
                          value: "Raenest/Elvis Aisosa  Igiebor"),
                      TextRow(
                          title: "Bank Name", value: "Kredi Money  MFB LTD"),
                      TextRow(title: "Account Number", value: "1830029269"),
                    ], title: "For NGN Payments"),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget('Verification Code',
                      color: AppColors.white, fontSize: 15),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          textWidget('12A765FG',
                              color: AppColors.textColor, fontSize: 15),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Icon(
                              Icons.copy,
                              size: 15,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  textWidget('Upload Payment Reciept',
                      color: AppColors.white, fontSize: 15),
                  SizedBox(
                    height: 15.h,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.sp),
                    padding: const EdgeInsets.all(6),
                    color: AppColors.primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppIcons.browseFilesIcon),
                          SizedBox(
                            height: 5.h,
                          ),
                          textWidget("Browse Files",
                              color: AppColors.primaryColor, fontSize: 14),
                          SizedBox(
                            height: 10.h,
                          ),
                          textWidget("PDF,PNG up to 5mb",
                              color: AppColors.textColor, fontSize: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  btnAndText(
                      borderColor: AppColors.transparent,
                      verticalPadding: 12,
                      text: 'Submit',
                      textColor: AppColors.textColor,
                      containerColor: AppColors.greyColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
