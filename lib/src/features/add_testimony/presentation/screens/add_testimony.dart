import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
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

    return Scaffold(
      appBar: generalAppbar(
        action == TestimonyAction.Edit ? "Update Testimony" : "Add Testimony",
        context,
      ),
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800), 
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isLargeScreen = constraints.maxWidth > 600;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLargeScreen
                          ? Row(
                              children: [
                                Expanded(child: _buildTitleField(context)),
                                const SizedBox(width: 20),
                                Expanded(
                                    child: _buildCategoryDropdown(context)),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTitleField(context),
                                const SizedBox(height: 20),
                                _buildCategoryDropdown(context),
                              ],
                            ),
                      const SizedBox(height: 20),
                      textWidget(
                        "Description",
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 10),
                      const MultilineTextField(),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TestimonyPostedSuccessfully()),
                          );
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          child: btnAndText(
                            verticalPadding: 15,
                            text: action == TestimonyAction.Edit
                                ? "Save changes"
                                : "Post",
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge?.fontSize,
                            containerWidth: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Title",
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        customTextField(
          borderColor: AppColors.lightBlack,
          hintText: "Enter your title",
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "Category",
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: themeProvider.themeData.colorScheme.onBackground,
          ),
          width: double.infinity,
          child: const DropdownBTN(),
        ),
      ],
    );
  }
}
