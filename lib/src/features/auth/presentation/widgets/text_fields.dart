import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/utils/input_validator.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';

Widget nameTile(TextStyle style, AuthViewModel authViewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Full Name",
        style: style,
      ),
      const SizedBox(
        height: 10,
      ),
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
      const SizedBox(
        height: 10,
      ),
      customTextField2(
          obscureText: !authViewModel.showPassword,
          errorText: authViewModel.passwordErr,
          isLast: islast,
          onChange: (value) => authViewModel.validateFields(
              authViewModel.fullNameController.text,
              authViewModel.emailController.text,
              value!,
              authViewModel.confirmPasswordController.text,
              useType: useType),
          validate: Validators.validatePassword,
          controller: authViewModel.passwordController,
          hintText: "Enter Password",
          prefixIc: Icon(
            Icons.lock_outline,
            color: Colors.grey.shade700,
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
              color: Colors.grey.shade700,
            ),
          )),
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
      const SizedBox(
        height: 10,
      ),
      customTextField2(
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
              useType: useType,
              authViewModel.fullNameController.text,
              authViewModel.emailController.text,
              authViewModel.passwordController.text,
              value!),
          hintText: 'Re-Enter Password',
          prefixIc: Icon(
            Icons.lock_outlined,
            color: Colors.grey.shade700,
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
              color: Colors.grey.shade700,
            ),
          )),
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
