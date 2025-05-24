import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/widgets/text_fields.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600;

    final horizontalMargin = screenWidth * 0.05;
    final contentSpacing = 16.0;
    final headerSpacing = 8.0;
       final headertitle = 18.0;
    final fontSizeTitle = isTablet ? 28.0 : 28.0;
    final fontSizeBody = isTablet ? 16.0 : 16.0;
    final buttonWidth = isMobile ? double.infinity : screenWidth * 0.4;
    final iconSize = isTablet ? 56.0 : 46.0;
    final lineWidth = screenWidth * 0.4;

    TextStyle style = normalTextStyle(
      textColor: themeProvider.themeData.colorScheme.onTertiary,
      fontSize: headertitle,
    );

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        title: textWidget(
          "Create an account",
          fontWeight: FontWeight.w500,
          color: themeProvider.themeData.colorScheme.onTertiary,
          fontSize: fontSizeTitle,
        ),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, av, child) {
          return LoaderOverlay(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: contentSpacing),
                          nameTile(style, av),
                          SizedBox(height: contentSpacing),
                          emailTile(style, av),
                          SizedBox(height: contentSpacing),
                          passwordTile(style, av),
                          SizedBox(height: contentSpacing),
                          confirmPasswordTile(style, av),
                          SizedBox(height: contentSpacing * 2),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                av.registerUser(context);
                              }
                            },
                            child: btnAndText(
                              fontSize: fontSizeBody,
                              verticalPadding: isTablet ? 16.0 : 14.0,
                              containerWidth: buttonWidth,
                              text: "Create Account",
                            ),
                          ),
                        ),
                        SizedBox(height: contentSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            lineWidget(
                              color:
                                  themeProvider.themeData.colorScheme.tertiary,
                              height: 0.4,
                              width: lineWidth,
                            ),
                            Text(
                              " OR ",
                              style: normalTextStyle(
                                fontSize: fontSizeBody,
                                fontWeight: FontWeight.w300,
                                textColor: themeProvider
                                    .themeData.colorScheme.tertiary,
                              ),
                            ),
                            lineWidget(
                              color:
                                  themeProvider.themeData.colorScheme.tertiary,
                              height: 0.4,
                              width: lineWidth,
                            ),
                          ],
                        ),
                        SizedBox(height: contentSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            themeProvider.themeData == AppThemes.darkTheme
                                ? Image.asset(AppIcons.googleIcon,
                                    width: iconSize, height: iconSize)
                                : Image.asset(AppIcons.googleLightIcon,
                                    width: iconSize, height: iconSize),
                            SizedBox(width: headerSpacing * 2),
                            themeProvider.themeData == AppThemes.darkTheme
                                ? Image.asset(AppIcons.appleIcon,
                                    width: iconSize, height: iconSize)
                                : Image.asset(AppIcons.appleLightIcon,
                                    width: iconSize, height: iconSize),
                          ],
                        ),
                        SizedBox(height: contentSpacing * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textWidget(
                              "Already have an account?",
                              fontSize: fontSizeBody,
                              color: themeProvider
                                  .themeData.colorScheme.onTertiary,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: textWidget(
                                " Log in",
                                fontSize: fontSizeBody,
                                fontWeight: FontWeight.w600,
                                color: themeProvider.themeData.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: contentSpacing),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
