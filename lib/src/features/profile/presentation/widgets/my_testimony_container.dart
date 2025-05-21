import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/modals.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class MyTestimonyContainer extends StatefulWidget {
  const MyTestimonyContainer({Key? key}) : super(key: key);

  @override
  State<MyTestimonyContainer> createState() => _MyTestimonyContainerState();
}

class _MyTestimonyContainerState extends State<MyTestimonyContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final horizontalPadding = screenWidth * 0.03;
    final verticalPadding = screenWidth * 0.02;

    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: themeProvider.themeData.colorScheme.outline,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Jesus Changed my Genotype!",
                  style: TextStyle(
                    fontSize: 14,
                    color: themeProvider.themeData.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.pendingColor),
                ),
                child: Text(
                  'Pending',
                  style: normalTextStyle(
                    fontSize: 10,
                    textColor: AppColors.pendingColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: verticalPadding),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospitals visits and painful crises became a part of my life in',
                  style: normalTextStyle(
                    fontSize: 12,
                    textColor: themeProvider.themeData.colorScheme.tertiary,
                  ),
                  maxLines: _isExpanded ? null : 3,
                  overflow: _isExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                ),
                if (!_isExpanded)
                  Text(
                    'See more',
                    style: normalTextStyle(
                      fontSize: 12,
                      textColor: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: verticalPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.userIcon,
                      width: screenWidth * 0.08,
                      height: screenWidth * 0.08,
                    ),
                    SizedBox(width: horizontalPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Chika Amaka",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeProvider.themeData.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Healing",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: themeProvider
                                        .themeData.colorScheme.tertiary,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 5,
                                  width: 5,
                                  color: themeProvider
                                      .themeData.colorScheme.tertiary,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "30 minutes ago",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: themeProvider
                                        .themeData.colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const EditDeleteShareModal(),
                  );
                },
                icon: Icon(
                  Icons.more_horiz_sharp,
                  color: themeProvider.themeData.colorScheme.onSurface,
                ),
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.1,
                  maxHeight: screenWidth * 0.1,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
