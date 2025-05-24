import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/custom_textfield.dart';
import 'package:itestified/src/core/widgets/dropdown_btn.dart';
import 'package:itestified/src/core/widgets/multiline_textfield.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/testimony_posted_successfully.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class AddTestimonyScreen extends StatelessWidget {
  const AddTestimonyScreen({super.key, required this.action});

  static const routeName = '/add-testimony-screen';
  final TestimonyAction action;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final bool isMobile = screenWidth < 600;

    final double horizontalPadding = _getResponsivePadding(screenWidth);
    final double maxContentWidth = _getMaxContentWidth(screenWidth);
    final double buttonHeight = _getButtonHeight(screenWidth);
    final double verticalSpacing = _getVerticalSpacing(screenWidth);

    return Scaffold(
      appBar: generalAppbar(
        action == TestimonyAction.Edit ? "Update Testimony" : "Add Testimony",
        context,
      ),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalSpacing,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormFields(context, isMobile, verticalSpacing),
                    SizedBox(height: verticalSpacing),
                    _buildDescriptionSection(context, screenWidth),
                    SizedBox(height: verticalSpacing * 2),
                    _buildSubmitButton(
                      context,
                      buttonHeight,
                      screenWidth,
                    ),
                    SizedBox(height: mediaQuery.viewInsets.bottom + 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, bool isMobile, double spacing) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField(context),
          SizedBox(height: spacing),
          _buildCategoryDropdown(context),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildTitleField(context)),
          SizedBox(width: spacing),
          Expanded(child: _buildCategoryDropdown(context)),
        ],
      );
    }
  }

  Widget _buildTitleField(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = _getResponsiveFontSize(screenWidth, 'body');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Title",
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _getFieldSpacing(screenWidth)),
        customTextField(
          hintText: "Enter your title",
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = _getResponsiveFontSize(screenWidth, 'body');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Category",
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _getFieldSpacing(screenWidth)),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: _getDropdownPadding(screenWidth),
          ),
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.outline,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: const DropdownBTN(),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context, double screenWidth) {
    final fontSize = _getResponsiveFontSize(screenWidth, 'body');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Description",
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _getFieldSpacing(screenWidth)),
        const MultilineTextField(),
      ],
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    double buttonHeight,
    double screenWidth,
  ) {
    final fontSize = _getResponsiveFontSize(screenWidth, 'button');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const TestimonyPostedSuccessfully(),
          ),
        );
      },
      child: Container(
        height: buttonHeight,
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 80,
        ),
        child: btnAndText(
          verticalPadding: _getButtonPadding(screenWidth),
          text: action == TestimonyAction.Edit ? "Save changes" : "Post",
          fontSize: fontSize,
          containerWidth: double.infinity,
        ),
      ),
    );
  }

  double _getResponsivePadding(double screenWidth) {
    if (screenWidth < 360) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 1024) return 32;
    return 40;
  }

  double _getMaxContentWidth(double screenWidth) {
    if (screenWidth < 600) return double.infinity;
    if (screenWidth < 1024) return 800;
    if (screenWidth < 1440) return 1000;
    return 1200;
  }

  double _getButtonHeight(double screenWidth) {
    if (screenWidth < 360) return 56;
    if (screenWidth < 600) return 64;
    if (screenWidth < 1024) return 70;
    return 76;
  }

  double _getVerticalSpacing(double screenWidth) {
    if (screenWidth < 360) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 1024) return 24;
    return 28;
  }

  double _getFieldSpacing(double screenWidth) {
    if (screenWidth < 600) return 8;
    return 10;
  }

  double _getDropdownPadding(double screenWidth) {
    if (screenWidth < 600) return 4;
    return 5;
  }

  double _getButtonPadding(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 14;
    return 15;
  }

  double _getResponsiveFontSize(double screenWidth, String type) {
    switch (type) {
      case 'body':
        if (screenWidth < 360) return 14;
        if (screenWidth < 600) return 16;
        if (screenWidth < 1024) return 18;
        return 20;
      case 'button':
        if (screenWidth < 360) return 16;
        if (screenWidth < 600) return 18;
        if (screenWidth < 1024) return 20;
        return 22;
      default:
        return 16;
    }
  }
}
