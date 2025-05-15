import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/widgets/text_fields.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    var authProvider = Provider.of<AuthViewModel>(context);
    // new@mailinator.com
    // 12345678
    TextStyle style = normalTextStyle(
        textColor: themeProvider.themeData.colorScheme.onTertiary,
        fontSize: 20);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
     appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Symbols.close,
                color: themeProvider.themeData.colorScheme.onTertiary,
                size: 24,
              ),
            ),
            const SizedBox(width: 15),
            textWidget(
              "Welcome Back",
              fontWeight: FontWeight.w500,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600; // Define tablet breakpoint
        double contentWidth =
            isTablet ? 500 : double.infinity; // Limit width for tablets
        EdgeInsets padding = isTablet
            ? const EdgeInsets.only(right: 32.0, left: 32, bottom: 10)
            : const EdgeInsets.only(right: 24.0, left: 24, bottom: 5);
        return SingleChildScrollView(
          child: Center(
            child: Container(
              padding: padding,
              width: contentWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    emailTile(style, authProvider, useType: UseType.LogIn),

                    const SizedBox(
                      height: 20,
                    ),
                    passwordTile(style, authProvider,
                        islast: true, useType: UseType.LogIn),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                          },
                          child: Text(
                            "Forgot password?",
                            style: normalTextStyle(
                                textColor: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // login account btn
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authProvider.loginUser(context);
                        }
                        //   CommonPopup.showLoading(context);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return const NavBar();
                        // }));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: btnAndText(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.fontSize,
                              verticalPadding: 14,
                              containerWidth: double.infinity,
                              text: "Log in")),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // horizontal line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: lineWidget(
                              color:
                                  themeProvider.themeData.colorScheme.outline,
                              width: 170),
                        ),
                        Text(
                          " OR ",
                          style: normalTextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            fontWeight: FontWeight.w300,
                            textColor:
                                themeProvider.themeData.colorScheme.tertiary,
                          ),
                        ),
                        Expanded(
                          child: lineWidget(
                              color:
                                  themeProvider.themeData.colorScheme.outline,
                              width: 170),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // social login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        themeProvider.themeData == AppThemes.darkTheme
                            ? Image.asset(AppIcons.googleIcon)
                            : Image.asset(AppIcons.googleLightIcon),
                        const SizedBox(
                          width: 25,
                        ),
                        themeProvider.themeData == AppThemes.darkTheme
                            ? Image.asset(AppIcons.appleIcon)
                            : Image.asset(AppIcons.appleLightIcon),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                          "Don't have an account?",
                          fontWeight: FontWeight.w600,
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return const SignUpScreen();
                            }));
                          },
                          child: textWidget(
                            " Create account",
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
