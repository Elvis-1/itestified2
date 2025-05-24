import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/favorites/presentation/widgets/favourite_icon.dart';
import 'package:provider/provider.dart';

class quoteContainer extends StatelessWidget {
  const quoteContainer({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 12),
    this.height = 162.0, 
    this.textSize = 12,
    required this.index, 
  });

  final EdgeInsets margin;
  final double height;
  final double textSize;
  final int index;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final favoritesViewModel = GetIt.I<FavoritesViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final width = screenWidth * 0.50; 

    final favoritedItem = FavoritedItem(
      id: index,
      type: 'inspiration',
      title: 'Inspirational Quote $index', 
      church: 'Southern Living',
      views: '100',
      date: '09/05/2025',
      imagePath: AppImages.quotesImage,
    );

    print('quoteContainer: Building index=$index, width=$width, height=$height');

    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print('quoteContainer: Tapped index=$index, opening modal');
              _showModalBottomSheet(context);
            },
            child: Container(
              height: height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(AppImages.quotesImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  const Align(
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
                    child: GestureDetector(
                      onTap: () {
                      
                      },
                      child: FavoriteIcon(
                        iconSize: 12,
                        radius: 12,
                        item: favoritedItem,
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
              'Source: Southern Living',
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