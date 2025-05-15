import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
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
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.themeData.colorScheme.background,
        title: textWidget("Create New Password"),
      ),
      body: SingleChildScrollView(
        reverse: true,
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

              double contentWidth = isLargeScreen
                  ? 500
                  : double.infinity; // Limit width for tablets
              EdgeInsets padding = isLargeScreen
                  ? const EdgeInsets.only(right: 32.0, left: 32, bottom: 10)
                  : const EdgeInsets.only(right: 15.0, left: 15, bottom: 5);
              return Center(
                child: Container(
                  padding: padding,
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
                                fontSize: 18, fontWeight: FontWeight.w400),
                            authProvider),
                        const SizedBox(
                          height: 25,
                        ),
                        confirmPasswordTile(
                            useType: UseType.CreateNewPassword,
                            normalTextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            authProvider),
                        const SizedBox(
                          height: 400,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              authProvider.setNewPassword(
                                  context, widget.args!.email);
                            }
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: btnAndText(
                                  fontSize: 18,
                                  verticalPadding: 14,
                                  containerWidth: double.infinity,
                                  text: "Create New Password")),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              // :

              // Row(
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment:
              //               CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "New Password",
              //               style: normalTextStyle(
              //                 textColor: themeProvider
              //                     .themeData.colorScheme.onTertiary,
              //                 fontSize: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge
              //                     ?.fontSize,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             customTextField(
              //                 hintText: "Enter Password",
              //                 prefixIc: Icon(
              //                   Icons.lock_outline,
              //                   color: Colors.grey.shade700,
              //                 ),
              //                 suffixIcon: Icon(
              //                   Icons.visibility_off_outlined,
              //                   size: 30,
              //                   color: Colors.grey.shade700,
              //                 )),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment:
              //               CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Confirm Password",
              //               style: normalTextStyle(
              //                 textColor: themeProvider
              //                     .themeData.colorScheme.onTertiary,
              //                 fontSize: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge
              //                     ?.fontSize,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             customTextField(
              //                 hintText: "Enter Password",
              //                 suffixIcon: Icon(
              //                   Icons.visibility_off_outlined,
              //                   size: 30,
              //                   color: Colors.grey.shade700,
              //                 )),
              //           ],
              //         ),
              //       )
              //     ],
              //   );
            }),
            // textWidget(
            //   "Password must be at least 8 characters",
            //   fontWeight: FontWeight.w100,
            //   fontSize: 15,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),

      // login account btn

      // horizontal line
    );
  }
}
