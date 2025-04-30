import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

customSnack(BuildContext context, String message) {
  var themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
  showTopSnackBar(
    Overlay.of(context),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              color: themeProvider.themeData.colorScheme.outline)
        ],
        color: themeProvider.themeData.colorScheme.background,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryColor),
            child: const Icon(
              Icons.check,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: textWidget(maxLines: 5, fontSize: 14, message),
          )
        ],
      ),
    ),
  );
}
