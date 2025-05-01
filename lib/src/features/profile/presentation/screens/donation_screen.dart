import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/account_details_screen.dart';
import 'package:itestified/src/features/profile/presentation/widgets/donations_title.dart';
import 'package:provider/provider.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  static const routeName = '/donation-screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Donations", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.darkPurple),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppIcons.logoIcon),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      textWidget(
                          "Your generous support helps us continue our mission to spread the word of God. Thank you for your contribution and God bless You!",
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
                          color: AppColors.textColor),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: textWidget("CEO: Elvis Igiebor",
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            color: AppColors.textColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LayoutBuilder(builder: (context, constraint) {
                  bool isLargeScreen = constraint.maxWidth > 600;
                  return isLargeScreen
                      ? Row(
                          children: [
                            Expanded(
                              child: donationsTitle("Donate in NGN", () {
                                Navigator.pushNamed(
                                    context, AccountDetailsScreen.routeName,
                                    arguments: TransferType.NGN);
                              }, context),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: donationsTitle("Donate in USD", () {
                                Navigator.pushNamed(
                                    context, AccountDetailsScreen.routeName,
                                    arguments: TransferType.USD);
                              }, context),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            donationsTitle("Donate in NGN", () {
                              Navigator.pushNamed(
                                  context, AccountDetailsScreen.routeName,
                                  arguments: TransferType.NGN);
                            }, context),
                            donationsTitle("Donate in USD", () {
                              Navigator.pushNamed(
                                  context, AccountDetailsScreen.routeName,
                                  arguments: TransferType.USD);
                            }, context),
                          ],
                        );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
