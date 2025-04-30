import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class numberTextField extends StatelessWidget {
  numberTextField(this.controller,
      {super.key,
      this.readOnly = false,
      this.borderWidth = 1,
      this.containerWidth = 40,
      this.containerHeight = 35,
      required this.focusNode,
      required this.onEdit});

  TextEditingController controller;
  bool readOnly;
  double borderWidth;
  Color borderColor = AppColors.borderColor;

  double containerWidth = 40;
  double containerHeight = 35;
  FocusNode focusNode;
  Function(String value) onEdit;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    borderColor = themeProvider.themeData.colorScheme.outline;
    return Container(
        width: containerWidth,
        height: containerHeight,
        //  margin: EdgeInsets.only(bottom: screenHeight / 40),
        decoration: BoxDecoration(
          color: themeProvider.themeData.colorScheme.background,
          border: Border.all(width: borderWidth, color: borderColor),
          // Color(0xFFC4C4C4),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          //   boxShadow: [boxShadow]
        ),
        child: Container(
          //  padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: TextFormField(
              // textInputAction: TextInputAction.next,
              style: TextStyle(
                  color: themeProvider.themeData.colorScheme.onTertiary),
              onChanged: (value) {
                onEdit(value);
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              focusNode: focusNode,
              controller: controller,
              maxLength: 1,
              // maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.number,

              //textInputAction: TextInputType.number,
              textAlign: TextAlign.center,
              readOnly: readOnly,
              // controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: false,

              decoration: InputDecoration(
                  counterText: "",
                  //  hintText: '1',
                  hintStyle: GoogleFonts.getFont('Mulish',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: themeProvider.themeData.colorScheme.onTertiary),
                  // contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: InputBorder.none),

              maxLines: 1,
            ),
          ),
        ));
  }
}

Widget numberTextFieldWithoutS() {
  return Container(
      width: 40,
      //  margin: EdgeInsets.only(bottom: screenHeight / 40),
      decoration: BoxDecoration(
          color: AppColors.lightGrayColor,
          // Color(0xFFC4C4C4),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: const [
            BoxShadow(
                //   blurRadius: 5,
                color: Colors.black26,
                offset: Offset(
                  2,
                  4,
                ))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
          maxLength: 1,
          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,

          //textInputAction: TextInputType.number,
          textAlign: TextAlign.center,
          // controller: controller,
          enableSuggestions: false,
          autocorrect: false,
          obscureText: false,
          decoration: InputDecoration(
              counterText: "",
              hintText: '1',
              hintStyle: GoogleFonts.getFont('Mulish',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Color(0x80000000)),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none),
          maxLines: 1,
        ),
      ));
}
