import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/line_widget.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    TextStyle style = normalTextStyle(
        textColor: themeProvider.themeData.colorScheme.onTertiary,
        fontSize: 20);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: themeProvider.themeData.colorScheme.background,
        title: textWidget("Create an account",
            fontWeight: FontWeight.w500,
            color: themeProvider.themeData.colorScheme.onTertiary),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isLargeScreen = constraints.maxWidth > 600;
                    return isLargeScreen
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Full Name",
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customTextField(
                                            prefixIc: Icon(
                                          Icons.person_2_outlined,
                                          color: Colors.grey.shade700,
                                          size: 30,
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Email Address", style: style),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customTextField(
                                            hintText: "Enter Email Address",
                                            prefixIc: Icon(
                                              Icons.email_outlined,
                                              size: 30,
                                              color: Colors.grey.shade700,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Password", style: style),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customTextField(
                                            hintText: "Enter Password",
                                            prefixIc: Icon(
                                              Icons.lock_outline,
                                              color: Colors.grey.shade700,
                                            ),
                                            suffixIcon: Icon(
                                              Icons.visibility_off_outlined,
                                              size: 30,
                                              color: Colors.grey.shade700,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Confirm Password", style: style),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        customTextField(
                                            hintText: 'Re-Enter Password',
                                            prefixIc: Icon(
                                              Icons.lock_outlined,
                                              color: Colors.grey.shade700,
                                            ),
                                            suffixIcon: Icon(
                                              Icons.visibility_off_outlined,
                                              size: 30,
                                              color: Colors.grey.shade700,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Full Name",
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                  prefixIc: Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey.shade700,
                                size: 30,
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Email Address", style: style),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                  hintText: "Enter Email Address",
                                  prefixIc: Icon(
                                    Icons.email_outlined,
                                    size: 30,
                                    color: Colors.grey.shade700,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Password", style: style),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                  hintText: "Enter Password",
                                  prefixIc: Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey.shade700,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility_off_outlined,
                                    size: 30,
                                    color: Colors.grey.shade700,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Confirm Password", style: style),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                  hintText: 'Re-Enter Password',
                                  prefixIc: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.grey.shade700,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility_off_outlined,
                                    size: 30,
                                    color: Colors.grey.shade700,
                                  )),
                              const SizedBox(
                                height: 50,
                              ),

                              // create account btn
                            ],
                          );
                  },
                ),
                Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: btnAndText(
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            verticalPadding: 14,
                            containerWidth: double.infinity,
                            text: "Create Account")),

                    const SizedBox(
                      height: 20,
                    ),
                    // horizontal line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        lineWidget(
                            color: themeProvider.themeData.colorScheme.outline,
                            width: 170),
                        Text(
                          " OR ",
                          style: normalTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            textColor:
                                themeProvider.themeData.colorScheme.tertiary,
                          ),
                        ),
                        lineWidget(
                            color: themeProvider.themeData.colorScheme.outline,
                            width: 170),
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

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget("Already have an account?",
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            color:
                                themeProvider.themeData.colorScheme.onTertiary),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                          child: textWidget(
                            " Log in",
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize,
                            fontWeight: FontWeight.w600,
                            color: themeProvider.themeData.primaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
