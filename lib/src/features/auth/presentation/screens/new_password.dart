import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/widgets/text_fields.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, this.args});
  final Arguments? args;
  static const routeName = '/new-password';

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        elevation: 0,
        title: const appbar2('New Password'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: textWidget(
                        "Create a secure password for your account",
                        fontWeight: FontWeight.w300,
                        fontSize: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  LayoutBuilder(builder: (context, constraints) {
                    bool isLargeScreen = constraints.maxWidth > 600;
                    double contentWidth = isLargeScreen ? 500 : double.infinity;

                    return Center(
                      child: SizedBox(
                        width: contentWidth,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              passwordTile(
                                useType: UseType.CreateNewPassword,
                                text: "New Password",
                                normalTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                authProvider,
                              ),
                              const SizedBox(height: 25),
                              confirmPasswordTile(
                                useType: UseType.CreateNewPassword,
                                normalTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                authProvider,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: textWidget(
                                  "Password must be at least 8 characters",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: themeProvider
                                      .themeData.colorScheme.tertiary,
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen ? 40 : screenHeight * 0.2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    authProvider.setNewPassword(
                                      context,
                                      widget.args!.email,
                                      showSuccessMessage: true,
                                    );
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: btnAndText(
                                    fontSize: 18,
                                    verticalPadding: 14,
                                    containerWidth: double.infinity,
                                    text: "Create New Password",
                                  ),
                                ),
                              ),
                              Selector<AuthViewModel, bool>(
                                selector: (_, provider) =>
                                    provider.passwordCreatedSuccessfully,
                                builder: (context, passwordCreatedSuccessfully,
                                    child) {
                                  return passwordCreatedSuccessfully
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 20),
                                          child: Container(
                                            width: 345,
                                            height: 62,
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.1),
                                              ),
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.2),
                                            ),
                                            child: Center(
                                              child: textWidget(
                                                "Password created successfully, use this password when next you want to log in",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: themeProvider.themeData
                                                    .colorScheme.tertiary,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
