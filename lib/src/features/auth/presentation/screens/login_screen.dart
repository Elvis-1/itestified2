import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/widgets/text_fields.dart';
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
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600;

    // Dynamic scaling
    final horizontalMargin = screenWidth * 0.05;
    final contentSpacing = 16.0;
    final headerSpacing = 8.0;
    final headertitle = 18.0;
    final fontSizeTitle = isTablet ? 28.0 : 28.0;
    final fontSizeBody = isTablet ? 16.0 : 14.0;
    final buttonWidth = isMobile ? double.infinity : screenWidth * 0.4;
    final iconSize = isTablet ? 56.0 : 46.0;

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
          "Welcome Back",
          fontWeight: FontWeight.w500,
          color: themeProvider.themeData.colorScheme.onTertiary,
          fontSize: fontSizeTitle,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: contentSpacing),
                emailTile(style, authProvider, useType: UseType.LogIn),
                SizedBox(height: contentSpacing),
                passwordTile(style, authProvider,
                    islast: true, useType: UseType.LogIn),
                SizedBox(height: contentSpacing),
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
                          fontWeight: FontWeight.w700,
                          fontSize: fontSizeBody,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: contentSpacing),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authProvider.loginUser(context);
                      }
                    },
                    child: btnAndText(
                      fontSize: fontSizeBody,
                      verticalPadding: isTablet ? 16.0 : 14.0,
                      containerWidth: buttonWidth,
                      text: "Log in",
                    ),
                  ),
                ),
                SizedBox(height: contentSpacing),
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
                SizedBox(height: contentSpacing * 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget(
                      "Don't have an account?",
                      fontWeight: FontWeight.w600,
                      fontSize: fontSizeBody,
                      color: themeProvider.themeData.colorScheme.onTertiary,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.routeName);
                      },
                      child: textWidget(
                        " Create account",
                        fontSize: fontSizeBody,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: contentSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
