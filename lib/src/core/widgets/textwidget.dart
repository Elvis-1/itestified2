import 'package:flutter/material.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class TextWidgets {
  static Widget textWidget24(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.left,
      FontWeight fontWeight = FontWeight.w600,
      Color? color}) {
    var theme = Theme.of(context);
    var mainColor = color ?? theme.colorScheme.onSurface;
    return Text(
      textAlign: textAlign,
      text,
      style: theme.textTheme.displaySmall?.copyWith(
          color: mainColor,
          fontWeight: fontWeight,
          letterSpacing: 0,
          height: 29.05 / 24),
    );
  }

  static Widget textWidget12(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      Color? color,
      FontWeight fontWeight = FontWeight.w400,
      double lineHeight = 14.52,
      int maxLines = 1}) {
    var theme = Theme.of(context);
    Color mainColor = color ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.onTertiary;
    return Text(
      text,
      //  maxLines: maxLines,
      //   overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: fontWeight,
          color: color ?? mainColor,
          height: lineHeight / 12,
          letterSpacing: 0),
    );
  }

  static Widget textWidget10(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      Color? color,
      FontWeight fontWeight = FontWeight.w400,
      double lineHeight = 12.1,
      int maxLines = 1,
      double fontSize = 10}) {
    var theme = Theme.of(context);
    //  Color mainColor = theme.colorScheme.error;
    Color mainColor = color ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.onTertiary;
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: fontWeight,
          color: color ?? mainColor,
          fontSize: fontSize,
          height: lineHeight / 10,
          letterSpacing: 0),
    );
  }

  static Widget textWidget6(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      Color? color,
      FontWeight fontWeight = FontWeight.w400,
      double lineHeight = 12.1}) {
    var theme = Theme.of(context);
    Color mainColor = theme.colorScheme.error;
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: fontWeight,
          color: color ?? mainColor,
          fontSize: 6,
          height: lineHeight / 6,
          letterSpacing: 0),
    );
  }

  static Widget textWidget14(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.w400,
      Color? textColor,
      int maxLine = 1,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    var theme = Theme.of(context);

    var color = textColor ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.onTertiary;

    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: theme.textTheme.bodyMedium?.copyWith(
          color: color,
          height: 16.94 / 14,
          fontWeight: fontWeight,
          letterSpacing: 0),
    );
  }

  static Widget textWidget16(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.w500,
      Color? color}) {
    var theme = Theme.of(context);

    var mainColor = color ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.onTertiary;
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.bodyLarge?.copyWith(
          color: mainColor,
          fontWeight: fontWeight,
          height: 19.36 / 16,
          letterSpacing: 0),
    );
  }

  static Widget textWidget18(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.w600,
      Color? color}) {
    var theme = Theme.of(context);
    //var mainColor = color ?? theme.colorScheme.onSurfaceVariant;
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: fontWeight,
          height: 18 / 18,
          letterSpacing: 0),
    );
  }

  static Widget textWidget20(BuildContext context, String text,
      {TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.w600,
      Color? mainColor}) {
    var theme = Theme.of(context);
    var color = mainColor ??
        Provider.of<ThemeViewmodel>(context).themeData.colorScheme.tertiary;
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.headlineMedium?.copyWith(
          color: color,
          fontWeight: fontWeight,
          height: 24.2 / 20,
          letterSpacing: 0),
    );
  }
}
