import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/widgets/text_fields.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final authProvider = Provider.of<AuthViewModel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600;

    final horizontalMargin = screenWidth * 0.05;
    final contentSpacing = 16.0;
    final fontSizeTitle = isTablet ? 22.0 : 20.0;
    final fontSizeBody = isTablet ? 16.0 : 14.0;
    final buttonWidth = isMobile ? double.infinity : screenWidth * 0.4;

    TextStyle style = normalTextStyle(
      textColor: themeProvider.themeData.colorScheme.onTertiary,
      fontSize: fontSizeTitle,
    );

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const appbar2('Forgot Password'),
                SizedBox(height: contentSpacing),
                textWidget(
                  "Enter your email below, and we will send you a one-time password (OTP) to reset your password.",
                  fontWeight: FontWeight.w100,
                  fontSize: fontSizeBody,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: contentSpacing * 2),
                Form(
                  key: _formKey,
                  child: emailTile(style, authProvider,
                      useType: UseType.ForgotPassword),
                ),
                SizedBox(height: contentSpacing * 2),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authProvider.forgotPassword(context);
                      }
                    },
                    child: btnAndText(
                      fontSize: fontSizeBody,
                      verticalPadding: isTablet ? 16.0 : 14.0,
                      containerWidth: buttonWidth,
                      text: "Reset Password",
                    ),
                  ),
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
