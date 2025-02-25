import 'package:flutter/cupertino.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class terms extends StatelessWidget {
  const terms(this.useText, {super.key});
  final String useText;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, right: 10),
          width: 3,
          height: 3,
          color: themeProvider.themeData.colorScheme.tertiary,
        ),
        Expanded(
          child: Text(
            useText,
            style: normalTextStyle(
              textColor: themeProvider.themeData.colorScheme.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}

class terms2 extends StatelessWidget {
  const terms2(this.useText, {super.key});
  final String useText;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, right: 10),
          width: 3,
          height: 3,
          color: themeProvider.themeData.colorScheme.tertiary,
        ),
        Expanded(
          child: Text(
            useText,
            style: normalTextStyle(
              textColor: themeProvider.themeData.colorScheme.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}
