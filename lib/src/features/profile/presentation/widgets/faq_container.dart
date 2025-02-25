import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class faqContainer extends StatelessWidget {
  const faqContainer(this.title, this.details, this.showDetails, {super.key});
  final String title;
  final String details;
  final bool showDetails;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: themeProvider.themeData.searchBarTheme.backgroundColor
              ?.resolve({}),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  title,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
                showDetails
                    ? Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            softWrap: true, // Allows wrapping to the next line
                            overflow: TextOverflow.visible,
                            details,

                            style: normalTextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize,
                                textColor: themeProvider
                                    .themeData.colorScheme.tertiary),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          !showDetails
              ? Icon(
                  Icons.arrow_drop_down,
                  color: themeProvider.themeData.colorScheme.tertiary,
                )
              : Icon(
                  Icons.arrow_drop_up_rounded,
                  color: themeProvider.themeData.colorScheme.tertiary,
                )
        ],
      ),
    );
  }
}
