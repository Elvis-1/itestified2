import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/authprovider.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/widgets/giving_container.dart';
import 'package:itestified/src/features/profile/presentation/widgets/text_row.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_textfield.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, required this.transferType});

  static const routeName = '/account-details-screen';
  final TransferType transferType;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    final customColors = Theme.of(context).extension<AppCustomColors>();

    return Scaffold(
      appBar: generalAppbar("Donations", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 2),
                        textWidget(
                          "Please transfer to the account below, use the verification code as the narration, and upload your receipt for verification. Thank you for your generosity!",
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (transferType == TransferType.USD) ...[
                    givingContainer([
                      TextRow(
                          title: "Account Holder",
                          value: "Elvis Aisosa Igiebor"),
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
                          value: "Raenest/Elvis Aisosa Igiebor"),
                      TextRow(title: "Bank Name", value: "Kredi Money MFB LTD"),
                      TextRow(title: "Account Number", value: "1830029269"),
                    ], title: "For NGN Payments"),
                  const SizedBox(height: 15),
                  textWidget(
                    'Verification Code',
                    color: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 15,
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        textWidget('12A765FG', fontSize: 15),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Icon(
                            Icons.copy,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (authProvider.isGuest) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: textWidget(
                        "Email Address",
                        fontSize: 18,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    customTextField(
                      prefixIc: const Icon(Icons.email_outlined),
                      borderColor: themeProvider.themeData.colorScheme.outline,
                      hintText: 'Enter Email Address',
                    ),
                    const SizedBox(height: 15),
                  ],
                  textWidget(
                    'Upload Payment Receipt',
                    color: themeProvider.themeData.colorScheme.onTertiary,
                    fontSize: 15,
                  ),
                  const SizedBox(height: 15),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    color: AppColors.primaryColor,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.browseFilesIcon,
                            color: themeProvider.themeData.colorScheme.tertiary,
                          ),
                          const SizedBox(height: 5),
                          textWidget(
                            "Browse Files",
                            color: AppColors.primaryColor,
                            fontSize:
                                Theme.of(context).textTheme.bodySmall?.fontSize,
                          ),
                          const SizedBox(height: 10),
                          textWidget(
                            "PDF,PNG up to 5mb",
                            fontSize: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.fontSize,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  btnAndText(
                    borderColor: AppColors.transparent,
                    verticalPadding: 12,
                    text: 'Submit',
                    textColor: AppColors.white,
                    containerColor:
                        customColors?.donationBtn ?? AppColors.greyColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
