import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/snack_bar.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isLoading = false;

  Future<void> _changePassword() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    customSnackbar('You have successfully changed your password', context);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      appBar: generalAppbar(
        "Change my password",
        context,
      ),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(builder: ((context, constraints) {
                bool isLargeScreen = constraints.maxWidth > 600;
                return isLargeScreen
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
                          const SizedBox(
                            height: 20,
                          ),
                          currentPassTile(context),
                          newPassTile(context),
                        ],
                      );
              })),
              const SizedBox(
                height: 30,
              ),
              TextWidgets.textWidget16(
                context,
                "Confirm Password",
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                suffixIconEnabled: true,
                borderColor: themeProvider.themeData.colorScheme.outline,
                hintText: "Re-enter new Password",
                prefixIc: Icon(
                  Symbols.lock_outline,
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
        height: 54,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: _isLoading ? null : _changePassword,
                child: btnAndText(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    containerColor: AppColors.grey50,
                    textColor: themeProvider.themeData.colorScheme.surface,
                    borderColor: AppColors.grey50,
                    verticalPadding: 14,
                    containerWidth: double.infinity,
                    text: "Change my password",
                    isLoading: _isLoading),
              ),
            ],
          ),
        ),
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
      TextWidgets.textWidget16(
        context,
        "Current Password",
        fontWeight: FontWeight.w400,
      ),
      const SizedBox(
        height: 10,
      ),
      customTextField(
        suffixIconEnabled: true,
        hintText: "Enter Current Password",
        borderColor: Colors.transparent,
        borderWidth: 0,
        prefixIc: Icon(
          Symbols.lock_outline,
          color: Colors.grey.shade700,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen()));
          },
          child: TextWidgets.textWidget12(
            context,
            "Forget Password?",
            fontWeight: FontWeight.w400,
            color: themeProvider.themeData.colorScheme.onTertiary,
          ),
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
      TextWidgets.textWidget16(
        context,
        "New Password",
        fontWeight: FontWeight.w400,
      ),
      const SizedBox(
        height: 10,
      ),
      customTextField(
        suffixIconEnabled: true,
        hintText: "Enter New Password",
        borderColor: Colors.transparent,
        borderWidth: 0,
        prefixIc: Icon(
          Symbols.lock_outline,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
