import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class quoteContainer extends StatelessWidget {
  const quoteContainer({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 15),
    this.width = 223,
    this.height = 150,
    this.textSize = 12,
  });

  final EdgeInsets margin;
  final double width;
  final double height;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GestureDetector(
            onTap: () => _showModalBottomSheet(context),
            child: Container(
              height: height * 0.7, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(AppImages.quotesImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite_outline,
                        size: 15,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: textWidget(
              "Source: Southern Living",
              fontSize: textSize,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: themeProvider.themeData.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => AnimatedQuotesModal(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.60,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}

class InspirationalQuotesScreen extends StatelessWidget {
  static const routeName = '/inspirational-quotes';

  const InspirationalQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: generalAppbar('Inspirational Quotes', context),
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (isLargeScreen) {
              return _buildLargeScreenGrid(context);
            } else {
              return _buildSmallScreenList(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLargeScreenGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const quoteContainer(
          width: double.infinity,
          height: 200,
          textSize: 14,
        );
      },
    );
  }

  Widget _buildSmallScreenList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return const quoteContainer(
          width: double.infinity,
          height: 180,
          textSize: 14,
          margin: EdgeInsets.zero,
        );
      },
    );
  }
}
