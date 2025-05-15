import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/number_text_field.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/animations/timer.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class Arguments {
  String email;
  Arguments({required this.email});
}

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.args,
  });
  static const routeName = '/verify-email-screen';

  final Arguments args;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authVM = Provider.of<AuthViewModel>(context, listen: false);
      authVM.initializeTimer();
      authVM.focusNodes[0].requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    var avm = Provider.of<AuthViewModel>(
      context,
    );
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: themeProvider.themeData.colorScheme.background,
          title: textWidget('Verify Your Email')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'We sent a code to ',
                          style: normalTextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.fontSize,
                              textColor: themeProvider
                                  .themeData.colorScheme.tertiary)),
                      TextSpan(
                          text: widget.args.email,
                          style: normalTextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize,
                              textColor: themeProvider
                                  .themeData.colorScheme.onTertiary)),
                    ],
                  )),
              textWidget("Kindly enter the code below",
                  fontWeight: FontWeight.w100,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: themeProvider.themeData.colorScheme.tertiary,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 35,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(4, (index) {
                      return numberTextField(
                        key: ValueKey('otpField_$index'),
                        containerHeight: 70,
                        containerWidth: 80,
                        avm.otpControllers[index],
                        focusNode: avm.focusNodes[index],
                        onEdit: (value) {
                          if (value.length == 1) {
                            if (index + 1 < avm.otpControllers.length) {
                              FocusScope.of(context)
                                  .requestFocus(avm.focusNodes[index + 1]);
                            } else {
                              avm.focusNodes[index].unfocus();
                            }
                          }
                        },
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget(
                    avm.seconddsRemainingForResetPass == 0
                        ? "Didn't recieve any mail?"
                        : "Code is valid for",
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      avm.emailController.text = widget.args.email;

                      await avm.resendEmail(context, avm.emailController.text);
                      avm.resetTimer();
                    },
                    child: avm.seconddsRemainingForResetPass == 0
                        ? textWidget(
                            "Resend mail",
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          )
                        : CounterDownTimer(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
