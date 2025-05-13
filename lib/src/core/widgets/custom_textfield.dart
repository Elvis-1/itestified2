import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

class customTextField extends StatefulWidget {
  customTextField({
    super.key,
    this.prefixIc,
    this.borderColor = AppColors.lightBlack,
    this.borderWidth = 1,
    this.suffixIcon = const SizedBox.shrink(),
    this.hintText = "Enter your full name",
    this.validate,
    this.controller,
    this.authViewModel,
    this.errorText,
    this.onChange,
    this.isLast = false,
    this.obscureText = false,
    this.suffixIconEnabled = false,
  });

  final String hintText;
  final Widget? prefixIc;
  final Widget suffixIcon;
  final double borderWidth;
  final Color borderColor;
  final String? Function(String? value)? validate;
  final TextEditingController? controller;
  final AuthViewModel? authViewModel;
  final bool? isLast;
  final bool obscureText;
  final bool suffixIconEnabled;
  final String? errorText;
  final String? Function(String? value)? onChange;

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    TextInputAction checkLast =
        widget.isLast == true ? TextInputAction.done : TextInputAction.next;

    Widget effectiveSuffixIcon = widget.suffixIconEnabled
        ? IconButton(
            icon: Icon(
              _isObscured ? Symbols.visibility_off : Symbols.visibility,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
        : widget.suffixIcon;

    return Column(
      children: [
        TextFormField(
          obscureText:
              widget.suffixIconEnabled ? _isObscured : widget.obscureText,
          textInputAction: checkLast,
          controller: widget.controller,
          validator: widget.validate,
          onChanged: widget.onChange,
          style: normalTextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            textColor: themeProvider.themeData.colorScheme.tertiary,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: widget.borderColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: widget.borderColor,
              ),
            ),
            suffixIcon: effectiveSuffixIcon,
            prefixIcon: widget.prefixIc,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            hintText: widget.hintText,
            hintStyle: normalTextStyle(
              textColor: themeProvider.themeData.colorScheme.onTertiary,
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: widget.borderColor,
              ),
            ),
            filled: true,
            error: null,
            errorStyle: const TextStyle(height: 0, fontSize: 0),
            fillColor: themeProvider.themeData.colorScheme.outline,
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 18),
              const SizedBox(width: 5),
              Text(
                widget.errorText ?? '',
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          )
        ]
      ],
    );
  }
}
// Widget customTextField(
//   BuildContext context, {
//   String hintText = "Enter your full name",
//   Widget? prefixIc,
//   Widget suffixIcon = const SizedBox.shrink(),
//   double borderWidth = 1,
//   Color borderColor = AppColors.lightBlack,
// }) {
//   var themeProvider = Provider.of<ThemeViewmodel>(context).themeData;

//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(
//         width: borderWidth,
//         color: borderColor,
//       ),
//       color: themeProvider.colorScheme.onBackground,
//     ),
//     width: double.infinity,
//     child: TextFormField(
//       style: normalTextStyle(
//           fontSize: 18, textColor: themeProvider.colorScheme.tertiary),
//       decoration: InputDecoration(
//           border: InputBorder.none,
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIc,
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
//           hintText: hintText,
//           hintStyle: normalTextStyle(
//               textColor: AppColors.opaqueBlack, fontSize: 18.sp)),
//     ),
//   );
// }


class customTextField2 extends StatefulWidget {
  customTextField2({
    super.key,
    this.prefixIc,
    this.suffixIcon = const SizedBox.shrink(),
    this.hintText = "Enter your full name",
    this.validate,
    this.controller,
    this.authViewModel,
    this.errorText,
    this.onChange,
    this.isLast = false,
    this.obscureText = false,
    this.suffixIconEnabled = false,
  });

  final String hintText;
  final Widget? prefixIc;
  final Widget suffixIcon;
  final String? Function(String? value)? validate;
  final TextEditingController? controller;
  final AuthViewModel? authViewModel;
  final bool? isLast;
  final bool obscureText;
  final bool suffixIconEnabled;
  final String? errorText;
  final String? Function(String? value)? onChange;

  @override
  State<customTextField2> createState() => _customTextField2State();
}

class _customTextField2State extends State<customTextField2> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;

  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    TextInputAction checkLast =
        widget.isLast == true ? TextInputAction.done : TextInputAction.next;

    Widget effectiveSuffixIcon = widget.suffixIconEnabled
        ? IconButton(
            icon: Icon(
              _isObscured ? Symbols.visibility_off : Symbols.visibility,
              color: themeProvider.themeData.colorScheme.onTertiary,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
                print('Toggled visibility: isObscured=$_isObscured');
              });
            },
          )
        : widget.suffixIcon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.outline,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Semantics(
            label: widget.hintText,
            child: TextFormField(
              obscureText:
                  widget.suffixIconEnabled ? _isObscured : widget.obscureText,
              textInputAction: checkLast,
              controller: widget.controller,
              validator: widget.validate,
              onChanged: widget.onChange,
              style: normalTextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                textColor: themeProvider.themeData.colorScheme.tertiary,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                suffixIcon: effectiveSuffixIcon,
                prefixIcon: widget.prefixIc,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                hintText: widget.hintText,
                hintStyle: normalTextStyle(
                  textColor: themeProvider.themeData.colorScheme.onTertiary,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                ),
                errorStyle: const TextStyle(height: 0, fontSize: 0),
              ),
            ),
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 18),
              const SizedBox(width: 5),
              Text(
                widget.errorText ?? '',
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ],
      ],
    );
  }
}