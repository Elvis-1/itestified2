import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class RateItestified extends StatelessWidget {
  const RateItestified({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Rate iTestified", context),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Tap the stars below to rate your experience with iTesfied",
                textAlign: TextAlign.center,
                style: normalTextStyle(
                  textColor: themeProvider.themeData.colorScheme.onTertiary,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      5,
                      (index) => Image.asset(
                            width: 50,
                            // scale: 0.5,
                            AppIcons.ratingIcon,
                            color: AppColors.primaryColor,
                            fit: BoxFit.cover,
                          ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: textWidget(
                    "Review(optional)",
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  )),
              const SizedBox(
                height: 10,
              ),
              const multilineTextField(hintText: "Enter your review here ..."),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),

          //   padding: EdgeInsets.only(bottom: ),
          height: 50,
          child: GestureDetector(
            onTap: () async {
              await showRateSubmittedDialogOverlay(context, "Messsssss");
            },
            child: btnAndText(
              borderColor: AppColors.transparent,
              text: 'Submit',
              containerWidth: double.infinity,
              // containerColor: AppColors.redColor
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
