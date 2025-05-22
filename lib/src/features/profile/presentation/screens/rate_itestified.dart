import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/review_viewmodel.dart';

import 'package:provider/provider.dart';

class RateItestified extends StatelessWidget {
  const RateItestified({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final viewModel = Provider.of<ReviewViewModel>(context);
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
                              onTap: () => viewModel.setRating(index + 1),
                              child: Image.asset(
                                AppIcons.ratingIcon,
                                width: starSize,
                                height: starSize,
                                color: index < viewModel.selectedRating
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
                      MultilineTextField(
                        hintText: "Enter your review here...",
                        onChanged: (value) => viewModel.setReviewText(value),
                      ),
                      if (viewModel.errorMessage != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                      const Spacer(),
                      SafeArea(
                        top: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: isSmallScreen ? 10 : 20,
                          ),
                          child: GestureDetector(
                            onTap: viewModel.selectedRating > 0 &&
                                    !viewModel.isLoading
                                ? () async {
                                    final success =
                                        await viewModel.submitReview();
                                    if (success) {
                                      viewModel.clear();
                                      await showRateSubmittedDialogOverlay(
                                        context,
                                        "Rating submitted successfully",
                                      );
                                    }
                                  }
                                : null,
                            child: btnAndText(
                              containerWidth: double.infinity,
                              containerHeight: buttonHeight,
                              borderColor: AppColors.transparent,
                              text: viewModel.isLoading
                                  ? 'Submitting...'
                                  : 'Submit',
                              isLoading: viewModel.isLoading,
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
