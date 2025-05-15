import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class RateItestified extends StatefulWidget {
  const RateItestified({super.key});

  @override
  _RateItestifiedState createState() => _RateItestifiedState();
}

class _RateItestifiedState extends State<RateItestified> {
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: generalAppbar("Rate iTestified", context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalPadding = isSmallScreen ? 20.0 : screenWidth * 0.1;
          final starSize = isSmallScreen ? 40.0 : 50.0;
          final buttonHeight = isSmallScreen ? 48.0 : 54.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 40,
              ),
              child: IntrinsicHeight(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets.textWidget16(
                        context,
                        "Tap the stars below to rate your experience with iTestified",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Wrap(
                          spacing: isSmallScreen ? 8.0 : 12.0,
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedRating = index + 1),
                              child: Image.asset(
                                AppIcons.ratingIcon,
                                width: starSize,
                                height: starSize,
                                color: index < _selectedRating
                                    ? AppColors.darkPurple
                                    : AppColors.primaryColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextWidgets.textWidget16(
                        context,
                        "Review (optional)",
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 12),
                      const MultilineTextField(
                        hintText: "Enter your review here...",
                        // controller: _reviewController,
                      ),
                      const Spacer(),
                      SafeArea(
                        top: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: isSmallScreen ? 10 : 20,
                          ),
                          child: GestureDetector(
                            onTap: _selectedRating > 0
                                ? () async {
                                    await showRateSubmittedDialogOverlay(
                                      context,
                                      "Rating submitted successfully",
                                    );
                                  }
                                : null,
                            child: btnAndText(
                              containerWidth: double.infinity,
                              containerHeight: buttonHeight,
                              borderColor: AppColors.transparent,
                              text: 'Submit',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// class RateItestified extends StatefulWidget {
//   const RateItestified({super.key});

//   @override
//   _RateItestifiedState createState() => _RateItestifiedState();
// }

// class _RateItestifiedState extends State<RateItestified> {
//   int _selectedRating = 0;

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeViewmodel>(context);

//     return Scaffold(
//       appBar: generalAppbar("Rate iTestified", context),
//       backgroundColor: themeProvider.themeData.colorScheme.surface,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               TextWidgets.textWidget16(
//                 context,
//                 "Tap the stars below to rate your experience with iTestified",
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ...List.generate(
//                     5,
//                     (index) => GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedRating = index + 1;
//                         });
//                       },
//                       child: Image.asset(
//                         AppIcons.ratingIcon,
//                         width: 50,
//                         color: index < _selectedRating
//                             ? AppColors.darkPurple
//                             : AppColors.primaryColor.withOpacity(0.5),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: textWidget(
//                   "Review (optional)",
//                   textAlign: TextAlign.left,
//                   fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const MultilineTextField(hintText: "Enter your review here ..."),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         alignment: Alignment.bottomCenter,
//         margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
//         height: 50,
//         child: GestureDetector(
//           onTap: () async {
//             await showRateSubmittedDialogOverlay(
//                 context, "Rating submitted successfully");
//           },
//           child: btnAndText(
//             containerHeight: 54,
            
            
          
            
//             borderColor: AppColors.transparent,
//             text: 'Submit',
//             containerWidth: double.infinity,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
