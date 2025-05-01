import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar("Change my password", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // check platform

              LayoutBuilder(builder: ((context, constraints) {
                bool isLargeScreeen = constraints.maxWidth > 600;
                return isLargeScreeen
                    ? Row(
                        children: [
                          Expanded(child: currentPassTile(context)),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(child: newPassTile(context))
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          currentPassTile(context),
                          newPassTile(context),
                        ],
                      );
              })),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Confirm Password",
                style: normalTextStyle(
                  textColor: themeProvider.themeData.colorScheme.onTertiary,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                
    
                borderColor: themeProvider.themeData.colorScheme.outline,
                hintText: "Re-enter new Password",
                
                prefixIc: Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(
                height: 250,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),

        //   padding: EdgeInsets.only(bottom: ),
        height: 50,
        child: Align(
            alignment: Alignment.center,
            child: btnAndText(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                verticalPadding: 14,
                containerWidth: double.infinity,
                text: "Change my  password")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget currentPassTile(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Current Password",
        style: normalTextStyle(
          textColor: themeProvider.themeData.colorScheme.onTertiary,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      customTextField(
        hintText: "Enter Current Password",
        prefixIc: Icon(
          Icons.lock_outline,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}

Widget newPassTile(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "New Password",
        style: normalTextStyle(
          textColor: themeProvider.themeData.colorScheme.onTertiary,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      customTextField(
        hintText: "Enter New Password",
        prefixIc: Icon(
          Icons.lock_outline,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
