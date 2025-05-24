import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/utils/input_validator.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

Widget nameTile(TextStyle style, AuthViewModel authViewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Full Name",
        style: style,
      ),
      const SizedBox(),
      customTextField2(
          controller: authViewModel.fullNameController,
          errorText: authViewModel.nameError,
          authViewModel: authViewModel,
          onChange: (value) => authViewModel.validateFields(
              value!,
              authViewModel.emailController.text,
              authViewModel.passwordController.text,
              authViewModel.confirmPasswordController.text),
          prefixIc: Icon(
            Icons.person_2_outlined,
            color: Colors.grey.shade700,
            size: 24,
          )),
    ],
  );
}

Widget passwordTile(TextStyle style, AuthViewModel authViewModel,
    {bool? islast,
    UseType useType = UseType.SignUP,
    String text = "Password"}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: style),
      const SizedBox(height: 10),
      Selector<AuthViewModel, String>(
        selector: (_, provider) => provider.passwordController.text,
        builder: (context, passwordText, child) {
          final themeProvider =
              Provider.of<ThemeViewmodel>(context, listen: false);
          final isLightMode =
              themeProvider.themeData.brightness == Brightness.light;
          final isTyping = passwordText.isNotEmpty;
          final iconColor = isTyping
              ? (isLightMode
                  ? themeProvider.themeData.colorScheme.tertiary
                  : themeProvider.themeData.colorScheme.onTertiary)
              : Colors.grey.shade700;
          return customTextField2(
            obscureText: !authViewModel.showPassword,
            errorText: authViewModel.passwordErr,
            isLast: islast,
            onChange: (value) => authViewModel.validateFields(
              authViewModel.fullNameController.text,
              authViewModel.emailController.text,
              value!,
              authViewModel.confirmPasswordController.text,
              useType: useType,
              showErrors: false,
            ),
            validate: (value) =>
                Validators.validatePassword(value, useType: useType),
            controller: authViewModel.passwordController,
            hintText: "Enter Password",
            prefixIc: Icon(
              Icons.lock_outline,
              color: iconColor,
            ),
            suffixIcon: InkWell(
              onTap: () {
                authViewModel.showOrHidePassword();
              },
              child: Icon(
                authViewModel.showPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 24,
                color: iconColor,
              ),
            ),
          );
        },
      ),
    ],
  );
}

Widget confirmPasswordTile(
  TextStyle style,
  AuthViewModel authViewModel, {
  UseType useType = UseType.SignUP,
  bool? islast,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Confirm Password", style: style),
      const SizedBox(height: 10),
      Selector<AuthViewModel, String>(
        selector: (_, provider) => provider.confirmPasswordController.text,
        builder: (context, confirmPasswordText, child) {
          final themeProvider =
              Provider.of<ThemeViewmodel>(context, listen: false);
          final isLightMode =
              themeProvider.themeData.brightness == Brightness.light;
          final isTyping = confirmPasswordText.isNotEmpty;
          final iconColor = isTyping
              ? (isLightMode
                  ? themeProvider.themeData.colorScheme.tertiary
                  : themeProvider.themeData.colorScheme.onTertiary)
              : Colors.grey.shade700;
          return customTextField2(
            obscureText: !authViewModel.showPassword,
            isLast: true,
            controller: authViewModel.confirmPasswordController,
            errorText: authViewModel.confirmPassErr,
            authViewModel: authViewModel,
            validate: (value) {
              return Validators.validateConfirmPassword(
                  value, authViewModel.passwordController.text);
            },
            onChange: (value) => authViewModel.validateFields(
              authViewModel.fullNameController.text,
              authViewModel.emailController.text,
              authViewModel.passwordController.text,
              value!,
              useType: useType,
              showErrors: false,
            ),
            hintText: 'Re-Enter Password',
            prefixIc: Icon(
              Icons.lock_outlined,
              color: iconColor,
            ),
            suffixIcon: InkWell(
              onTap: () {
                authViewModel.showOrHidePassword();
              },
              child: Icon(
                authViewModel.showPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 24,
                color: iconColor,
              ),
            ),
          );
        },
      ),
    ],
  );
}

Widget emailTile(TextStyle style, AuthViewModel authViewModel,
    {UseType useType = UseType.SignUP}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email Address",
        style: style,
      ),
      const SizedBox(
        height: 10,
      ),
      customTextField2(
          controller: authViewModel.emailController,
          keyboardType: TextInputType.emailAddress,
          errorText: authViewModel.emailError,
          authViewModel: authViewModel,
          onChange: (value) => authViewModel.validateFields(
              authViewModel.fullNameController.text,
              value!,
              authViewModel.passwordController.text,
              authViewModel.confirmPasswordController.text,
              useType: useType),
          validate: Validators.validateEmail,
          hintText: "Enter Email Address",
          prefixIc: Icon(
            Icons.email_outlined,
            size: 24,
            color: Colors.grey.shade700,
          )),
    ],
  );
}
