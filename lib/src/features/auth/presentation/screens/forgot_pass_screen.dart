import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
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
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var authProvider = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: LayoutBuilder(builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        double contentWidth =
            isTablet ? 500 : double.infinity; 
        EdgeInsets padding = isTablet
            ? const EdgeInsets.only(right: 32.0, left: 32, bottom: 10)
            : const EdgeInsets.only(right: 24.0, left: 24, bottom: 5);
        return SafeArea(
          child: Center(
            child: Container(
              width: contentWidth,
              padding: padding,
              //  margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appbar2('Forgot Password'),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        textWidget(
                            "Enter your email below and we will send you instrutions on how to reset your password",
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 35,
                        ),
                        // Text(
                        //   "Email Address",
                        //   style: normalTextStyle(
                        //       textColor:
                        //           themeProvider.themeData.colorScheme.onTertiary,
                        //       fontSize: 20),
                        // ),

                        Form(
                          key: _formKey,
                          child: emailTile(
                              normalTextStyle(fontSize: 18), authProvider,
                              useType: UseType.ForgotPassword),
                        )
                      ],
                    ),
                  ),

                  // login account btn

                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              authProvider.forgotPassword(context);
                            }
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: btnAndText(
                                  fontSize: 18,
                                  verticalPadding: 14,
                                  containerWidth: double.infinity,
                                  text: "Reset Password")),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: btnAndText2(
                                  container: const Icon(
                                    Icons.chevron_left,
                                    color: AppColors.primaryColor,
                                  ),
                                  fontSize: 18,
                                  textColor: AppColors.primaryColor,
                                  containerColor: AppColors.transparent,
                                  verticalPadding: 14,
                                  containerWidth: double.infinity,
                                  text: "Back to login")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
