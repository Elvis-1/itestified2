import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  static const routeName = '/new-password';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.themeData.colorScheme.background,
        title: textWidget("Create New Password"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    textWidget(
                        "Your new password must be different from previously used passwords",
                        fontWeight: FontWeight.w100,
                        fontSize: 15,
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 20,
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      bool isLargeScreen = constraints.maxWidth > 600;
                      return !isLargeScreen
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Password",
                                  style: normalTextStyle(
                                    textColor: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                  ),
                                ),
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
                                Text(
                                  "Confirm Password",
                                  style: normalTextStyle(
                                    textColor: themeProvider
                                        .themeData.colorScheme.onTertiary,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                customTextField(
                                    hintText: "Enter Password",
                                    suffixIcon: Icon(
                                      Icons.visibility_off_outlined,
                                      size: 30,
                                      color: Colors.grey.shade700,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New Password",
                                        style: normalTextStyle(
                                          textColor: themeProvider
                                              .themeData.colorScheme.onTertiary,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.fontSize,
                                        ),
                                      ),
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
                                      Text(
                                        "Confirm Password",
                                        style: normalTextStyle(
                                          textColor: themeProvider
                                              .themeData.colorScheme.onTertiary,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.fontSize,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      customTextField(
                                          hintText: "Enter Password",
                                          suffixIcon: Icon(
                                            Icons.visibility_off_outlined,
                                            size: 30,
                                            color: Colors.grey.shade700,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            );
                    }),
                    textWidget(
                      "Password must be at least 8 characters",
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            // login account btn
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const NavBar();
                }));
              },
              child: Align(
                  alignment: Alignment.center,
                  child: btnAndText(
                      fontSize: 18,
                      verticalPadding: 14,
                      containerWidth: double.infinity,
                      text: "Create New Password")),
            ),

            const SizedBox(
              height: 20,
            ),
            // horizontal line
          ],
        ),
      ),
    );
  }
}
